'''
Re-rank the top-10 results from BM25 using Reranker(args.reranker_model_name, args.reranker_model_type)
'''

import argparse
from rerankers import Reranker, Document
import os

from tqdm import tqdm
from .util import load_beir_dataset, load_rank_results, filter_top_k_results

# Modify the default logging level
import logging
logging.getLogger().setLevel(logging.ERROR)

'''
Example usage:
python -m retriever.custom \
    --dataset_name=nfcorpus \
    --prev_rank_results_path=/home/song/code/rerank-analysis/output/bm25/nfcorpus-top1000-all.tsv \
    --top_k=10 \
    --output_path=/home/song/code/rerank-analysis/output/t5/nfcorpus-bm25-top10-t5-InRanker-base.tsv \
    --reranker_model_name=unicamp-dl/InRanker-base \
    --reranker_model_type=t5
'''

def get_parser():
    parser = argparse.ArgumentParser()
    parser.add_argument('--dataset_name', type=str, help='Name of the dataset')
    parser.add_argument('--prev_rank_results_path', type=str, help='File path to the previous retrieval results, a TSV file in the format: query, doc, score')
    parser.add_argument('--beir_root_path', type=str, default='/home/song/dataset/beir', help='Root path of the BEIR dataset, used to load queries, docs, and qrels; defaults to /home/song/dataset/beir')
    parser.add_argument('--top_k', type=int, help='Number of top results to re-rank')
    parser.add_argument('--output_path', type=str, help='Path to save the re-ranked results; will be created if it does not exist; a TSV file in the format: query, doc, score')
    parser.add_argument('--reranker_model_name', type=str, default='unicamp-dl/InRanker-base', help='Name of the re-ranking model; defaults to unicamp-dl/InRanker-base')
    parser.add_argument('--reranker_model_type', type=str, default='t5', help='Type of the re-ranking model; defaults to t5')
    return parser

def main():
    parser = get_parser()
    args = parser.parse_args()
    rerank_result_path = args.output_path
    # Create the directory path if it does not exist
    os.makedirs(os.path.dirname(rerank_result_path), exist_ok=True)
    # If the file already exists, delete it (to overwrite)
    if os.path.exists(rerank_result_path):
        os.remove(rerank_result_path)

    # Initialize the reranking model
    ranker = Reranker(args.reranker_model_name, model_type=args.reranker_model_type)
    
    # Define the rankgpt function
    def rankgpt(query, docs, top_k):
        results = ranker.rank(query=query, docs=docs)
        top_k_results = results.top_k(top_k)
        return {
            doc.doc_id: doc.score
            for doc in top_k_results
        }

    # Read the prev_rank_results_path file and filter the top-k results for each query
    results = load_rank_results(args.prev_rank_results_path)
    results = filter_top_k_results(results, args.top_k)

    # Collect all unique doc IDs
    docids = set()
    for doc_scores in results.values():
        docids.update(doc_scores.keys())

    # Load the dataset
    queries, docs, qrels = load_beir_dataset(args.dataset_name, args.beir_root_path, filter_docids=docids)

    # Perform re-ranking
    for qid in tqdm(results, desc=f'{args.dataset_name}'):
        query = queries[qid]
        documents = []
        for docid in results[qid]:
            doc = Document(text=docs[docid], doc_id=docid)
            documents.append(doc)
        rerank_result = rankgpt(query, documents, args.top_k)
        # Write the results to a TSV file
        with open(rerank_result_path, 'a') as f:
            for docid, score in rerank_result.items():
                f.write(f'{qid}\t{docid}\t{score}\n')
        
    print(f'{args.reranker_model_type} {args.dataset_name} Done!')

if __name__ == '__main__':
    main()