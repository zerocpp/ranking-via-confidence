#!/bin/bash


start_time=$(date "+%Y-%m-%d %H:%M:%S")
echo "Start time: $start_time"

#################diff params##################
cuda=1
prev_names=("bm25" "contriever")
dataset_names=("nq" "hotpotqa" "dbpedia-entity" "fever")

#################log##################

log_file="/mnt/sda/song/rerank/gen/log/cuda-$cuda.log"

rm -f $log_file

mkdir -p $(dirname $log_file)

touch $log_file

#################generate##################

for prev_name in ${prev_names[@]}; do
  for dataset_name in ${dataset_names[@]}; do
    echo "Processing $prev_name $dataset_name"
    DEVICE=cuda:$cuda python gen.py --model meta-llama/Llama-3.1-8B-Instruct --dataset_jsonl_path /mnt/sda/song/rerank/dataset/$dataset_name-$prev_name-top10.jsonl --output_dir /mnt/sda/song/rerank/gen/llama8b/$dataset_name --num_generations 10
  done
done

#################time-log##################

end_time=$(date "+%Y-%m-%d %H:%M:%S")
echo "Start time: $start_time"
echo "End time: $end_time"

start_seconds=$(date --date="$start_time" +%s)
end_seconds=$(date --date="$end_time" +%s)
echo "Time cost: $((end_seconds-start_seconds))s"
