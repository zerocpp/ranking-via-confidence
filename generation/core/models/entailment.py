from abc import abstractmethod
import ast
import hashlib
import logging
import os
import pickle
from transformers import AutoModelForSequenceClassification, AutoTokenizer
from sentence_transformers import CrossEncoder
import torch
from collections import defaultdict
import torch.nn.functional as F
import openai as oai
import litellm
litellm.set_verbose=False
from litellm import completion

# Load environment variables from .env file
from dotenv import load_dotenv
load_dotenv()

# DeepSeek
DEEPSEEK_API_KEY = os.getenv("DEEPSEEK_API_KEY")
assert DEEPSEEK_API_KEY is not None, "Please set DEEPSEEK_API_KEY"
DeepSeekClient = oai.OpenAI(api_key=DEEPSEEK_API_KEY, base_url="https://api.deepseek.com")

# SiliconFlow
SILICONFLOW_MODEL_NAME="deepseek-ai/DeepSeek-V3"
SILICONFLOW_BASE_URL="https://api.siliconflow.cn/v1"
SILICONFLOW_API_KEY = os.getenv("SILICONFLOW_API_KEY")
assert SILICONFLOW_API_KEY is not None, "Please set SILICONFLOW_API_KEY"
# DeepSeekClient = oai.OpenAI(api_key=SILICONFLOW_API_KEY, base_url=SILICONFLOW_BASE_URL)




os.environ["OLLAMA_API_BASE"] = "http://localhost:11434"
# 使用镜像
os.environ['HF_ENDPOINT'] = 'https://hf-mirror.com'

# 默认优先级: cuda > mps > cpu
DEFAULT_DEVICE = 'cuda' if torch.cuda.is_available() else 'mps' if torch.backends.mps.is_available() else 'cpu'
# 设备
DEVICE = os.getenv("DEVICE", DEFAULT_DEVICE)

def md5hash(s: str) -> str:
    '''将字符串s序列化'''
    return hashlib.md5(str(s).encode('utf-8')).hexdigest()
    # return str(int(hashlib.md5(str(s).encode('utf-8')).hexdigest(), 16))

def ollama_call(model, prompt, temperature=1, max_tokens=20):
    response = completion(
        model=model,
        temperature=temperature,
        max_tokens=max_tokens,
        messages=[
            {"role": "user", "content": prompt}
        ]
    )
    return response.choices[0].message.content

def deepseek_call(model, prompt, temperature=0, max_tokens=20):
    # "deepseek-chat"
    try:
        response = DeepSeekClient.chat.completions.create(
            model=model,
            messages=[
                {"role": "system", "content": "You are a helpful assistant"},
                {"role": "user", "content": prompt},
            ],
            stream=False,
            max_tokens=max_tokens,
            logprobs=False,
            temperature=temperature,
        )
    except Exception as ex:
        print(f'error request: {ex}')
        return 'error'
    
    try:
        return response.choices[0].message.content
    except:
        print(f'error response: {response}')
        return 'error'


class BaseEntailment:
    def save_prediction_cache(self):
        pass

class EntailmentDeberta(BaseEntailment):
    def __init__(self, model_name="microsoft/deberta-v2-xxlarge-mnli"):
        self.model_name = model_name
        self.tokenizer = AutoTokenizer.from_pretrained(model_name)
        self.model = AutoModelForSequenceClassification.from_pretrained(
                model_name).to(DEVICE)

    def check_implication(self, text1, text2, prefix=None) -> int:
        '''
        ("A man is eating a sandwich.", "A man is eating food."),  # 2 (Entailment)
        ("A man is eating a sandwich.", "A woman is eating a sandwich."),  # 0 (Contradiction)
        ("A man is eating a sandwich.", "A man is sitting on a bench."),  # 1 (Neutral)
        '''
        if prefix:
            text1 = f'{prefix} {text1}'
            text2 = f'{prefix} {text2}'
        inputs = self.tokenizer(text1, text2, return_tensors="pt").to(DEVICE)
        # The model checks if text1 -> text2, i.e. if text2 follows from text1.
        # check_implication('The weather is good', 'The weather is good and I like you') --> 1
        # check_implication('The weather is good and I like you', 'The weather is good') --> 2
        outputs = self.model(**inputs)
        logits = outputs.logits
        # Deberta-mnli returns `neutral` and `entailment` classes at indices 1 and 2.
        largest_index = torch.argmax(F.softmax(logits, dim=1))  # pylint: disable=no-member
        prediction = largest_index.cpu().item()
        # if os.environ.get('DEBERTA_FULL_LOG', False):
        #     logging.info('Deberta Input: %s -> %s', text1, text2)
        #     logging.info('Deberta Prediction: %s', prediction)

        return prediction

class EntailmentLLM(BaseEntailment):
    def __init__(self, model='default', use_cache=True, entailment_file_path=None):
        self.model = model
        model_short_name = model.split('/')[-1]
        if entailment_file_path:
            self.entailment_file = entailment_file_path
        else:
            self.entailment_file = f'/mnt/sda/song/rerank/cache/entailment_cache_{model_short_name}.pkl'
        print(f'entailment_file: {self.entailment_file}')
        if use_cache:
            self.prediction_cache = self.init_prediction_cache()
        else:
            self.prediction_cache = dict()
        self.use_cache = use_cache

    def init_prediction_cache(self):
        if not os.path.exists(self.entailment_file):
            return dict()
        
        logging.info('Restoring prediction cache from %s', self.entailment_file)
        with open(self.entailment_file, "rb") as infile:
            return pickle.load(infile)

    def save_prediction_cache(self):
        # write the dictionary to a pickle file
        with open(self.entailment_file, 'wb') as f:
            pickle.dump(self.prediction_cache, f)

    def check_implication(self, text1, text2, prefix=None) -> int:
        prompt = self.equivalence_prompt(text1, text2, prefix)

        # logging.info('%s input: %s', self.model, prompt)

        hashed = md5hash(prompt)
        if self.use_cache and hashed in self.prediction_cache:
            # print('hit cache')
            response = self.prediction_cache[hashed]
        else:
            response = self.predict(prompt, temperature=0.02)
            self.prediction_cache[hashed] = response

        # logging.info('%s prediction: %s', self.model, response)

        binary_response = response.lower()[:30]
        if 'entailment' in binary_response:
            # print('entailment')
            return 2
        elif 'neutral' in binary_response:
            # print('neutral')
            return 1
        elif 'contradiction' in binary_response:
            # print('contradiction')
            return 0
        else:
            # logging.warning('MANUAL NEUTRAL!')
            print('else neutral!')
            print(binary_response)
            print()
            return 1
        
    def equivalence_prompt(self, text1, text2, question):
        prompt = f"""We are evaluating answers to the question \"{question}\"\n"""

        # To precise.
        prompt += "Here are two possible answers:\n"
        # Ah! This is much closer to what we are doing!
        # prompt = prompt + f"""Does at least one of the following two possible answers entail the other?
        # Still to precise.
        prompt += f"Possible Answer 1: {text1}\nPossible Answer 2: {text2}\n"
        prompt += "Does Possible Answer 1 semantically entail Possible Answer 2? Respond with only one of the following words: entailment, contradiction, or neutral. Do not provide any additional explanation.\n"
        prompt += "\nResponse:"

        return prompt

class EntailmentDeepSeek(EntailmentLLM):
    # def equivalence_prompt(self, text1, text2, question):
    #     prompt = f"""We are evaluating answers to the question \"{question}\"\n"""

    #     # To precise.
    #     prompt += "Here are two possible answers:\n"
    #     # Ah! This is much closer to what we are doing!
    #     # prompt = prompt + f"""Does at least one of the following two possible answers entail the other?
    #     # Still to precise.
    #     prompt += f"Possible Answer 1: {text1}\nPossible Answer 2: {text2}\n"
    #     prompt += "Does Possible Answer 1 semantically entail Possible Answer 2? Respond with only one of the following words: entailment, contradiction, or neutral. Do not provide any additional explanation.\n"
    #     prompt += "\nResponse:"

    #     return prompt

    def predict(self, prompt, temperature):
        return deepseek_call(self.model, prompt, temperature)
    
    def check_implication(self, text1, text2, prefix=None) -> int:
        prompt = self.equivalence_prompt(text1, text2, prefix)

        # logging.info('%s input: %s', self.model, prompt)

        hashed = md5hash(prompt)
        if self.use_cache and hashed in self.prediction_cache:
            response = self.prediction_cache[hashed]
            binary_response = response.lower()[:30]
            if 'entailment' not in binary_response and 'neutral' not in binary_response and 'contradiction' not in binary_response:
                print('cache error')
                response = self.predict(prompt, temperature=0.02)
                self.prediction_cache[hashed] = response
            else:
                pass
                # print('hit cache')
        else:
            response = self.predict(prompt, temperature=0.02)
            self.prediction_cache[hashed] = response

        # logging.info('%s prediction: %s', self.model, response)

        binary_response = response.lower()[:30]
        if 'entailment' in binary_response:
            # print('entailment')
            return 2
        elif 'neutral' in binary_response:
            # print('neutral')
            return 1
        elif 'contradiction' in binary_response:
            # print('contradiction')
            return 0
        else:
            # logging.warning('MANUAL NEUTRAL!')
            print('else neutral!')
            print(binary_response)
            print()
            raise ValueError(f'else neutral! {binary_response}')
            return 1

class EntailmentOllama(EntailmentLLM):
    # def equivalence_prompt(self, text1, text2, question):

    #     prompt = f"""We are evaluating answers to the question \"{question}\"\n"""

    #     # To precise.
    #     prompt += "Here are two possible answers:\n"
    #     # Ah! This is much closer to what we are doing!
    #     # prompt = prompt + f"""Does at least one of the following two possible answers entail the other?
    #     # Still to precise.
    #     prompt += f"Possible Answer 1: {text1}\nPossible Answer 2: {text2}\n"
    #     prompt += "Does Possible Answer 1 semantically entail Possible Answer 2? Respond with entailment, contradiction, or neutral."""

    #     return prompt

    def predict(self, prompt, temperature):
        return ollama_call(self.model, prompt, temperature)

if __name__ == '__main__':
    entail = EntailmentDeberta()
    print('entail model loaded')

        # check_implication('The weather is good', 'The weather is good and I like you') --> 1
        # check_implication('The weather is good and I like you', 'The weather is good') --> 2

    for text1, text2 in [('I am a student', 'I am a teacher'),
        ('I am a boy', 'I am a girl'),
        ('Paris is capital of France', 'Beijing is capital of France'),
        ('A man is eating pizza', 'A black race car starts up in front of a crowd of people.'),
        ('A man eats something', 'A man is driving down a lonely road.'),
        ('I am a boy', 'I am a boy'),
        ('Good', 'Great'),
        ('How many people are there in the world? 70 billion', 'How many people are there in the world? about 70 billion'),
        ('The weather is good', 'The weather is good and I like you'), # 1
        ('The weather is good and I like you', 'The weather is good'), # 2
        ("A man is eating a sandwich.", "A man is eating food."),  # 2 (Entailment)
("A man is eating a sandwich.", "A woman is eating a sandwich."),  # 0 (Contradiction)
("A man is eating a sandwich.", "A man is sitting on a bench."),  # 1 (Neutral)
        ]:
        res1 = entail.check_implication(text1, text2)
        print(text1, '|', text2, '| check_implication', res1)
