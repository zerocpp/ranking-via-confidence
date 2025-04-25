import gc
import os
import pickle
import torch
from tqdm import tqdm
from collections import defaultdict
import argparse
from core.models.entailment import EntailmentDeberta, EntailmentOllama, EntailmentDeepSeek
from core.data.data_utils import load_ds_from_json
import jsonlines

def load_pickle_file(file_path):
    with open(file_path, 'rb') as f:
        data = pickle.load(f)
    return data

def save_pickle_file(file_path, data):
    with open(file_path, 'wb') as f:
        pickle.dump(data, f)

def get_parser():
    parser = argparse.ArgumentParser()
    parser.add_argument("--dataset_path", type=str, required=True, help="jsonl file path")
    parser.add_argument("--input_dir", type=str, required=True, help="Directory containing generated pickle files")
    parser.add_argument("--output_dir", type=str, required=True, help="Directory to save clustered pickle files")
    parser.add_argument("--model", type=str, default="microsoft/deberta-v2-xxlarge-mnli")
    parser.add_argument("--model_type", type=str, default="deberta")
    parser.add_argument("--override", default=False, action=argparse.BooleanOptionalAction)
    parser.add_argument("--num_samples", type=int, default=10, help="Number of samples to use to cluster")
    parser.add_argument("--cache_file_path", type=str, default=None, help="Path to cache file")
    parser.add_argument("--use_cache", default=True, action=argparse.BooleanOptionalAction)
    return parser

def get_semantic_ids(strings_list, model, question, strict_entailment=False):
    """Group list of predictions into semantic meaning."""
    def are_equivalent(text1, text2):
        implication_1 = model.check_implication(text1, text2, question)
        implication_2 = model.check_implication(text2, text1, question)  # pylint: disable=arguments-out-of-order
        assert (implication_1 in [0, 1, 2]) and (implication_2 in [0, 1, 2])

        if strict_entailment:
            semantically_equivalent = (implication_1 == 2) and (implication_2 == 2)
        else:
            implications = [implication_1, implication_2]
            # Check if none of the implications are 0 (contradiction) and not both of them are neutral.
            semantically_equivalent = (0 not in implications) and ([1, 1] != implications)

        return semantically_equivalent

    # Initialise all ids with -1.
    semantic_set_ids = [-1] * len(strings_list)
    # Keep track of current id.
    next_id = 0
    for i, string1 in enumerate(strings_list):
        # Check if string1 already has an id assigned.
        if semantic_set_ids[i] == -1:
            # If string1 has not been assigned an id, assign it next_id.
            semantic_set_ids[i] = next_id
            for j in range(i+1, len(strings_list)):
                # Search through all remaining strings. If they are equivalent to string1, assign them the same id.
                if are_equivalent(string1, strings_list[j]):
                    semantic_set_ids[j] = next_id
            next_id += 1

    assert -1 not in semantic_set_ids

    return semantic_set_ids

def main(args):
    assert os.path.exists(args.input_dir)

    if not os.path.exists(args.output_dir):
        os.makedirs(args.output_dir)

    # Load dataset
    assert args.dataset_path, "Dataset path is required."
    assert args.dataset_path.endswith('.jsonl'), "Dataset path must be a jsonl file."
    def get_task_total_count():
        '''Get total number of tasks'''
        with jsonlines.open(args.dataset_path) as reader:
            return len(list(reader))
    total_count = get_task_total_count()

    # Load generation result
    def load_gen_result(id_):
        file_path = os.path.join(args.input_dir, f"{id_}.pkl")
        if os.path.exists(file_path):
            return load_pickle_file(file_path)
        return None
    
    # Load list of sampled texts
    def load_sample_text_list(id_):
        result = load_gen_result(id_)
        if result is None:
            return []
        return [s['text'] for s in result['sample']]
    
    # Load clustering results
    def load_cluster_ids(id_):
        file_path = os.path.join(args.output_dir, f"{id_}.pkl")
        if os.path.exists(file_path):
            return load_pickle_file(file_path)
        return []
    
    # Save clustering results
    def save_cluster_ids(id_, cluster_ids):
        file_path = os.path.join(args.output_dir, f"{id_}.pkl")
        os.makedirs(os.path.dirname(file_path), exist_ok=True)
        save_pickle_file(file_path, cluster_ids)

    # Load NLI model
    if args.model_type == 'deberta':
        print(f"Loading Deberta model: {args.model}")
        model = EntailmentDeberta(args.model)
    elif args.model_type == 'ollama':
        print(f"Loading Ollama model: {args.model}")
        model = EntailmentOllama(args.model, use_cache=args.use_cache, entailment_file_path=args.cache_file_path)
    elif args.model_type == 'deepseek':
        print(f"Loading DeepSeek model: {args.model}")
        model = EntailmentDeepSeek(args.model, use_cache=args.use_cache, entailment_file_path=args.cache_file_path)
    else:
        raise ValueError(f"Invalid model type: {args.model_type}")

    with jsonlines.open(args.dataset_path) as reader:
        for i, item in enumerate(tqdm(reader, desc="cluster", total=total_count)):
            # Free GPU memory
            if i % 10 == 0:
                gc.collect()
                torch.cuda.empty_cache()

            # # Save Entailment cache
            # if i % 10 == 0:
            #     model.save_prediction_cache()

            id_ = item['id']
            sample_texts = load_sample_text_list(id_)
            if sample_texts is None or len(sample_texts) == 0:
                continue # Skip if generation result is empty
            sample_texts = sample_texts[:args.num_samples] # Take only the first num_samples samples

            cluster_ids = load_cluster_ids(id_)
            execute = args.override
            if cluster_ids is None: # If clustering result is empty
                execute = True
            elif len(cluster_ids) >= args.num_samples: # If number of clustering results is greater than or equal to number of samples
                execute = False
            else:
                num_responses = len(sample_texts)
                num_cluster_ids = len(cluster_ids)
                if num_cluster_ids < num_responses: # If number of clusters is less than number of generated responses
                    execute = True
                # if num_responses != num_cluster_ids: # If number of responses and clusters are not equal
                #     execute = True
            
            if not execute:
                continue # Skip if execution is not needed
            
            # Perform clustering
            try:
                cluster_ids = get_semantic_ids(sample_texts, 
                                        model=model, 
                                        question=item['question'],
                                        strict_entailment=False)
                # Save clustering results
                save_cluster_ids(id_, cluster_ids)
            except Exception as ex:
                print(f"Error: {ex}")

if __name__ == '__main__':
    parser = get_parser()
    args = parser.parse_args()
    print('> Args:', args)
    main(args)
    print('> Done!')