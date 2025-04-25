#!/bin/bash

prev_names=("bm25" "contriever")
dataset_names=("nq" "hotpotqa" "dbpedia-entity" "fever")
# python make_q100_csv.py --rank_results_file_path /home/song/code/rerank-analysis/output/bm25/nq-top1000-all.tsv --dataset_name nq --output_csv_file_path /mnt/sda/song/rerank/result/nq-bm25-top10-q100.tsv
for prev_name in ${prev_names[@]}; do
    for dataset_name in ${dataset_names[@]}; do
    python make_q100_csv.py --rank_results_file_path /home/song/code/rerank-analysis/output/${prev_name}/${dataset_name}-top1000-all.tsv --dataset_name ${dataset_name} --output_csv_file_path /mnt/sda/song/rerank/result/${dataset_name}-${prev_name}-top10.tsv --top_k 10 --num_queries 0
        # python make_q100_csv.py --rank_results_file_path /home/song/code/rerank-analysis/output/${prev_name}/${dataset_name}-top1000-all.tsv --dataset_name ${dataset_name} --output_csv_file_path /mnt/sda/song/rerank/result/${dataset_name}-${prev_name}-top10-q100.tsv --top_k 10 --num_queries 100
    done
done
