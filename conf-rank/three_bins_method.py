import numpy as np
from util import eval_rank_results

QUERY_CONF_THRESHOLDS = [x/100 for x in range(0, 101, 10)]
DOC_LOWER_THRESHOLDS = [x/100 for x in range(0, 101, 10)]
DOC_UPPER_THRESHOLDS = [x/100 for x in range(0, 101, 10)]

def copy_results(old_results):
    new_results = {}
    for docid in old_results:
        new_results[docid] = old_results[docid]
    return new_results

def _rerank(prev_results, measure_data, query_thres, lower_thres, upper_thres):
    def get_score(doc_conf):
        if doc_conf <= lower_thres:
            return -1
        elif doc_conf >= upper_thres:
            return 1
        else:
            return 0
    
    rerank_results = {}
    for qid in prev_results:
        if qid not in measure_data:
            rerank_results[qid] = copy_results(prev_results[qid])
            # print(f'qid {qid} not in measure_data')
            continue
        doc_confs = [measure_data[qid].get(docid) for docid in prev_results[qid]]
        if None in doc_confs:
            rerank_results[qid] = copy_results(prev_results[qid])
            # print(f'qid {qid} has None doc conf')
            # print(f'doc_confs={doc_confs}')
            continue
        query_conf = measure_data[qid]['no']
        docs = []
        for docid in prev_results[qid]:
            doc_conf = measure_data[qid][docid]
            doc_score = get_score(doc_conf)
            docs.append({
                'qid': qid,
                'docid': docid,
                'query_conf': query_conf,
                'doc_conf': doc_conf,
                'doc_score': doc_score,
                'rank_score': prev_results[qid][docid],
            })
        if query_conf <= query_thres:
            docs = sorted(docs, key=lambda x: (-x['doc_score'], -x['rank_score']))
        
        rerank_results[qid] = {}
        for rank, doc in enumerate(docs):
            docid = doc['docid']
            rerank_results[qid][docid] = 10 - rank
    return rerank_results
    
def eval_three_bins_method(prev_results, measure_data, qrels):
    all_results = {}
    all_scores = {}
    for query_thres in QUERY_CONF_THRESHOLDS:
        all_results[query_thres], all_scores[query_thres] = {}, {}
        for lower_thres in DOC_LOWER_THRESHOLDS:
            all_results[query_thres][lower_thres], all_scores[query_thres][lower_thres] = {}, {}
            for upper_thres in DOC_UPPER_THRESHOLDS:
                rerank_results = _rerank(prev_results, measure_data, query_thres, lower_thres, upper_thres)
                all_results[query_thres][lower_thres][upper_thres] = rerank_results
                score = eval_rank_results(rerank_results, qrels)
                all_scores[query_thres][lower_thres][upper_thres] = score
    # return all_results, all_scores
    return all_scores
