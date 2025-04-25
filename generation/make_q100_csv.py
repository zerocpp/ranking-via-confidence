'''
Extract the first num_queries (100) queries from bm25.csv, taking the top top_k (10) documents for each query, and generate a CSV file.
'''

import os
import argparse
import json
from tqdm import tqdm
from core.utils.rank_utils import load_rank_results, load_beir_dataset, filter_top_k_results

def main(args):
    # Load ranking results
    results = load_rank_results(args.rank_results_file_path)
    # Filter to top_k results
    results = filter_top_k_results(results, args.top_k)
    # Take the first num_queries queries
    if args.num_queries > 0:
        qids = sorted(results.keys())[0:args.num_queries]
        results = {qid: results[qid] for qid in qids}

    # Create output directory
    os.makedirs(os.path.dirname(args.output_csv_file_path), exist_ok=True)
    # Save to CSV file, each line as query_id, doc_id, score, separated by \t
    with open(args.output_csv_file_path, 'w') as f:
        for qid, doc_scores in results.items():
            for doc_id, score in doc_scores.items():
                f.write(f"{qid}\t{doc_id}\t{score}\n")
    print(f"Save to {args.output_csv_file_path}")
    
'''
Example usage:
python make_q100_csv.py --rank_results_file_path /home/song/code/rerank-analysis/output/bm25/nq-top1000-all.tsv --dataset_name nq --output_csv_file_path /mnt/sda/song/rerank/result/nq-bm25-top10-q100.tsv --top_k 10 --num_queries 100
'''

def get_parser():
    parser = argparse.ArgumentParser()
    parser.add_argument('--top_k', type=int, default=10, help='number of top results to process per query')
    parser.add_argument('--beir_root_dir', type=str, default='/home/song/dataset/beir', help='root directory of the BEIR dataset')
    parser.add_argument('--rank_results_file_path', type=str, help='path to the rank_results.tsv file')
    parser.add_argument('--dataset_name', type=str, help='name of the dataset')
    parser.add_argument('--output_csv_file_path', type=str, help='path to the output CSV file')
    parser.add_argument('--num_queries', type=int, default=0, help='number of queries to process (0 means all)')
    return parser

if __name__ == '__main__':
    parser = get_parser()
    args, unknown = parser.parse_known_args()
    if unknown:
        raise ValueError(f'Unknown args: {unknown}')
    print(f"args: {args}")
    main(args)
    print("Done!")