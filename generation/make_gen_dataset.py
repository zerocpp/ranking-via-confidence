'''
Make a dataset for generation task from rank results.

# JSONL format:

- without context
```json
{
    "metadata": {
        "dataset": "nq",
        "query_id": "test0",
        "doc_id": "no",
    },
    "id": "nq-test0-no",
    "question": "Why was the General Belgrano sunk?",
    "context": null,
}
```

- with context
```json
{
    "metadata": {
        "dataset": "nq",
        "query_id": "test0",
        "doc_id": "doc0",
    },
    "id": "nq-test0-doc0",
    "question": "Why was the General Belgrano sunk?",
    "context": "This is a test context",
}
```
'''

import os
import argparse
import json
from tqdm import tqdm
from core.utils.rank_utils import load_rank_results, load_beir_dataset, filter_top_k_results

def main(args):
    
    results = load_rank_results(args.rank_results_file_path)
    
    results = filter_top_k_results(results, args.top_k)
    qids = sorted(results.keys())
    
    if args.num_queries > 0:
        qids = qids[0:args.num_queries]
        results = {qid: results[qid] for qid in qids}

    
    docids = set()
    for doc_scores in results.values():
        docids.update(doc_scores.keys())

    
    queries, docs, qrels = load_beir_dataset(args.dataset_name, args.beir_root_dir, filter_docids=docids)
    print(f'queries: {len(queries)}, docs: {len(docs)}, qrels: {len(qrels)}')

    def make_json_obj(qid, docid):
        if qid in queries and docid in list(docs.keys()) + ['no']:
            query = queries[qid]
            if docid == 'no':
                context = None
            else:
                context = docs[docid]
            json_obj = {
                "metadata": {
                    "dataset": args.dataset_name,
                    "query_id": qid,
                    "doc_id": docid,
                },
                "id": f"{args.dataset_name}-{qid}-{docid}",
                "question": query,
                "context": context,
            }
            return json_obj
        else:
            pass
        return None

    os.makedirs(os.path.dirname(args.output_jsonl_file_path), exist_ok=True)

    suc_count = 0
    with open(args.output_jsonl_file_path, 'w') as f:
        for qid in results:
            obj = make_json_obj(qid, 'no')
            if obj:
                suc_count += 1
                f.write(json.dumps(obj, ensure_ascii=False) + '\n')
            for docid in results[qid]:
                obj = make_json_obj(qid, docid)
                if obj:
                    suc_count += 1
                    f.write(json.dumps(obj, ensure_ascii=False) + '\n')
    print(f"succeed: {suc_count}")

'''
python make_gen_dataset.py --dataset_name nq --rank_results_file_path /home/song/code/rerank-analysis/output/bm25/nq-top1000-all.tsv --output_jsonl_file_path /mnt/sda/song/rerank/dataset/nq-bm25-top10.jsonl
python make_gen_dataset.py --dataset_name dbpedia-entity --rank_results_file_path /home/song/code/rerank-analysis/output/bm25/dbpedia-entity-top1000-all.tsv --output_jsonl_file_path /mnt/sda/song/rerank/dataset/dbpedia-entity-bm25-top10.jsonl
python make_gen_dataset.py --dataset_name fever --rank_results_file_path /home/song/code/rerank-analysis/output/bm25/fever-top1000-all.tsv --output_jsonl_file_path /mnt/sda/song/rerank/dataset/fever-bm25-top10.jsonl

python make_gen_dataset.py --dataset_name nq --rank_results_file_path /home/song/code/rerank-analysis/output/bm25/nq-top1000-all.tsv --output_jsonl_file_path /mnt/sda/song/rerank/dataset/nq-bm25-top10-q100.jsonl --num_queries 100
python make_gen_dataset.py --dataset_name dbpedia-entity --rank_results_file_path /home/song/code/rerank-analysis/output/bm25/dbpedia-entity-top1000-all.tsv --output_jsonl_file_path /mnt/sda/song/rerank/dataset/dbpedia-entity-bm25-top10-q100.jsonl --num_queries 100
python make_gen_dataset.py --dataset_name fever --rank_results_file_path /home/song/code/rerank-analysis/output/bm25/fever-top1000-all.tsv --output_jsonl_file_path /mnt/sda/song/rerank/dataset/fever-bm25-top10-q100.jsonl --num_queries 100

# hotpotqa bm25
python make_gen_dataset.py --dataset_name hotpotqa --rank_results_file_path /mnt/sda/song/rerank/result/hotpotqa-bm25-top10-q100.tsv --output_jsonl_file_path /mnt/sda/song/rerank/dataset/hotpotqa-bm25-top10-q100.jsonl --num_queries 100
# hotpotqa contriever
python make_gen_dataset.py --dataset_name hotpotqa --rank_results_file_path /mnt/sda/song/rerank/result/hotpotqa-contriever-top10-q100.tsv --output_jsonl_file_path /mnt/sda/song/rerank/dataset/hotpotqa-contriever-top10-q100.jsonl --num_queries 100
'''
def get_parser():
    parser = argparse.ArgumentParser()
    parser.add_argument('--top_k', type=int, default=10, help='number of top results to process per query')
    parser.add_argument('--beir_root_dir', type=str, default='/home/song/dataset/beir', help='root directory of the BEIR dataset')
    parser.add_argument('--rank_results_file_path', type=str, help='path to the rank_results.tsv file')
    parser.add_argument('--dataset_name', type=str, help='name of the dataset')
    parser.add_argument('--output_jsonl_file_path', type=str, help='path to the output JSONL file')
    parser.add_argument('--num_queries', type=int, default=0, help='number of queries to process (0 means all)')
    return parser

if __name__ == '__main__':
    parser = get_parser()
    args, unknown = parser.parse_known_args()
    if unknown:
        raise ValueError(f'Unkown args: {unknown}')
    print(f"args: {args}")
    main(args)
    print("Done!")
