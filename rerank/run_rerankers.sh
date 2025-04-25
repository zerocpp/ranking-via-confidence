reranker_model_types=("colbert" "t5" "cross-encoder" "rankgpt" "rankgpt")
reranker_model_names=("colbert-ir/colbertv2.0" "unicamp-dl/InRanker-base" "cross-encoder/ms-marco-MiniLM-L-6-v2" "ollama/qwen2.5:7b-instruct-fp16" "ollama/llama3.1:8b-instruct-fp16")
reranker_names=("colbert" "t5" "cross-encoder" "rankgpt-qwen7b" "rankgpt-llama8b")
prev_names=("contriever" "bm25")
dataset_names=("nq" "hotpotqa" "dbpedia-entity" "fever")



for prev_name in ${prev_names[@]}; do
    for ((i=0;i<${#reranker_model_names[@]};++i)); do
        reranker_model_name=${reranker_model_names[i]}
        reranker_name=${reranker_names[i]}
        reranker_model_type=${reranker_model_types[i]}
        
        for dataset_name in ${dataset_names[@]}; do
            
            echo "reranker_model=${reranker_name}, dataset_name=${dataset_name}"

            python -m reranker.custom \
                --dataset_name=${dataset_name} \
                --prev_rank_results_path=/mnt/sda/song/rerank/result/${dataset_name}-${prev_name}-top10-q100.tsv \
                --top_k=10 \
                --output_path=/mnt/sda/song/rerank/result/${dataset_name}-${prev_name}-${reranker_name}-q100.tsv \
                --reranker_model_name=${reranker_model_name} \
                --reranker_model_type=${reranker_model_type}
        done
    done
done
