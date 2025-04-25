"""Implement HuggingfaceModel models."""
import ast
import copy
import logging
import os
from collections import Counter

import torch

from transformers import AutoTokenizer
from transformers import AutoConfig
from transformers import AutoModelForCausalLM
from transformers import StoppingCriteria
from transformers import StoppingCriteriaList
from huggingface_hub import snapshot_download


from core.models.base_model import BaseModel
from core.models.base_model import STOP_SEQUENCES

import dotenv
dotenv.load_dotenv()

# 使用镜像
os.environ['HF_ENDPOINT'] = 'https://hf-mirror.com'

# 默认优先级: cuda > mps > cpu
DEFAULT_DEVICE = 'cuda' if torch.cuda.is_available() else 'mps' if torch.backends.mps.is_available() else 'cpu'
# 设备
DEVICE = os.getenv("DEVICE", DEFAULT_DEVICE)



class StoppingCriteriaSub(StoppingCriteria):
    """Stop generations when they match a particular text or token."""
    def __init__(self, stops, tokenizer, match_on='text', initial_length=None):
        super().__init__()
        self.stops = stops
        self.initial_length = initial_length
        self.tokenizer = tokenizer
        self.match_on = match_on
        if self.match_on == 'tokens':
            self.stops = [torch.tensor(self.tokenizer.encode(i)).to(DEVICE) for i in self.stops]
            print(self.stops)

    def __call__(self, input_ids: torch.LongTensor, scores: torch.FloatTensor):
        del scores
        for stop in self.stops:
            if self.match_on == 'text':
                generation = self.tokenizer.decode(input_ids[0][self.initial_length:], skip_special_tokens=False)
                match = stop in generation
            elif self.match_on == 'tokens':
                # Can be dangerous due to tokenizer ambiguities.
                match = stop in input_ids[0][-len(stop):]
            else:
                raise
            if match:
                return True
        return False


def remove_split_layer(device_map_in):
    """Modify device maps s.t. individual layers are not spread across devices."""

    device_map = copy.deepcopy(device_map_in)
    destinations = list(device_map.keys())

    counts = Counter(['.'.join(i.split('.')[:2]) for i in destinations])

    found_split = False
    for layer, count in counts.items():
        if count == 1:
            continue

        if found_split:
            # Only triggers if we find more than one split layer!
            raise ValueError(
                'More than one split layer.\n'
                f'Currently at layer {layer}.\n'
                f'In map: {device_map_in}\n'
                f'Out map: {device_map}\n')

        logging.info(f'Split layer is {layer}.')

        # remove split for that layer
        for name in list(device_map.keys()):
            if name.startswith(layer):
                print(f'pop {name}')
                device = device_map.pop(name)

        device_map[layer] = device
        found_split = True

    return device_map


class HuggingfaceModel(BaseModel):
    """HuggingfaceModel."""

    def __init__(self, model_name, stop_sequences=None, max_new_tokens=None):
        # todo: 去掉base，只用model_name
        # todo: max_new_tokens在模型分支内设置

        if max_new_tokens is None:
            raise
        self.max_new_tokens = max_new_tokens

        if stop_sequences == 'default':
            stop_sequences = STOP_SEQUENCES
        if 'qwen' in model_name.lower():
            # Qwen/Qwen2.5-7B-Instruct
            self.tokenizer = AutoTokenizer.from_pretrained(
                model_name, 
                # device_map="auto",
                token_type_ids=None)

            self.model = AutoModelForCausalLM.from_pretrained(
                model_name, 
                # device_map="auto",
                trust_remote_code=True,
                torch_dtype=torch.bfloat16,
            ).to(DEVICE)
            # Context Length:32k, Generation Length:8k
            self.token_limit = 4096
        elif 'llama' in model_name.lower():
            # meta-llama/Llama-3.1-8B-Instruct
            self.tokenizer = AutoTokenizer.from_pretrained(
                model_name, 
                # device_map="auto",
                token_type_ids=None)

            self.model = AutoModelForCausalLM.from_pretrained(
                model_name, 
                # device_map="auto",
                trust_remote_code=True,
                torch_dtype=torch.bfloat16,
            ).to(DEVICE)
            # Context Length:128k
            self.token_limit = 4096

        # elif 'mistral' in model_name.lower():
        #     model_id = f'mistralai/{model_name}'
        #     self.tokenizer = AutoTokenizer.from_pretrained(
        #         model_id, device_map='auto', token_type_ids=None,
        #         clean_up_tokenization_spaces=False)

        #     self.model = AutoModelForCausalLM.from_pretrained(
        #         model_id,
        #         device_map='auto',
        #         trust_remote_code=True,
        #     )

        # elif 'falcon' in model_name:
        #     model_id = f'tiiuae/{model_name}'
        #     self.tokenizer = AutoTokenizer.from_pretrained(
        #         model_id, device_map='auto', token_type_ids=None,
        #         clean_up_tokenization_spaces=False)

        #     self.model = AutoModelForCausalLM.from_pretrained(
        #         model_id,
        #         device_map='auto',
        #         trust_remote_code=True,
        #     )
        # elif 'phi' in model_name.lower():
        #     model_id = f'microsoft/{model_name}'  # e.g. Phi-3-mini-128k-instruct
        #     self.tokenizer = AutoTokenizer.from_pretrained(
        #         model_id, 
        #         device_map='auto', 
        #         token_type_ids=None,
        #         clean_up_tokenization_spaces=False)
        #     self.model = AutoModelForCausalLM.from_pretrained(
        #         model_id,
        #         device_map='auto',
        #         trust_remote_code=True,
        #     )
        # elif 'gemma' in model_name:
        #     model_id = f'google/{model_name}'  # e.g. gemma-7b-it
        #     self.tokenizer = AutoTokenizer.from_pretrained(
        #         model_id, device_map='auto', token_type_ids=None,
        #         clean_up_tokenization_spaces=False)
        #     self.model = AutoModelForCausalLM.from_pretrained(
        #         model_id,
        #         device_map='auto',
        #         trust_remote_code=True,
        #         torch_dtype=torch.bfloat16
        #     )
        else:
            raise ValueError

        self.model_name = model_name
        self.stop_sequences = stop_sequences + [self.tokenizer.eos_token]
        # fixme: 需要根据模型调整
        # self.token_limit = 2048


    def predict(self, input_data, temperature, return_full=False, return_latent=False):

        if isinstance(input_data, tuple):
            logging.WARNING("INPUT IS A TUPLE.")
            input_data = input_data[0]

        inputs = self.tokenizer(input_data, return_tensors="pt").to(DEVICE)

        if 'qwen' in self.model_name.lower() or 'llama' in self.model_name.lower() or 'falcon' in self.model_name or 'mistral' in self.model_name.lower():
            if 'token_type_ids' in inputs:  # HF models seems has changed.
                del inputs['token_type_ids']
            pad_token_id = self.tokenizer.eos_token_id
        else:
            pad_token_id = None

        if self.stop_sequences is not None:
            stopping_criteria = StoppingCriteriaList([StoppingCriteriaSub(
                stops=self.stop_sequences,
                initial_length=len(inputs['input_ids'][0]),
                tokenizer=self.tokenizer)])
        else:
            stopping_criteria = None

        logging.debug('temperature: %f', temperature)
        with torch.no_grad():
            outputs = self.model.generate(
                **inputs,
                max_new_tokens=self.max_new_tokens,
                return_dict_in_generate=True,
                output_scores=True,
                output_hidden_states=True,
                temperature=temperature,
                do_sample=True,
                stopping_criteria=stopping_criteria,
                pad_token_id=pad_token_id,
            )

        if len(outputs.sequences[0]) > self.token_limit:
            return {'error': 'Generation exceeding token limit.'}

        full_answer = self.tokenizer.decode(
            outputs.sequences[0], skip_special_tokens=True)

        if return_full:
            return {'text': full_answer,}

        # # For some models, we need to remove the input_data from the answer.
        # if full_answer.startswith(input_data):
        #     input_data_offset = len(input_data)
        # else:
        #     print('Error: Input not found in answer.')
        #     print(f'full_answer: {full_answer}')
        #     print(f'input_data: {input_data}')
        #     return {'error': 'Input not found in answer.'}

        # # Remove input from answer.
        # answer = full_answer[input_data_offset:]

        # # Remove stop_words from answer.
        # stop_at = len(answer)
        # sliced_answer = answer
        # if self.stop_sequences is not None:
        #     for stop in self.stop_sequences:
        #         if answer.endswith(stop):
        #             stop_at = len(answer) - len(stop)
        #             sliced_answer = answer[:stop_at]
        #             break
        #     if not all([stop not in sliced_answer for stop in self.stop_sequences]):
        #         error_msg = 'Error: Stop words not removed successfully!'
        #         error_msg += f'Answer: >{answer}< '
        #         error_msg += f'Sliced Answer: >{sliced_answer}<'
        #         logging.error(error_msg)

        # # Remove whitespaces from answer (in particular from beginning.)
        # sliced_answer = sliced_answer.strip()
        # token_stop_index = self.tokenizer(full_answer[:input_data_offset + stop_at], return_tensors="pt")['input_ids'].shape[1]
        # n_input_token = len(inputs['input_ids'][0])
        # n_generated = token_stop_index - n_input_token

        # 获取输入和生成的token数量
        n_input_token = len(inputs['input_ids'][0])
        generated_ids = outputs.sequences[0][n_input_token:]  # 截取生成部分
        # 解码生成部分
        answer = self.tokenizer.decode(generated_ids, skip_special_tokens=True)

        # 处理停止词（保留原有逻辑）
        stop_at = len(answer)
        sliced_answer = answer
        if self.stop_sequences is not None:
            for stop in self.stop_sequences:
                if answer.endswith(stop):
                    stop_at = len(answer) - len(stop)
                    sliced_answer = answer[:stop_at]
                    break
        
        sliced_answer = sliced_answer.strip()

        n_generated = len(generated_ids)  # 生成的token数量

        if n_generated == 0:
            logging.warning('Only stop_words were generated. For likelihoods and embeddings, taking stop word instead.')
            n_generated = 1

        if 'decoder_hidden_states' in outputs.keys():
            hidden = outputs.decoder_hidden_states
        else:
            hidden = outputs.hidden_states

        if len(hidden) == 1:
            logging.warning(
                'Taking first and only generation for hidden! '
                'n_generated: %d, n_input_token: %d, '
                'last_token: %s, generation was: %s',
                n_generated, n_input_token,
                self.tokenizer.decode(outputs['sequences'][0][-1]),
                full_answer,
                )
            last_input = hidden[0]
        elif ((n_generated - 1) >= len(hidden)):
            # if access idx is larger/equal
            logging.error(
                'Taking last state because n_generated is too large'
                'n_generated: %d, n_input_token: %d, '
                'last_token: %s, generation was: %s, slice_answer: %s',
                n_generated, n_input_token, 
                self.tokenizer.decode(outputs['sequences'][0][-1]),
                full_answer, sliced_answer
                )
            last_input = hidden[-1]
        else:
            last_input = hidden[n_generated - 1]

        # Then access last layer for input
        last_layer = last_input[-1]
        # Then access last token in input.
        last_token_embedding = last_layer[:, -1, :].cpu()

        sec_last_token_embedding = None
        last_tok_bef_gen_embedding = None
        if return_latent:
            # Stack second last token embeddings from all layers 
            if len(hidden) == 1:  # FIX: runtime error for mistral-7b on bioasq
                sec_last_input = hidden[0]
            elif ((n_generated - 2) >= len(hidden)):
                sec_last_input = hidden[-2]
            else:
                sec_last_input = hidden[n_generated - 2]
            sec_last_token_embedding = torch.stack([layer[:, -1, :] for layer in sec_last_input]).cpu()
    
            # Get the last input token embeddings (before generated tokens)
            last_tok_bef_gen_input = hidden[0]
            last_tok_bef_gen_embedding = torch.stack([layer[:, -1, :] for layer in last_tok_bef_gen_input]).cpu()

        # Get log_likelihoods.
        transition_scores = self.model.compute_transition_scores(
            outputs.sequences, outputs.scores, normalize_logits=True)
        log_likelihoods = [score.item() for score in transition_scores[0]]
        if len(log_likelihoods) == 1:
            logging.warning('Taking first and only generation for log likelihood!')
            log_likelihoods = log_likelihoods
        else:
            log_likelihoods = log_likelihoods[:n_generated]

        if len(log_likelihoods) == self.max_new_tokens:
            logging.warning('Generation interrupted by max_token limit.')

        if len(log_likelihoods) == 0:
            raise ValueError

        hidden_states = (last_token_embedding,)

        if return_latent:
            hidden_states += (sec_last_token_embedding, last_tok_bef_gen_embedding)
        else:
            hidden_states += (None, None)

        return {
            'text': sliced_answer,
            'log_likelihoods': log_likelihoods,
            'hidden_states': {
                'last_token_embedding': last_token_embedding,
                'sec_last_token_embedding': sec_last_token_embedding,
                'last_tok_bef_gen_embedding': last_tok_bef_gen_embedding,
            }
        }

    
    # def predict(self, input_data, temperature, return_full=False, return_latent=False):

    #     if isinstance(input_data, tuple):
    #         logging.WARNING("INPUT IS A TUPLE.")
    #         input_data = input_data[0]

    #     inputs = self.tokenizer(input_data, return_tensors="pt").to(DEVICE)

    #     if 'qwen' in self.model_name.lower() or 'llama' in self.model_name.lower() or 'falcon' in self.model_name or 'mistral' in self.model_name.lower():
    #         if 'token_type_ids' in inputs:  # HF models seems has changed.
    #             del inputs['token_type_ids']
    #         pad_token_id = self.tokenizer.eos_token_id
    #     else:
    #         pad_token_id = None

    #     if self.stop_sequences is not None:
    #         stopping_criteria = StoppingCriteriaList([StoppingCriteriaSub(
    #             stops=self.stop_sequences,
    #             initial_length=len(inputs['input_ids'][0]),
    #             tokenizer=self.tokenizer)])
    #     else:
    #         stopping_criteria = None

    #     logging.debug('temperature: %f', temperature)
    #     with torch.no_grad():
    #         outputs = self.model.generate(
    #             **inputs,
    #             max_new_tokens=self.max_new_tokens,
    #             return_dict_in_generate=True,
    #             output_scores=True,
    #             output_hidden_states=True,
    #             temperature=temperature,
    #             do_sample=True,
    #             stopping_criteria=stopping_criteria,
    #             pad_token_id=pad_token_id,
    #         )

    #     if len(outputs.sequences[0]) > self.token_limit:
    #         return {'error': 'Generation exceeding token limit.'}

    #     full_answer = self.tokenizer.decode(
    #         outputs.sequences[0], skip_special_tokens=True)

    #     if return_full:
    #         return {'text': full_answer,}

    #     # For some models, we need to remove the input_data from the answer.
    #     if full_answer.startswith(input_data):
    #         input_data_offset = len(input_data)
    #     else:
    #         print('Error: Input not found in answer.')
    #         print(f'full_answer: {full_answer}')
    #         print(f'input_data: {input_data}')
    #         return {'error': 'Input not found in answer.'}

    #     # Remove input from answer.
    #     answer = full_answer[input_data_offset:]

    #     # Remove stop_words from answer.
    #     stop_at = len(answer)
    #     sliced_answer = answer
    #     if self.stop_sequences is not None:
    #         for stop in self.stop_sequences:
    #             if answer.endswith(stop):
    #                 stop_at = len(answer) - len(stop)
    #                 sliced_answer = answer[:stop_at]
    #                 break
    #         if not all([stop not in sliced_answer for stop in self.stop_sequences]):
    #             error_msg = 'Error: Stop words not removed successfully!'
    #             error_msg += f'Answer: >{answer}< '
    #             error_msg += f'Sliced Answer: >{sliced_answer}<'
    #             logging.error(error_msg)

    #     # Remove whitespaces from answer (in particular from beginning.)
    #     sliced_answer = sliced_answer.strip()
    #     token_stop_index = self.tokenizer(full_answer[:input_data_offset + stop_at], return_tensors="pt")['input_ids'].shape[1]
    #     n_input_token = len(inputs['input_ids'][0])
    #     n_generated = token_stop_index - n_input_token

    #     if n_generated == 0:
    #         logging.warning('Only stop_words were generated. For likelihoods and embeddings, taking stop word instead.')
    #         n_generated = 1

    #     if 'decoder_hidden_states' in outputs.keys():
    #         hidden = outputs.decoder_hidden_states
    #     else:
    #         hidden = outputs.hidden_states

    #     if len(hidden) == 1:
    #         logging.warning(
    #             'Taking first and only generation for hidden! '
    #             'n_generated: %d, n_input_token: %d, token_stop_index %d, '
    #             'last_token: %s, generation was: %s',
    #             n_generated, n_input_token, token_stop_index,
    #             self.tokenizer.decode(outputs['sequences'][0][-1]),
    #             full_answer,
    #             )
    #         last_input = hidden[0]
    #     elif ((n_generated - 1) >= len(hidden)):
    #         # if access idx is larger/equal
    #         logging.error(
    #             'Taking last state because n_generated is too large'
    #             'n_generated: %d, n_input_token: %d, token_stop_index %d, '
    #             'last_token: %s, generation was: %s, slice_answer: %s',
    #             n_generated, n_input_token, token_stop_index,
    #             self.tokenizer.decode(outputs['sequences'][0][-1]),
    #             full_answer, sliced_answer
    #             )
    #         last_input = hidden[-1]
    #     else:
    #         last_input = hidden[n_generated - 1]

    #     # Then access last layer for input
    #     last_layer = last_input[-1]
    #     # Then access last token in input.
    #     last_token_embedding = last_layer[:, -1, :].cpu()

    #     sec_last_token_embedding = None
    #     last_tok_bef_gen_embedding = None
    #     if return_latent:
    #         # Stack second last token embeddings from all layers 
    #         if len(hidden) == 1:  # FIX: runtime error for mistral-7b on bioasq
    #             sec_last_input = hidden[0]
    #         elif ((n_generated - 2) >= len(hidden)):
    #             sec_last_input = hidden[-2]
    #         else:
    #             sec_last_input = hidden[n_generated - 2]
    #         sec_last_token_embedding = torch.stack([layer[:, -1, :] for layer in sec_last_input]).cpu()
    
    #         # Get the last input token embeddings (before generated tokens)
    #         last_tok_bef_gen_input = hidden[0]
    #         last_tok_bef_gen_embedding = torch.stack([layer[:, -1, :] for layer in last_tok_bef_gen_input]).cpu()

    #     # Get log_likelihoods.
    #     transition_scores = self.model.compute_transition_scores(
    #         outputs.sequences, outputs.scores, normalize_logits=True)
    #     log_likelihoods = [score.item() for score in transition_scores[0]]
    #     if len(log_likelihoods) == 1:
    #         logging.warning('Taking first and only generation for log likelihood!')
    #         log_likelihoods = log_likelihoods
    #     else:
    #         log_likelihoods = log_likelihoods[:n_generated]

    #     if len(log_likelihoods) == self.max_new_tokens:
    #         logging.warning('Generation interrupted by max_token limit.')

    #     if len(log_likelihoods) == 0:
    #         raise ValueError

    #     hidden_states = (last_token_embedding,)

    #     if return_latent:
    #         hidden_states += (sec_last_token_embedding, last_tok_bef_gen_embedding)
    #     else:
    #         hidden_states += (None, None)

    #     return {
    #         'text': sliced_answer,
    #         'log_likelihoods': log_likelihoods,
    #         'hidden_states': {
    #             'last_token_embedding': last_token_embedding,
    #             'sec_last_token_embedding': sec_last_token_embedding,
    #             'last_tok_bef_gen_embedding': last_tok_bef_gen_embedding,
    #         }
    #     }

    def get_p_true(self, input_data):
        """Get the probability of the model anwering A (True) for the given input"""

        input_data += ' A'
        tokenized_prompt_true = self.tokenizer(input_data, return_tensors='pt').to(DEVICE)['input_ids']

        target_ids_true = tokenized_prompt_true.clone()
        # Set all target_ids except the last one to -100.
        target_ids_true[0, :-1] = -100

        with torch.no_grad():
            model_output_true = self.model(tokenized_prompt_true, labels=target_ids_true)

        loss_true = model_output_true.loss

        return -loss_true.item()

    def get_perplexity(self, input_data):
        """Get the probability of the model anwering A (True) for the given input"""

        tokenized_data = self.tokenizer(input_data, return_tensors='pt').to(DEVICE)['input_ids']

        with torch.no_grad():
            model_output_true = self.model(tokenized_data, labels=tokenized_data)

        perplexity = - model_output_true.loss.item()


        return perplexity
