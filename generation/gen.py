"""
Generate answers for a dataset using a specified model.
"""

import gc
import os
import logging
import random
from tqdm import tqdm
import argparse
import numpy as np
import torch
import pickle
import jsonlines

# Load environment variables from .env file
from dotenv import load_dotenv
load_dotenv()

from core.utils import utils
from core.models.huggingface_models import HuggingfaceModel


def setup_logger():
    """Setup logger to always print time and level."""
    logging.basicConfig(
        format='%(asctime)s %(levelname)-8s %(message)s',
        level=logging.INFO,
        datefmt='%Y-%m-%d %H:%M:%S')
    logging.getLogger().setLevel(logging.FATAL)  # logging.DEBUG

def make_brief_prompt(question, context=None):
    prompt = "Answer the following question as briefly as possible.\n"
    if context:
        prompt += f"Context: {context}"
    prompt += f"Question: {question}"
    prompt += f"Answer:"
    return prompt

def load_pickle_file(file_path):
    with open(file_path, 'rb') as f:
        data = pickle.load(f)
    return data


def main(args):
    model = HuggingfaceModel(args.model, stop_sequences='default', max_new_tokens=args.max_new_tokens)

    if not os.path.exists(args.output_dir):
        os.makedirs(args.output_dir)

    assert args.dataset_jsonl_path.endswith('.jsonl')

    def generate_response(prompt, temperature, return_latent):
        last_error = None
        for _ in range(args.retry_times):
            output = model.predict(prompt, temperature=temperature, return_latent=return_latent)
            if 'error' not in output:
                return output
            last_error = output['error']
        if last_error is not None:
            return {'error': last_error}
    
    def load_result(id_):
        file_path = os.path.join(args.output_dir, f"{id_}.pkl")
        if not os.path.exists(file_path):
            return {
                'id': id_,
                'greedy': None,
                'sample': [],
            }
        return load_pickle_file(file_path)
    
    def save_result(result):
        file_path = os.path.join(args.output_dir, f"{result['id']}.pkl")
        os.makedirs(os.path.dirname(file_path), exist_ok=True)
        with open(file_path, 'wb') as f:
            pickle.dump(result, f)
        
    def gen_greedy(item, result):
        question = item['question']
        context = item['context']
        prompt = make_brief_prompt(question, context)

        if args.override or result['greedy'] is None:
            response = generate_response(prompt, temperature=0.1, return_latent=True)
            if 'error' not in response:
                result['greedy'] = response
            else:
                print(f"{item['id']} greedy generation error: {response['error']}")

    def gen_sample(item, result):
        question = item['question']
        context = item['context']
        prompt = make_brief_prompt(question, context)

        num_gen = max(0, args.num_generations - len(result['sample']))
        if args.override or num_gen > 0:
            for _ in range(num_gen):
                response = generate_response(prompt, temperature=1.0, return_latent=False)
                if 'error' not in response:
                    result['sample'].append(response)
                else:
                    print(f"{item['id']} sample generation error: {response['error']}")

    def get_task_total_count():
        with jsonlines.open(args.dataset_jsonl_path) as reader:
            return len(list(reader))
    total_count = get_task_total_count()

    with jsonlines.open(args.dataset_jsonl_path) as reader:
        for i, item in enumerate(tqdm(reader, desc="RankGen", total=total_count)):
            if i % 10 == 0:
                gc.collect()
                torch.cuda.empty_cache()

            id_ = item['id']
            result = load_result(id_)
            gen_greedy(item, result)
            gen_sample(item, result)
            save_result(result)

'''
python gen.py --dataset_jsonl_path /mnt/sda/song/rerank/dataset/nq-bm25-top10.jsonl --output_dir /mnt/sda/song/rerank/gen/qwen7b/nq
--model Qwen/Qwen2.5-7B-Instruct
--model meta-llama/Llama-3.1-8B-Instruct
'''

def get_parser():
    parser = argparse.ArgumentParser()
    parser.add_argument('--model', type=str, default='Qwen/Qwen2.5-7B-Instruct')
    parser.add_argument('--num_generations', type=int, default=20, help='sampled generations per question')
    parser.add_argument('--retry_times', type=int, default=3)
    parser.add_argument("--max_new_tokens", type=int, default=100)
    parser.add_argument("--override", default=False, action=argparse.BooleanOptionalAction)

    parser.add_argument("--dataset_jsonl_path", type=str)
    parser.add_argument('--output_dir', type=str)
    return parser

if __name__ == '__main__':
    setup_logger()
    parser = get_parser()
    args, unknown = parser.parse_known_args()
    if unknown:
        raise ValueError(f'Unkown args: {unknown}')
    print(f"args: {args}")
    main(args)
    print("Done!")

