from collections import defaultdict
import json
import os
from string import Template

import numpy as np
from tqdm import tqdm
from util import load_qrels, load_rank_results, filter_top_k_results, results_to_tsv, load_pickle_file, save_pickle_file, eval_rank_results
from util import compute_predictive_entropy, compute_normalized_predictive_entropy, compute_semantic_entropy, compute_normalized_semantic_entropy, compute_max_semantic_cluster_proportion
from util import reverse_measure_data, std_measure_data

from three_bins_method import eval_three_bins_method
from doc_diff_score_method import eval_doc_diff_score_method
from doc_query_diff_method import eval_doc_query_diff_method
from naive_method import eval_naive_method

import argparse

# Template for generation path
GEN_PATH_TEMPLATE = Template("/mnt/sda/song/rerank/gen/$gen_model/$dataset_name/$dataset_name-$qid-$docid.pkl")
# Template for clustering path
CLUSTER_PATH_TEMPLATE = Template("/mnt/sda/song/rerank/cluster/$gen_model/$cluster_model/$dataset_name/$dataset_name-$qid-$docid.pkl")
# Directory for BEIR datasets
BEIR_DATASET_DIR = "/home/song/dataset/beir"
# Number of samples for clustering
CLUSTER_SAMPLE_NUM = 10
# No threshold limit for query confidence
NO_QUERY_CONF_THRESHOLDS = 1.0 # 1.0 means no limit

# Previous retrieval names
PREV_NAMES = ["bm25", "contriever"]
# Generation models
GEN_MODELS = ['qwen7b', 'llama8b', 'dsv3']

EVAL = ('ndcg', 'NDCG@10')
def extract_score(score):
    return score[EVAL[0]][EVAL[1]]
def get_max_score(scores):
    if EVAL[0] in scores:
        return extract_score(scores)
    else:
        return max([get_max_score(score) for score in scores.values()])

def get_parser():
    parser = argparse.ArgumentParser()
    parser.add_argument('--dataset_name', type=str, help='Dataset name, e.g., nq')
    parser.add_argument('--rank_result_filename', type=str, help='Filename of the retrieval results, without path, e.g., nq-bm25-top10-q100.csv')    
    parser.add_argument('--gen_model', type=str, help='Abbreviation of the generation model, e.g., qwen7b/llama8b/dsv3. If not provided, the "ours" method will not be executed')
    parser.add_argument('--cluster_model', type=str, help='Abbreviation of the clustering model, e.g., qwen7b/llama8b/dsv3')
    parser.add_argument('--score_filename', type=str, help='Filename for the scoring results, without path, e.g., nq-bm25-qwen7b.json. Defaults to $rank_result_filename-$gen_model.json')
    parser.add_argument('--measure_key', type=str, default='cse', help='Measurement method, e.g., mscr/mscp/cmscp/cse. Defaults to cse')
    parser.add_argument('--ours', default=False, action=argparse.BooleanOptionalAction, help='Whether to execute the "ours" method. Defaults to False')

    parser.add_argument('--rank_result_dir', type=str, default='/mnt/sda/song/rerank/result', help='Directory path for ranking results. Defaults to /mnt/sda/song/rerank/result')
    parser.add_argument('--score_dir', type=str, default='/mnt/sda/song/rerank/score', help='Directory path for saving scores. Defaults to /mnt/sda/song/rerank/score')
    parser.add_argument('--beir_dir', type=str, default='/home/song/dataset/beir', help='Root directory for BEIR datasets, used to load queries, docs, qrels. Defaults to /home/song/dataset/beir')
    return parser

# Load cluster results
def load_cluster_ids(gen_model, cluster_model, dataset_name, qid, docid):
    cluster_path = CLUSTER_PATH_TEMPLATE.substitute(gen_model=gen_model, cluster_model=cluster_model, dataset_name=dataset_name, qid=qid, docid=docid)
    if os.path.exists(cluster_path):
        return load_pickle_file(cluster_path)[:CLUSTER_SAMPLE_NUM]
    return None

# Load likelihood results
def load_likelihoods(gen_model, dataset_name, qid, docid):
    gen_path = GEN_PATH_TEMPLATE.substitute(gen_model=gen_model, dataset_name=dataset_name, qid=qid, docid=docid)
    if os.path.exists(gen_path):
        gen_result = load_pickle_file(gen_path)
        greedy = gen_result.get('greedy')
        if greedy is not None and 'log_likelihoods' in greedy:
            return greedy['log_likelihoods'][:CLUSTER_SAMPLE_NUM]
    return None

def make_mscr_data(rank_results, dataset_name, gen_model, cluster_model):
    data = {}
    for qid, doc_ids in rank_results.items():
        data[qid] = {}
        for doc_id in ['no']+list(doc_ids.keys()):
            cluster_ids = load_cluster_ids(gen_model, cluster_model, dataset_name, qid, doc_id)
            mscr = compute_max_semantic_cluster_proportion(cluster_ids)
            data[qid][doc_id] = mscr
    return data

def make_cse_data(rank_results, dataset_name, gen_model, cluster_model):
    data = {}
    for qid, doc_ids in rank_results.items():
        data[qid] = {}
        for doc_id in ['no']+list(doc_ids.keys()):
            cluster_ids = load_cluster_ids(gen_model, cluster_model, dataset_name, qid, doc_id)
            data[qid][doc_id] = compute_normalized_semantic_entropy(cluster_ids)
    return reverse_measure_data(data)

def make_cpe_data(rank_results, dataset_name, gen_model):
    data = {}
    for qid, doc_ids in rank_results.items():
        data[qid] = {}
        for doc_id in ['no']+list(doc_ids.keys()):
            log_likelihoods = load_likelihoods(gen_model, dataset_name, qid, doc_id)
            data[qid][doc_id] = compute_predictive_entropy(log_likelihoods)
    return reverse_measure_data(data)

def make_cnpe_data(rank_results, dataset_name, gen_model):
    data = {}
    for qid, doc_ids in rank_results.items():
        data[qid] = {}
        for doc_id in ['no']+list(doc_ids.keys()):
            log_likelihoods = load_likelihoods(gen_model, dataset_name, qid, doc_id)
            data[qid][doc_id] = compute_normalized_predictive_entropy(log_likelihoods)
    return reverse_measure_data(data)

def main(args):
    print()
    print(f'> {args.rank_result_filename} {args.gen_model}')
    qrels = load_qrels(args.dataset_name)
    prev_path = os.path.join(args.rank_result_dir, args.rank_result_filename)
    prev_name = args.rank_result_filename.split('.')[0]
    
    score_dict = {
        'dataset_name': args.dataset_name,
        'prev_filename': args.rank_result_filename,
        'prev_filepath': prev_path,
        'gen_model': args.gen_model,
        'cluster_model': args.cluster_model,
        'measure_key': args.measure_key,
        'measure_stat': {
            'total_question_count': 0,
            'valid_question_count': 0,
            'total_doc_count': 0,
            'valid_doc_count': 0,
        },
    }

    prev_results = load_rank_results(prev_path)
    prev_score = eval_rank_results(prev_results, qrels)
    score_dict['prev_score'] = prev_score
    
    print(f'{prev_name}\t{EVAL[1]}\t{extract_score(prev_score):.5f}')

    if args.ours:
        # Count the total number of qid-did in prev
        for qid, docs in prev_results.items():
            score_dict['measure_stat']['total_question_count'] += 1 # qid
            for docid, _ in docs.items():
                score_dict['measure_stat']['total_doc_count'] += 1 # qid-docid

        # Calculate measure_data
        if args.measure_key == 'mscr' or args.measure_key == 'mscp' or args.measure_key == 'cmscp':
            measure_data = make_mscr_data(prev_results, args.dataset_name, args.gen_model, args.cluster_model)
        elif args.measure_key == 'cse':
            measure_data = make_cse_data(prev_results, args.dataset_name, args.gen_model, args.cluster_model)
        elif args.measure_key == 'cpe':
            measure_data = make_cpe_data(prev_results, args.dataset_name, args.gen_model)
        elif args.measure_key == 'cnpe':
            measure_data = make_cnpe_data(prev_results, args.dataset_name, args.gen_model)
        else:
            raise NotImplementedError(f'Not implemented measure_key: {args.measure_key}')

        # Count the number of valid measures in measure_data
        for qid, docs in measure_data.items():
            for docid, data in docs.items():
                if data is not None:
                    if docid == 'no':
                        score_dict['measure_stat']['valid_question_count'] += 1
                    else:
                        score_dict['measure_stat']['valid_doc_count'] += 1
        print(f"valid question: {score_dict['measure_stat']['valid_question_count']} / {score_dict['measure_stat']['total_question_count']}")
        print(f"valid doc: {score_dict['measure_stat']['valid_doc_count']} / {score_dict['measure_stat']['total_doc_count']}")

        # ours: naive_method
        naive_scores = eval_naive_method(prev_results, measure_data, qrels)
        best_naive_score = get_max_score(naive_scores)
        best_naive_score_without_query_thres = get_max_score(naive_scores[NO_QUERY_CONF_THRESHOLDS])
        print(f'naive\t{args.gen_model}\t{best_naive_score:.5f}')
        score_dict['naive'] = {
            'method': 'naive',
            'gen_model': args.gen_model,
            'cluster_model': args.cluster_model,
            'best_score': best_naive_score,
            'best_score_without_query_thres': best_naive_score_without_query_thres,
            'all_scores': naive_scores,
        }

        # ours: three-bins
        three_bins_scores = eval_three_bins_method(prev_results, measure_data, qrels)
        best_thres_bins_score = get_max_score(three_bins_scores)
        best_thres_bins_score_without_query_thres = get_max_score(three_bins_scores[NO_QUERY_CONF_THRESHOLDS])
        print(f'three_bins\t{args.gen_model}\t{best_thres_bins_score:.5f}')
        score_dict['three_bins'] = {
            'method': 'three_bins',
            'gen_model': args.gen_model,
            'cluster_model': args.cluster_model,
            'best_score': best_thres_bins_score,
            'best_score_without_query_thres': best_thres_bins_score_without_query_thres,
            'all_scores': three_bins_scores,
        }

        # ours: doc_diff_score
        doc_diff_score_scores = eval_doc_diff_score_method(prev_results, measure_data, qrels)
        best_doc_diff_score_score = get_max_score(doc_diff_score_scores)
        best_doc_diff_score_score_without_query_thres = get_max_score(doc_diff_score_scores[NO_QUERY_CONF_THRESHOLDS])
        print(f'doc_diff_score\t{args.gen_model}\t{best_doc_diff_score_score:.5f}')
        score_dict['doc_diff_score'] = {
            'method': 'doc_diff_score',
            'gen_model': args.gen_model,
            'cluster_model': args.cluster_model,
            'best_score': best_doc_diff_score_score,
            'best_score_without_query_thres': best_doc_diff_score_score_without_query_thres,
            'all_scores': doc_diff_score_scores,
        }

        # ours: doc_query_diff
        doc_query_diff_scores = eval_doc_query_diff_method(prev_results, measure_data, qrels)
        best_doc_query_diff_score = get_max_score(doc_query_diff_scores)
        best_doc_query_diff_score_without_query_thres = get_max_score(doc_query_diff_scores[NO_QUERY_CONF_THRESHOLDS])
        print(f'doc_query_diff\t{args.gen_model}\t{best_doc_query_diff_score:.5f}')
        score_dict['doc_query_diff'] = {
            'method': 'doc_query_diff',
            'gen_model': args.gen_model,
            'cluster_model': args.cluster_model,
            'best_score': best_doc_query_diff_score,
            'best_score_without_query_thres': best_doc_query_diff_score_without_query_thres,
            'all_scores': doc_query_diff_scores,
        }

    # Save results
    score_filename = args.score_filename
    if not score_filename:
        if args.gen_model:
            score_filename = prev_name+'-'+args.gen_model+ '-' + args.measure_key +'.json'
        else:
            score_filename = prev_name+ '-' + args.measure_key + '.json'
    score_path = os.path.join(args.score_dir, score_filename)
    with open(score_path, 'w') as f:
        json.dump(score_dict, f, indent=4)
    print(f'Score saved to {score_path}')
    print()

if __name__ == '__main__':
    parser = get_parser()
    args = parser.parse_args()

    main(args)