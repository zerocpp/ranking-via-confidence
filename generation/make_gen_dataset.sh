#!/bin/bash

prev_name="bm25"
dataset_name="nq"
# dataset_names=("nq" "hotpotqa" "dbpedia-entity" "fever")
python make_gen_dataset.py --dataset_name $dataset_name --rank_results_file_path /home/song/code/rerank-analysis/output/$prev_name/$dataset_name-top1000-all.tsv --output_jsonl_file_path /mnt/sda/song/rerank/dataset/$dataset_name-$prev_name-top10.jsonl
