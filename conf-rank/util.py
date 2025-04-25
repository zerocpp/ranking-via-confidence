from collections import defaultdict
import json
import os
import pickle
from beir.retrieval.evaluation import EvaluateRetrieval
import numpy as np
import pandas as pd

DEFAULT_BEIR_ROOT_DIR = "/home/song/dataset/beir"
DEFAULT_K_VALUES = [1, 3, 5, 10]

def load_pickle_file(file_path):
    with open(file_path, 'rb') as f:
        data = pickle.load(f)
    return data

def save_pickle_file(file_path, data):
    with open(file_path, 'wb') as f:
        pickle.dump(data, f)

def results_to_tsv(results, output_path):
    lines = []
    for qid, doc_scores in results.items():
        for docid, score in doc_scores.items():
            lines.append(f'{qid}\t{docid}\t{score}\n')
    with open(output_path, 'w') as f:
        f.writelines(lines)

def eval_rank_results(results, qrels, k_values=DEFAULT_K_VALUES):
    retriever = EvaluateRetrieval()
    scores = {}
    ndcg, _map, recall, precision = retriever.evaluate(qrels, results, k_values)
    scores['ndcg'] = ndcg
    scores['map'] = _map
    scores['recall'] = recall
    scores['precision'] = precision
    mrr = retriever.evaluate_custom(qrels, results, k_values, "mrr")
    scores['mrr'] = mrr
    recall_cap = retriever.evaluate_custom(qrels, results, k_values, "recall_cap")
    scores['recall_cap'] = recall_cap
    return scores
    
def load_beir_dataset(dataset_name, beir_root_dir=DEFAULT_BEIR_ROOT_DIR, filter_qids=None, filter_docids=None):
    dataset_path = f'{beir_root_dir}/{dataset_name}'

    rel_path = os.path.join(dataset_path, 'qrels/test.tsv')
    df = pd.read_csv(rel_path, sep='\t', header=0)
    qrels = defaultdict(dict)
    for qid, docid, score in df.values:
        qrels[str(qid)][str(docid)] = int(score)
    qrels = dict(qrels)

    queries = {}
    if filter_qids is None or len(filter_qids) > 0:
        query_path = os.path.join(dataset_path, 'queries.jsonl')
        queries = {}
        # 读取jsonl文件
        with open(query_path, 'r') as f:
            for line in f:
                query = json.loads(line)
                qid = str(query['_id'])
                if qid in qrels:
                    if filter_qids and qid not in filter_qids:
                        continue
                    queries[qid] = str(query['text'])

    docs = {}
    if filter_docids is None or len(filter_docids) > 0:
        doc_path = os.path.join(dataset_path, 'corpus.jsonl')
        with open(doc_path, 'r') as f:
            for line in f:
                doc = json.loads(line)
                docid = str(doc['_id'])
                if filter_docids and docid not in filter_docids:
                    continue
                docs[docid] = str(doc['text'])

    return queries, docs, qrels

def load_qrels(dataset_name, beir_root_dir=DEFAULT_BEIR_ROOT_DIR):
    return load_beir_dataset(dataset_name, beir_root_dir, filter_qids=[], filter_docids=[])[2]


def load_rank_results(result_file):
    results = defaultdict(dict)
    with open(result_file, 'r') as f:
        for line in f:
            qid, docid, score = line.strip().split('\t')
            results[str(qid)][str(docid)] = float(score)
    results = dict(results)
    return results

def filter_top_k_results(results, top_k):
    for qid, doc_scores in results.items():
        sorted_doc_scores = sorted(doc_scores.items(), key=lambda x: x[1], reverse=True)
        results[qid] = dict(sorted_doc_scores[:top_k])
    return results

def compute_predictive_entropy(log_probs):
    if log_probs is None:
        return None
    if type(log_probs) == list:
        log_probs = np.array(log_probs)
    if len(log_probs) == 0:
        return None

    if log_probs.ndim != 1:
        raise ValueError("Must be a 1D array")
    entropy = -np.sum(np.exp(log_probs) * log_probs)
    return entropy

def compute_normalized_predictive_entropy(log_probs):
    if log_probs is None:
        return None
    if type(log_probs) == list:
        log_probs = np.array(log_probs)
    if len(log_probs) == 0:
        return None
    
    entropy = compute_predictive_entropy(log_probs)
    
    seq_length = len(log_probs)
    
    normalized_entropy = entropy / seq_length
    return normalized_entropy


def compute_semantic_entropy(cluster_ids):
    if cluster_ids is None or len(cluster_ids) == 0:
        return None
    
    n_generations = len(cluster_ids)
    counts = np.bincount(cluster_ids)
    probabilities = counts/n_generations
    assert np.isclose(probabilities.sum(), 1)
    entropy = - (probabilities * np.log(probabilities)).sum()
    return entropy


def compute_normalized_semantic_entropy(cluster_ids):
    if cluster_ids is None or len(cluster_ids) == 0:
        return None
    
    max_entropy = np.log(len(cluster_ids))
    entropy = compute_semantic_entropy(cluster_ids)
    return entropy / max_entropy


def compute_normalized_semantic_certainty(cluster_ids):
    nse = compute_normalized_semantic_entropy(cluster_ids)
    if nse is None:
        return None
    return 1 - nse


def compute_max_semantic_cluster_ratio(cluster_ids):
    if cluster_ids is None or len(cluster_ids) == 0:
        return None
    counts = np.bincount(cluster_ids)
    return counts.max() / len(cluster_ids)
def compute_max_semantic_cluster_proportion(cluster_ids):
    return compute_max_semantic_cluster_ratio(cluster_ids)


def reverse_measure_data(measure_data):
    new_measure_data = measure_data.copy()
    for qid, docs in measure_data.items():
        for docid, data in docs.items():
            if data is not None:
                new_measure_data[qid][docid] = 1.0 - data
    return new_measure_data


def std_measure_data(measure_data):
    values = []
    for qid, docs in measure_data.items():
        for docid, data in docs.items():
            if data is not None:
                values.append(data)
    values = np.array(values)
    min = values.min()
    max = values.max()
    min_max_measure_data = {}
    for qid, docs in measure_data.items():
        for docid, data in docs.items():
            if data is not None:
                s = std_value_by_min_max(data, min, max)
                min_max_measure_data.setdefault(qid, {})[docid] = s
            else:
                min_max_measure_data.setdefault(qid, {})[docid] = None
    return min_max_measure_data


def std_value_by_min_max(value: float, min_value: float, max_value: float):
    return (value - min_value) / (max_value - min_value)

