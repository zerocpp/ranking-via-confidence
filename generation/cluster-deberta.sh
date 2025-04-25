#!/bin/bash

start_time=$(date "+%Y-%m-%d %H:%M:%S")
echo "Start time: $start_time"

#################diff params##################
prev_names=("bm25" "contriever")
dataset_names=("nq" "hotpotqa" "dbpedia-entity" "fever")

#################log##################

log_file="/mnt/sda/song/rerank/gen/log/cuda-$cuda.log"

rm -f $log_file

mkdir -p $(dirname $log_file)

touch $log_file

#################cluster##################
for prev_name in ${prev_names[@]}; do
    for dataset_name in ${dataset_names[@]}; do
        index=$(($index + 1))
        total=${#dataset_names[@]}
        echo "Processing dataset $index of $total: $dataset_name"
        dataset_path="/mnt/sda/song/rerank/dataset/${dataset_name}-${prev_name}-top10.jsonl"
        input_dir="/mnt/sda/song/rerank/gen/qwen7b/${dataset_name}"
        output_dir="/mnt/sda/song/rerank/gen/qwen7b/deberta/${dataset_name}"
        cmd="python cluster.py --input_dir $input_dir --output_dir $output_dir --dataset_path $dataset_path"
        echo "> $cmd"
        eval $cmd
    done
done

#################time-log##################

end_time=$(date "+%Y-%m-%d %H:%M:%S")
echo "Start time: $start_time"
echo "End time: $end_time"

start_seconds=$(date --date="$start_time" +%s)
end_seconds=$(date --date="$end_time" +%s)
echo "Time cost: $((end_seconds-start_seconds))s"
