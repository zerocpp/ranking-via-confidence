import os
import json

score_dir = '/mnt/sda/song/rerank/score'
dataset_names = ['nq', 'fiqa', 'nfcorpus', 'dbpedia-entity', 'fever', 'climate-fever', 'hotpotqa']
models = ['qwen7b', 'llama8b']
retrievers = ['bm25', 'contriever']
measure_keys = ['mscp', 'cse', 'cpe', 'cnpe']
# measure_keys = ['cse']
# rerankers = ['top10', 'cross-encoder', 'rankgpt']
suffix = '-q100'
save_excel_path = f'{score_dir}/all_best_scores.xlsx'
best_scores_path = f'{score_dir}/all_best_scores.jsonl'
if os.path.exists(best_scores_path):
    os.remove(best_scores_path)

def percent_score(score):
    return score * 100


all_best_scores = []
def append_best_score(score_dict):
    all_best_scores.append(score_dict)
    with open(best_scores_path, 'a') as f:
        f.write(json.dumps(score_dict) + '\n')

for measure_key in measure_keys:
    for model in models:
        for retriever in retrievers:
            for dataset_name in dataset_names:
                for reranker in ['', 'cross-encoder', 't5', 'colbert', f'rankgpt-{model}', f'rankgpt-dsv3']:
                    reranker_filename = reranker if reranker != '' else 'top10'
                    score_path = f'{score_dir}/{dataset_name}-{retriever}-{reranker_filename}{suffix}-{model}-{measure_key}.json'
                    assert os.path.exists(score_path), score_path
                    print(score_path)
                    with open(score_path) as f:
                        scores = json.load(f)

                        valid_doc_count = scores['measure_stat']['valid_doc_count']
                        total_doc_count = scores['measure_stat']['total_doc_count']
                        # assert valid_doc_count / total_doc_count >= 0.9, f'{valid_doc_count} / {total_doc_count}'
                        valid_question_count = scores['measure_stat']['valid_question_count']
                        total_question_count = scores['measure_stat']['total_question_count']
                        # assert valid_question_count / total_question_count >= 0.9, f'{valid_question_count} / {total_question_count}'

                        for method in ['', 'naive', 'three_bins', 'doc_diff_score', 'doc_query_diff']:
                            prev_score = scores['prev_score']['ndcg']['NDCG@10']
                            prev_score = percent_score(prev_score)
                            best_score = prev_score if method == '' else percent_score(scores[method]['best_score'])
                            best_score_without_query_thres = prev_score if method == '' else percent_score(scores[method]['best_score_without_query_thres'])
                            score_dict = {
                                'dataset_name': dataset_name,
                                'retriever': retriever,
                                'reranker': reranker,
                                'model': model,
                                'measure_key': scores['measure_key'],
                                'method': method,
                                'NDCG@10': best_score,
                                'improvement': best_score - prev_score,
                                'improvement_percent': int((best_score - prev_score) / prev_score * 1000) / 10,
                                'NDCG@10_without_query_thres': best_score_without_query_thres,
                                'improvement_without_query_thres': best_score_without_query_thres - prev_score,
                                'improvement_percent_without_query_thres': int((best_score_without_query_thres - prev_score) / prev_score * 1000) / 10,
                                'valid_doc_count': valid_doc_count,
                                'total_doc_count': total_doc_count,
                                'doc_error_percent': int((total_doc_count-valid_doc_count)/total_doc_count*1000)/10,
                                'valid_question_count': valid_question_count,
                                'total_question_count': total_question_count,
                                'question_error_percent': int((total_question_count-valid_question_count)/total_question_count*1000)/10,
                            }
                            append_best_score(score_dict)

# save to excel
import pandas as pd
df = pd.read_json(best_scores_path, lines=True)
df.to_excel(save_excel_path, index=False)
print(f'Saved to {save_excel_path}')

print('Done')
