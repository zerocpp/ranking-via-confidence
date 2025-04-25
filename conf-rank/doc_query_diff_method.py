'''
if query.conf > QUERY_THRES: # QUERY_THRES=0.5
	if doc.conf - query.conf > DELTA: # DELTA=0.2
		doc.score = 1
	elif doc.conf - query.conf < DELTA:
		doc.score = -1
	else:
		doc.score = 0
sorted(docs, (-d.score, -d.rank_score))
'''

import numpy as np
from util import eval_rank_results

def copy_results(old_results):
    new_results = {}
    for docid in old_results:
        new_results[docid] = old_results[docid]
    return new_results

def _rerank(prev_results, measure_data, query_thres, diff_thres):
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
            docs.append({
                'qid': qid,
                'docid': docid,
                'query_conf': query_conf,
                'doc_conf': doc_conf,
                'rank_score': prev_results[qid][docid],
            })
        if query_conf <= query_thres:
            for doc in docs:
                if doc['doc_conf'] - query_conf > diff_thres:
                    doc['score'] = 1
                elif query_conf - doc['doc_conf'] > diff_thres:
                    doc['score'] = -1
                else:
                    doc['score'] = 0
            docs = sorted(docs, key=lambda x: (-x['score'], -x['rank_score']))
        
        rerank_results[qid] = {}
        for rank, doc in enumerate(docs):
            docid = doc['docid']
            rerank_results[qid][docid] = 10 - rank
    return rerank_results
    
def eval_doc_query_diff_method(prev_results, measure_data, qrels):
    QUERY_CONF_THRESHOLDS = [x/100 for x in range(0, 101, 10)]
    DIFF_THRESHOLDS = [x/100 for x in range(0, 101, 10)]
    
    all_results = {}
    all_scores = {}
    for query_thres in QUERY_CONF_THRESHOLDS:
        all_results[query_thres], all_scores[query_thres] = {}, {}
        for diff_thres in DIFF_THRESHOLDS:
            all_results[query_thres][diff_thres], all_scores[query_thres][diff_thres] = {}, {}
            rerank_results = _rerank(prev_results, measure_data, query_thres, diff_thres)
            all_results[query_thres][diff_thres] = rerank_results
            score = eval_rank_results(rerank_results, qrels)
            all_scores[query_thres][diff_thres] = score
    # return all_results, all_scores
    return all_scores
