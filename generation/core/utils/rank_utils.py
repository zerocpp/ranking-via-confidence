from collections import defaultdict
import json
import os
from beir.retrieval.evaluation import EvaluateRetrieval
import pandas as pd

DEFAULT_BEIR_ROOT_DIR = "/home/song/dataset/beir"
DEFAULT_K_VALUES = [1, 3, 5, 10]

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

    # 标注数据qrels
    rel_path = os.path.join(dataset_path, 'qrels/test.tsv')
    df = pd.read_csv(rel_path, sep='\t', header=0)
    qrels = defaultdict(dict)
    for qid, docid, score in df.values:
        qrels[str(qid)][str(docid)] = int(score)
    qrels = dict(qrels)

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

    doc_path = os.path.join(dataset_path, 'corpus.jsonl')
    docs = {}
    # 读取jsonl文件
    with open(doc_path, 'r') as f:
        for line in f:
            doc = json.loads(line)
            docid = str(doc['_id'])
            if filter_docids and docid not in filter_docids:
                continue
            docs[docid] = str(doc['text'])

    return queries, docs, qrels

def load_rank_results(result_file):
    results = defaultdict(dict)
    with open(result_file, 'r') as f:
        for line in f:
            qid, docid, score = line.strip().split('\t')
            results[str(qid)][str(docid)] = float(score)
    results = dict(results)

    return results

def filter_top_k_results(results, top_k):
    # 截取前top_k个结果
    for qid, doc_scores in results.items():
        sorted_doc_scores = sorted(doc_scores.items(), key=lambda x: x[1], reverse=True) # 按照分数降序排序
        results[qid] = dict(sorted_doc_scores[:top_k]) # 截取前top_k个结果
    return results
