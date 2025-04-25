#!/bin/bash

start_time=$(date "+%Y-%m-%d %H:%M:%S")
echo "Start time: $start_time"

#################diff params##################
cuda=0
prev_names=("bm25" "contriever")
dataset_names=("nq" "hotpotqa" "dbpedia-entity" "fever")

#################log##################

log_file="/mnt/sda/song/rerank/gen/log/cuda-$cuda.log"

rm -f $log_file

mkdir -p $(dirname $log_file)

touch $log_file

#################cluster-qwen7b##################

for prev_name in ${prev_names[@]}; do
  index=0
  for dataset_name in ${dataset_names[@]}; do
      index=$(($index + 1))
      total=${#dataset_names[@]}
      echo "Processing dataset $index of $total: $dataset_name"
      dataset_path="/mnt/sda/song/rerank/dataset/${dataset_name}-${prev_name}-top10-q100.jsonl"
      model_type="ollama"
      model="ollama/qwen2.5:7b-instruct-fp16"
      model_short_name="qwen7b"
      input_dir="/mnt/sda/song/rerank/gen/qwen7b/${dataset_name}"
      output_dir="/mnt/sda/song/rerank/cluster/qwen7b/${model_short_name}/${dataset_name}"
      cmd="DEVICE=cuda:$cuda python cluster.py --input_dir $input_dir --output_dir $output_dir --dataset_path $dataset_path --model_type $model_type --model $model"
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
