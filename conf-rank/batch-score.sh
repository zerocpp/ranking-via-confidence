start_time=$(date +%s)

#### cpe

# bm25

python run_score.py --measure_key cpe --dataset_name nq --rank_result_filename nq-bm25-top10-q100.tsv

python run_score.py --measure_key cpe --dataset_name nq --rank_result_filename nq-bm25-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name nq --rank_result_filename nq-bm25-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-top10-q100.tsv

python run_score.py --measure_key cpe --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name fiqa --rank_result_filename fiqa-bm25-top10-q100.tsv

python run_score.py --measure_key cpe --dataset_name fiqa --rank_result_filename fiqa-bm25-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name fiqa --rank_result_filename fiqa-bm25-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-top10-q100.tsv

python run_score.py --measure_key cpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name fever --rank_result_filename fever-bm25-top10-q100.tsv

python run_score.py --measure_key cpe --dataset_name fever --rank_result_filename fever-bm25-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name fever --rank_result_filename fever-bm25-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name climate-fever --rank_result_filename climate-fever-bm25-top10-q100.tsv

python run_score.py --measure_key cpe --dataset_name climate-fever --rank_result_filename climate-fever-bm25-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name climate-fever --rank_result_filename climate-fever-bm25-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-top10-q100.tsv

python run_score.py --measure_key cpe --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

# contriever

python run_score.py --measure_key cpe --dataset_name nq --rank_result_filename nq-contriever-top10-q100.tsv

python run_score.py --measure_key cpe --dataset_name nq --rank_result_filename nq-contriever-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name nq --rank_result_filename nq-contriever-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-top10-q100.tsv

python run_score.py --measure_key cpe --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name fiqa --rank_result_filename fiqa-contriever-top10-q100.tsv

python run_score.py --measure_key cpe --dataset_name fiqa --rank_result_filename fiqa-contriever-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name fiqa --rank_result_filename fiqa-contriever-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-top10-q100.tsv

python run_score.py --measure_key cpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name fever --rank_result_filename fever-contriever-top10-q100.tsv

python run_score.py --measure_key cpe --dataset_name fever --rank_result_filename fever-contriever-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name fever --rank_result_filename fever-contriever-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name climate-fever --rank_result_filename climate-fever-contriever-top10-q100.tsv

python run_score.py --measure_key cpe --dataset_name climate-fever --rank_result_filename climate-fever-contriever-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name climate-fever --rank_result_filename climate-fever-contriever-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-top10-q100.tsv

python run_score.py --measure_key cpe --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

# bm25-cross-encoder

python run_score.py --measure_key cpe --dataset_name nq --rank_result_filename nq-bm25-cross-encoder-q100.tsv

python run_score.py --measure_key cpe --dataset_name nq --rank_result_filename nq-bm25-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name nq --rank_result_filename nq-bm25-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-cross-encoder-q100.tsv

python run_score.py --measure_key cpe --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name fiqa --rank_result_filename fiqa-bm25-cross-encoder-q100.tsv

python run_score.py --measure_key cpe --dataset_name fiqa --rank_result_filename fiqa-bm25-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name fiqa --rank_result_filename fiqa-bm25-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-cross-encoder-q100.tsv

python run_score.py --measure_key cpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name fever --rank_result_filename fever-bm25-cross-encoder-q100.tsv

python run_score.py --measure_key cpe --dataset_name fever --rank_result_filename fever-bm25-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name fever --rank_result_filename fever-bm25-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name climate-fever --rank_result_filename climate-fever-bm25-cross-encoder-q100.tsv

python run_score.py --measure_key cpe --dataset_name climate-fever --rank_result_filename climate-fever-bm25-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name climate-fever --rank_result_filename climate-fever-bm25-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-cross-encoder-q100.tsv

python run_score.py --measure_key cpe --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

# 基于contriever-cross-encoder结果

python run_score.py --measure_key cpe --dataset_name nq --rank_result_filename nq-contriever-cross-encoder-q100.tsv

python run_score.py --measure_key cpe --dataset_name nq --rank_result_filename nq-contriever-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name nq --rank_result_filename nq-contriever-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-cross-encoder-q100.tsv

python run_score.py --measure_key cpe --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name fiqa --rank_result_filename fiqa-contriever-cross-encoder-q100.tsv

python run_score.py --measure_key cpe --dataset_name fiqa --rank_result_filename fiqa-contriever-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name fiqa --rank_result_filename fiqa-contriever-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-cross-encoder-q100.tsv

python run_score.py --measure_key cpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name fever --rank_result_filename fever-contriever-cross-encoder-q100.tsv

python run_score.py --measure_key cpe --dataset_name fever --rank_result_filename fever-contriever-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name fever --rank_result_filename fever-contriever-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name climate-fever --rank_result_filename climate-fever-contriever-cross-encoder-q100.tsv

python run_score.py --measure_key cpe --dataset_name climate-fever --rank_result_filename climate-fever-contriever-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name climate-fever --rank_result_filename climate-fever-contriever-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-cross-encoder-q100.tsv

python run_score.py --measure_key cpe --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

# bm25-rankgpt

python run_score.py --measure_key cpe --dataset_name nq --rank_result_filename nq-bm25-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name nq --rank_result_filename nq-bm25-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name nq --rank_result_filename nq-bm25-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name nq --rank_result_filename nq-bm25-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name fiqa --rank_result_filename fiqa-bm25-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name fiqa --rank_result_filename fiqa-bm25-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name fiqa --rank_result_filename fiqa-bm25-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name fiqa --rank_result_filename fiqa-bm25-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours


python run_score.py --measure_key cpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name fever --rank_result_filename fever-bm25-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name fever --rank_result_filename fever-bm25-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name fever --rank_result_filename fever-bm25-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name fever --rank_result_filename fever-bm25-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name climate-fever --rank_result_filename climate-fever-bm25-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name climate-fever --rank_result_filename climate-fever-bm25-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name climate-fever --rank_result_filename climate-fever-bm25-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name climate-fever --rank_result_filename climate-fever-bm25-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

# contriever-rankgpt

python run_score.py --measure_key cpe --dataset_name nq --rank_result_filename nq-contriever-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name nq --rank_result_filename nq-contriever-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name nq --rank_result_filename nq-contriever-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name nq --rank_result_filename nq-contriever-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name fiqa --rank_result_filename fiqa-contriever-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name fiqa --rank_result_filename fiqa-contriever-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name fiqa --rank_result_filename fiqa-contriever-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name fiqa --rank_result_filename fiqa-contriever-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name fever --rank_result_filename fever-contriever-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name fever --rank_result_filename fever-contriever-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name fever --rank_result_filename fever-contriever-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name fever --rank_result_filename fever-contriever-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name climate-fever --rank_result_filename climate-fever-contriever-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name climate-fever --rank_result_filename climate-fever-contriever-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name climate-fever --rank_result_filename climate-fever-contriever-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name climate-fever --rank_result_filename climate-fever-contriever-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

# bm25-t5

python run_score.py --measure_key cpe --dataset_name nq --rank_result_filename nq-bm25-t5-q100.tsv

python run_score.py --measure_key cpe --dataset_name nq --rank_result_filename nq-bm25-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name nq --rank_result_filename nq-bm25-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-t5-q100.tsv

python run_score.py --measure_key cpe --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name fiqa --rank_result_filename fiqa-bm25-t5-q100.tsv

python run_score.py --measure_key cpe --dataset_name fiqa --rank_result_filename fiqa-bm25-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name fiqa --rank_result_filename fiqa-bm25-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-t5-q100.tsv

python run_score.py --measure_key cpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name fever --rank_result_filename fever-bm25-t5-q100.tsv

python run_score.py --measure_key cpe --dataset_name fever --rank_result_filename fever-bm25-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name fever --rank_result_filename fever-bm25-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name climate-fever --rank_result_filename climate-fever-bm25-t5-q100.tsv

python run_score.py --measure_key cpe --dataset_name climate-fever --rank_result_filename climate-fever-bm25-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name climate-fever --rank_result_filename climate-fever-bm25-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-t5-q100.tsv

python run_score.py --measure_key cpe --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

# contriever-t5

python run_score.py --measure_key cpe --dataset_name nq --rank_result_filename nq-contriever-t5-q100.tsv

python run_score.py --measure_key cpe --dataset_name nq --rank_result_filename nq-contriever-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name nq --rank_result_filename nq-contriever-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-t5-q100.tsv

python run_score.py --measure_key cpe --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name fiqa --rank_result_filename fiqa-contriever-t5-q100.tsv

python run_score.py --measure_key cpe --dataset_name fiqa --rank_result_filename fiqa-contriever-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name fiqa --rank_result_filename fiqa-contriever-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-t5-q100.tsv

python run_score.py --measure_key cpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name fever --rank_result_filename fever-contriever-t5-q100.tsv

python run_score.py --measure_key cpe --dataset_name fever --rank_result_filename fever-contriever-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name fever --rank_result_filename fever-contriever-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name climate-fever --rank_result_filename climate-fever-contriever-t5-q100.tsv

python run_score.py --measure_key cpe --dataset_name climate-fever --rank_result_filename climate-fever-contriever-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name climate-fever --rank_result_filename climate-fever-contriever-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-t5-q100.tsv

python run_score.py --measure_key cpe --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

# bm25-colbert

python run_score.py --measure_key cpe --dataset_name nq --rank_result_filename nq-bm25-colbert-q100.tsv

python run_score.py --measure_key cpe --dataset_name nq --rank_result_filename nq-bm25-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name nq --rank_result_filename nq-bm25-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-colbert-q100.tsv

python run_score.py --measure_key cpe --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name fiqa --rank_result_filename fiqa-bm25-colbert-q100.tsv

python run_score.py --measure_key cpe --dataset_name fiqa --rank_result_filename fiqa-bm25-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name fiqa --rank_result_filename fiqa-bm25-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-colbert-q100.tsv

python run_score.py --measure_key cpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name fever --rank_result_filename fever-bm25-colbert-q100.tsv

python run_score.py --measure_key cpe --dataset_name fever --rank_result_filename fever-bm25-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name fever --rank_result_filename fever-bm25-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name climate-fever --rank_result_filename climate-fever-bm25-colbert-q100.tsv

python run_score.py --measure_key cpe --dataset_name climate-fever --rank_result_filename climate-fever-bm25-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name climate-fever --rank_result_filename climate-fever-bm25-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-colbert-q100.tsv

python run_score.py --measure_key cpe --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours


# contriever-colbert

python run_score.py --measure_key cpe --dataset_name nq --rank_result_filename nq-contriever-colbert-q100.tsv

python run_score.py --measure_key cpe --dataset_name nq --rank_result_filename nq-contriever-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name nq --rank_result_filename nq-contriever-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-colbert-q100.tsv

python run_score.py --measure_key cpe --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name fiqa --rank_result_filename fiqa-contriever-colbert-q100.tsv

python run_score.py --measure_key cpe --dataset_name fiqa --rank_result_filename fiqa-contriever-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name fiqa --rank_result_filename fiqa-contriever-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-colbert-q100.tsv

python run_score.py --measure_key cpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name fever --rank_result_filename fever-contriever-colbert-q100.tsv

python run_score.py --measure_key cpe --dataset_name fever --rank_result_filename fever-contriever-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name fever --rank_result_filename fever-contriever-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name climate-fever --rank_result_filename climate-fever-contriever-colbert-q100.tsv

python run_score.py --measure_key cpe --dataset_name climate-fever --rank_result_filename climate-fever-contriever-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name climate-fever --rank_result_filename climate-fever-contriever-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cpe --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-colbert-q100.tsv

python run_score.py --measure_key cpe --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cpe --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

#### cnpe

# bm25

python run_score.py --measure_key cnpe --dataset_name nq --rank_result_filename nq-bm25-top10-q100.tsv

python run_score.py --measure_key cnpe --dataset_name nq --rank_result_filename nq-bm25-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name nq --rank_result_filename nq-bm25-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-top10-q100.tsv

python run_score.py --measure_key cnpe --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name fiqa --rank_result_filename fiqa-bm25-top10-q100.tsv

python run_score.py --measure_key cnpe --dataset_name fiqa --rank_result_filename fiqa-bm25-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name fiqa --rank_result_filename fiqa-bm25-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-top10-q100.tsv

python run_score.py --measure_key cnpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name fever --rank_result_filename fever-bm25-top10-q100.tsv

python run_score.py --measure_key cnpe --dataset_name fever --rank_result_filename fever-bm25-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name fever --rank_result_filename fever-bm25-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name climate-fever --rank_result_filename climate-fever-bm25-top10-q100.tsv

python run_score.py --measure_key cnpe --dataset_name climate-fever --rank_result_filename climate-fever-bm25-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name climate-fever --rank_result_filename climate-fever-bm25-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-top10-q100.tsv

python run_score.py --measure_key cnpe --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

# contriever

python run_score.py --measure_key cnpe --dataset_name nq --rank_result_filename nq-contriever-top10-q100.tsv

python run_score.py --measure_key cnpe --dataset_name nq --rank_result_filename nq-contriever-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name nq --rank_result_filename nq-contriever-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-top10-q100.tsv

python run_score.py --measure_key cnpe --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name fiqa --rank_result_filename fiqa-contriever-top10-q100.tsv

python run_score.py --measure_key cnpe --dataset_name fiqa --rank_result_filename fiqa-contriever-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name fiqa --rank_result_filename fiqa-contriever-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-top10-q100.tsv

python run_score.py --measure_key cnpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name fever --rank_result_filename fever-contriever-top10-q100.tsv

python run_score.py --measure_key cnpe --dataset_name fever --rank_result_filename fever-contriever-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name fever --rank_result_filename fever-contriever-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name climate-fever --rank_result_filename climate-fever-contriever-top10-q100.tsv

python run_score.py --measure_key cnpe --dataset_name climate-fever --rank_result_filename climate-fever-contriever-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name climate-fever --rank_result_filename climate-fever-contriever-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-top10-q100.tsv

python run_score.py --measure_key cnpe --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

# bm25-cross-encoder

python run_score.py --measure_key cnpe --dataset_name nq --rank_result_filename nq-bm25-cross-encoder-q100.tsv

python run_score.py --measure_key cnpe --dataset_name nq --rank_result_filename nq-bm25-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name nq --rank_result_filename nq-bm25-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-cross-encoder-q100.tsv

python run_score.py --measure_key cnpe --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name fiqa --rank_result_filename fiqa-bm25-cross-encoder-q100.tsv

python run_score.py --measure_key cnpe --dataset_name fiqa --rank_result_filename fiqa-bm25-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name fiqa --rank_result_filename fiqa-bm25-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-cross-encoder-q100.tsv

python run_score.py --measure_key cnpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name fever --rank_result_filename fever-bm25-cross-encoder-q100.tsv

python run_score.py --measure_key cnpe --dataset_name fever --rank_result_filename fever-bm25-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name fever --rank_result_filename fever-bm25-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name climate-fever --rank_result_filename climate-fever-bm25-cross-encoder-q100.tsv

python run_score.py --measure_key cnpe --dataset_name climate-fever --rank_result_filename climate-fever-bm25-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name climate-fever --rank_result_filename climate-fever-bm25-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-cross-encoder-q100.tsv

python run_score.py --measure_key cnpe --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

# contriever-cross-encoder

python run_score.py --measure_key cnpe --dataset_name nq --rank_result_filename nq-contriever-cross-encoder-q100.tsv

python run_score.py --measure_key cnpe --dataset_name nq --rank_result_filename nq-contriever-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name nq --rank_result_filename nq-contriever-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-cross-encoder-q100.tsv

python run_score.py --measure_key cnpe --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name fiqa --rank_result_filename fiqa-contriever-cross-encoder-q100.tsv

python run_score.py --measure_key cnpe --dataset_name fiqa --rank_result_filename fiqa-contriever-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name fiqa --rank_result_filename fiqa-contriever-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-cross-encoder-q100.tsv

python run_score.py --measure_key cnpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name fever --rank_result_filename fever-contriever-cross-encoder-q100.tsv

python run_score.py --measure_key cnpe --dataset_name fever --rank_result_filename fever-contriever-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name fever --rank_result_filename fever-contriever-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name climate-fever --rank_result_filename climate-fever-contriever-cross-encoder-q100.tsv

python run_score.py --measure_key cnpe --dataset_name climate-fever --rank_result_filename climate-fever-contriever-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name climate-fever --rank_result_filename climate-fever-contriever-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-cross-encoder-q100.tsv

python run_score.py --measure_key cnpe --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

# bm25-rankgpt

python run_score.py --measure_key cnpe --dataset_name nq --rank_result_filename nq-bm25-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name nq --rank_result_filename nq-bm25-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name nq --rank_result_filename nq-bm25-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name nq --rank_result_filename nq-bm25-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name fiqa --rank_result_filename fiqa-bm25-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name fiqa --rank_result_filename fiqa-bm25-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name fiqa --rank_result_filename fiqa-bm25-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name fiqa --rank_result_filename fiqa-bm25-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours


python run_score.py --measure_key cnpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name fever --rank_result_filename fever-bm25-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name fever --rank_result_filename fever-bm25-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name fever --rank_result_filename fever-bm25-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name fever --rank_result_filename fever-bm25-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name climate-fever --rank_result_filename climate-fever-bm25-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name climate-fever --rank_result_filename climate-fever-bm25-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name climate-fever --rank_result_filename climate-fever-bm25-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name climate-fever --rank_result_filename climate-fever-bm25-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

# contriever-rankgpt

python run_score.py --measure_key cnpe --dataset_name nq --rank_result_filename nq-contriever-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name nq --rank_result_filename nq-contriever-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name nq --rank_result_filename nq-contriever-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name nq --rank_result_filename nq-contriever-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name fiqa --rank_result_filename fiqa-contriever-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name fiqa --rank_result_filename fiqa-contriever-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name fiqa --rank_result_filename fiqa-contriever-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name fiqa --rank_result_filename fiqa-contriever-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name fever --rank_result_filename fever-contriever-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name fever --rank_result_filename fever-contriever-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name fever --rank_result_filename fever-contriever-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name fever --rank_result_filename fever-contriever-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name climate-fever --rank_result_filename climate-fever-contriever-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name climate-fever --rank_result_filename climate-fever-contriever-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name climate-fever --rank_result_filename climate-fever-contriever-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name climate-fever --rank_result_filename climate-fever-contriever-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

# bm25-t5

python run_score.py --measure_key cnpe --dataset_name nq --rank_result_filename nq-bm25-t5-q100.tsv

python run_score.py --measure_key cnpe --dataset_name nq --rank_result_filename nq-bm25-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name nq --rank_result_filename nq-bm25-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-t5-q100.tsv

python run_score.py --measure_key cnpe --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name fiqa --rank_result_filename fiqa-bm25-t5-q100.tsv

python run_score.py --measure_key cnpe --dataset_name fiqa --rank_result_filename fiqa-bm25-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name fiqa --rank_result_filename fiqa-bm25-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-t5-q100.tsv

python run_score.py --measure_key cnpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name fever --rank_result_filename fever-bm25-t5-q100.tsv

python run_score.py --measure_key cnpe --dataset_name fever --rank_result_filename fever-bm25-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name fever --rank_result_filename fever-bm25-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name climate-fever --rank_result_filename climate-fever-bm25-t5-q100.tsv

python run_score.py --measure_key cnpe --dataset_name climate-fever --rank_result_filename climate-fever-bm25-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name climate-fever --rank_result_filename climate-fever-bm25-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-t5-q100.tsv

python run_score.py --measure_key cnpe --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

# contriever-t5

python run_score.py --measure_key cnpe --dataset_name nq --rank_result_filename nq-contriever-t5-q100.tsv

python run_score.py --measure_key cnpe --dataset_name nq --rank_result_filename nq-contriever-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name nq --rank_result_filename nq-contriever-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-t5-q100.tsv

python run_score.py --measure_key cnpe --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name fiqa --rank_result_filename fiqa-contriever-t5-q100.tsv

python run_score.py --measure_key cnpe --dataset_name fiqa --rank_result_filename fiqa-contriever-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name fiqa --rank_result_filename fiqa-contriever-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-t5-q100.tsv

python run_score.py --measure_key cnpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name fever --rank_result_filename fever-contriever-t5-q100.tsv

python run_score.py --measure_key cnpe --dataset_name fever --rank_result_filename fever-contriever-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name fever --rank_result_filename fever-contriever-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name climate-fever --rank_result_filename climate-fever-contriever-t5-q100.tsv

python run_score.py --measure_key cnpe --dataset_name climate-fever --rank_result_filename climate-fever-contriever-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name climate-fever --rank_result_filename climate-fever-contriever-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-t5-q100.tsv

python run_score.py --measure_key cnpe --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

# bm25-colbert

python run_score.py --measure_key cnpe --dataset_name nq --rank_result_filename nq-bm25-colbert-q100.tsv

python run_score.py --measure_key cnpe --dataset_name nq --rank_result_filename nq-bm25-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name nq --rank_result_filename nq-bm25-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-colbert-q100.tsv

python run_score.py --measure_key cnpe --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name fiqa --rank_result_filename fiqa-bm25-colbert-q100.tsv

python run_score.py --measure_key cnpe --dataset_name fiqa --rank_result_filename fiqa-bm25-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name fiqa --rank_result_filename fiqa-bm25-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-colbert-q100.tsv

python run_score.py --measure_key cnpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name fever --rank_result_filename fever-bm25-colbert-q100.tsv

python run_score.py --measure_key cnpe --dataset_name fever --rank_result_filename fever-bm25-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name fever --rank_result_filename fever-bm25-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name climate-fever --rank_result_filename climate-fever-bm25-colbert-q100.tsv

python run_score.py --measure_key cnpe --dataset_name climate-fever --rank_result_filename climate-fever-bm25-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name climate-fever --rank_result_filename climate-fever-bm25-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-colbert-q100.tsv

python run_score.py --measure_key cnpe --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours


# contriever-colbert

python run_score.py --measure_key cnpe --dataset_name nq --rank_result_filename nq-contriever-colbert-q100.tsv

python run_score.py --measure_key cnpe --dataset_name nq --rank_result_filename nq-contriever-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name nq --rank_result_filename nq-contriever-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-colbert-q100.tsv

python run_score.py --measure_key cnpe --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name fiqa --rank_result_filename fiqa-contriever-colbert-q100.tsv

python run_score.py --measure_key cnpe --dataset_name fiqa --rank_result_filename fiqa-contriever-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name fiqa --rank_result_filename fiqa-contriever-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-colbert-q100.tsv

python run_score.py --measure_key cnpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name fever --rank_result_filename fever-contriever-colbert-q100.tsv

python run_score.py --measure_key cnpe --dataset_name fever --rank_result_filename fever-contriever-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name fever --rank_result_filename fever-contriever-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name climate-fever --rank_result_filename climate-fever-contriever-colbert-q100.tsv

python run_score.py --measure_key cnpe --dataset_name climate-fever --rank_result_filename climate-fever-contriever-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name climate-fever --rank_result_filename climate-fever-contriever-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cnpe --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-colbert-q100.tsv

python run_score.py --measure_key cnpe --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cnpe --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours


#### mscp

# bm25

python run_score.py --measure_key mscp --dataset_name nq --rank_result_filename nq-bm25-top10-q100.tsv

python run_score.py --measure_key mscp --dataset_name nq --rank_result_filename nq-bm25-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name nq --rank_result_filename nq-bm25-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-top10-q100.tsv

python run_score.py --measure_key mscp --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name fiqa --rank_result_filename fiqa-bm25-top10-q100.tsv

python run_score.py --measure_key mscp --dataset_name fiqa --rank_result_filename fiqa-bm25-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name fiqa --rank_result_filename fiqa-bm25-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-top10-q100.tsv

python run_score.py --measure_key mscp --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name fever --rank_result_filename fever-bm25-top10-q100.tsv

python run_score.py --measure_key mscp --dataset_name fever --rank_result_filename fever-bm25-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name fever --rank_result_filename fever-bm25-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name climate-fever --rank_result_filename climate-fever-bm25-top10-q100.tsv

python run_score.py --measure_key mscp --dataset_name climate-fever --rank_result_filename climate-fever-bm25-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name climate-fever --rank_result_filename climate-fever-bm25-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-top10-q100.tsv

python run_score.py --measure_key mscp --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

# contriever

python run_score.py --measure_key mscp --dataset_name nq --rank_result_filename nq-contriever-top10-q100.tsv

python run_score.py --measure_key mscp --dataset_name nq --rank_result_filename nq-contriever-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name nq --rank_result_filename nq-contriever-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-top10-q100.tsv

python run_score.py --measure_key mscp --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name fiqa --rank_result_filename fiqa-contriever-top10-q100.tsv

python run_score.py --measure_key mscp --dataset_name fiqa --rank_result_filename fiqa-contriever-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name fiqa --rank_result_filename fiqa-contriever-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-top10-q100.tsv

python run_score.py --measure_key mscp --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name fever --rank_result_filename fever-contriever-top10-q100.tsv

python run_score.py --measure_key mscp --dataset_name fever --rank_result_filename fever-contriever-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name fever --rank_result_filename fever-contriever-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name climate-fever --rank_result_filename climate-fever-contriever-top10-q100.tsv

python run_score.py --measure_key mscp --dataset_name climate-fever --rank_result_filename climate-fever-contriever-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name climate-fever --rank_result_filename climate-fever-contriever-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-top10-q100.tsv

python run_score.py --measure_key mscp --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

# bm25-cross-encoder

python run_score.py --measure_key mscp --dataset_name nq --rank_result_filename nq-bm25-cross-encoder-q100.tsv

python run_score.py --measure_key mscp --dataset_name nq --rank_result_filename nq-bm25-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name nq --rank_result_filename nq-bm25-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-cross-encoder-q100.tsv

python run_score.py --measure_key mscp --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name fiqa --rank_result_filename fiqa-bm25-cross-encoder-q100.tsv

python run_score.py --measure_key mscp --dataset_name fiqa --rank_result_filename fiqa-bm25-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name fiqa --rank_result_filename fiqa-bm25-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-cross-encoder-q100.tsv

python run_score.py --measure_key mscp --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name fever --rank_result_filename fever-bm25-cross-encoder-q100.tsv

python run_score.py --measure_key mscp --dataset_name fever --rank_result_filename fever-bm25-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name fever --rank_result_filename fever-bm25-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name climate-fever --rank_result_filename climate-fever-bm25-cross-encoder-q100.tsv

python run_score.py --measure_key mscp --dataset_name climate-fever --rank_result_filename climate-fever-bm25-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name climate-fever --rank_result_filename climate-fever-bm25-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-cross-encoder-q100.tsv

python run_score.py --measure_key mscp --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

# contriever-cross-encoder

python run_score.py --measure_key mscp --dataset_name nq --rank_result_filename nq-contriever-cross-encoder-q100.tsv

python run_score.py --measure_key mscp --dataset_name nq --rank_result_filename nq-contriever-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name nq --rank_result_filename nq-contriever-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-cross-encoder-q100.tsv

python run_score.py --measure_key mscp --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name fiqa --rank_result_filename fiqa-contriever-cross-encoder-q100.tsv

python run_score.py --measure_key mscp --dataset_name fiqa --rank_result_filename fiqa-contriever-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name fiqa --rank_result_filename fiqa-contriever-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-cross-encoder-q100.tsv

python run_score.py --measure_key mscp --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name fever --rank_result_filename fever-contriever-cross-encoder-q100.tsv

python run_score.py --measure_key mscp --dataset_name fever --rank_result_filename fever-contriever-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name fever --rank_result_filename fever-contriever-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name climate-fever --rank_result_filename climate-fever-contriever-cross-encoder-q100.tsv

python run_score.py --measure_key mscp --dataset_name climate-fever --rank_result_filename climate-fever-contriever-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name climate-fever --rank_result_filename climate-fever-contriever-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-cross-encoder-q100.tsv

python run_score.py --measure_key mscp --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

# bm25-rankgpt

python run_score.py --measure_key mscp --dataset_name nq --rank_result_filename nq-bm25-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name nq --rank_result_filename nq-bm25-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name nq --rank_result_filename nq-bm25-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name nq --rank_result_filename nq-bm25-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name fiqa --rank_result_filename fiqa-bm25-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name fiqa --rank_result_filename fiqa-bm25-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name fiqa --rank_result_filename fiqa-bm25-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name fiqa --rank_result_filename fiqa-bm25-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours


python run_score.py --measure_key mscp --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name fever --rank_result_filename fever-bm25-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name fever --rank_result_filename fever-bm25-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name fever --rank_result_filename fever-bm25-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name fever --rank_result_filename fever-bm25-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name climate-fever --rank_result_filename climate-fever-bm25-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name climate-fever --rank_result_filename climate-fever-bm25-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name climate-fever --rank_result_filename climate-fever-bm25-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name climate-fever --rank_result_filename climate-fever-bm25-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

# contriever-rankgpt

python run_score.py --measure_key mscp --dataset_name nq --rank_result_filename nq-contriever-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name nq --rank_result_filename nq-contriever-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name nq --rank_result_filename nq-contriever-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name nq --rank_result_filename nq-contriever-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name fiqa --rank_result_filename fiqa-contriever-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name fiqa --rank_result_filename fiqa-contriever-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name fiqa --rank_result_filename fiqa-contriever-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name fiqa --rank_result_filename fiqa-contriever-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name fever --rank_result_filename fever-contriever-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name fever --rank_result_filename fever-contriever-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name fever --rank_result_filename fever-contriever-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name fever --rank_result_filename fever-contriever-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name climate-fever --rank_result_filename climate-fever-contriever-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name climate-fever --rank_result_filename climate-fever-contriever-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name climate-fever --rank_result_filename climate-fever-contriever-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name climate-fever --rank_result_filename climate-fever-contriever-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

# bm25-t5

python run_score.py --measure_key mscp --dataset_name nq --rank_result_filename nq-bm25-t5-q100.tsv

python run_score.py --measure_key mscp --dataset_name nq --rank_result_filename nq-bm25-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name nq --rank_result_filename nq-bm25-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-t5-q100.tsv

python run_score.py --measure_key mscp --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name fiqa --rank_result_filename fiqa-bm25-t5-q100.tsv

python run_score.py --measure_key mscp --dataset_name fiqa --rank_result_filename fiqa-bm25-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name fiqa --rank_result_filename fiqa-bm25-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-t5-q100.tsv

python run_score.py --measure_key mscp --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name fever --rank_result_filename fever-bm25-t5-q100.tsv

python run_score.py --measure_key mscp --dataset_name fever --rank_result_filename fever-bm25-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name fever --rank_result_filename fever-bm25-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name climate-fever --rank_result_filename climate-fever-bm25-t5-q100.tsv

python run_score.py --measure_key mscp --dataset_name climate-fever --rank_result_filename climate-fever-bm25-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name climate-fever --rank_result_filename climate-fever-bm25-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-t5-q100.tsv

python run_score.py --measure_key mscp --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

# contriever-t5

python run_score.py --measure_key mscp --dataset_name nq --rank_result_filename nq-contriever-t5-q100.tsv

python run_score.py --measure_key mscp --dataset_name nq --rank_result_filename nq-contriever-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name nq --rank_result_filename nq-contriever-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-t5-q100.tsv

python run_score.py --measure_key mscp --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name fiqa --rank_result_filename fiqa-contriever-t5-q100.tsv

python run_score.py --measure_key mscp --dataset_name fiqa --rank_result_filename fiqa-contriever-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name fiqa --rank_result_filename fiqa-contriever-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-t5-q100.tsv

python run_score.py --measure_key mscp --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name fever --rank_result_filename fever-contriever-t5-q100.tsv

python run_score.py --measure_key mscp --dataset_name fever --rank_result_filename fever-contriever-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name fever --rank_result_filename fever-contriever-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name climate-fever --rank_result_filename climate-fever-contriever-t5-q100.tsv

python run_score.py --measure_key mscp --dataset_name climate-fever --rank_result_filename climate-fever-contriever-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name climate-fever --rank_result_filename climate-fever-contriever-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-t5-q100.tsv

python run_score.py --measure_key mscp --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

# bm25-colbert

python run_score.py --measure_key mscp --dataset_name nq --rank_result_filename nq-bm25-colbert-q100.tsv

python run_score.py --measure_key mscp --dataset_name nq --rank_result_filename nq-bm25-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name nq --rank_result_filename nq-bm25-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-colbert-q100.tsv

python run_score.py --measure_key mscp --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name fiqa --rank_result_filename fiqa-bm25-colbert-q100.tsv

python run_score.py --measure_key mscp --dataset_name fiqa --rank_result_filename fiqa-bm25-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name fiqa --rank_result_filename fiqa-bm25-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-colbert-q100.tsv

python run_score.py --measure_key mscp --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name fever --rank_result_filename fever-bm25-colbert-q100.tsv

python run_score.py --measure_key mscp --dataset_name fever --rank_result_filename fever-bm25-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name fever --rank_result_filename fever-bm25-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name climate-fever --rank_result_filename climate-fever-bm25-colbert-q100.tsv

python run_score.py --measure_key mscp --dataset_name climate-fever --rank_result_filename climate-fever-bm25-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name climate-fever --rank_result_filename climate-fever-bm25-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-colbert-q100.tsv

python run_score.py --measure_key mscp --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours


# contriever-colbert

python run_score.py --measure_key mscp --dataset_name nq --rank_result_filename nq-contriever-colbert-q100.tsv

python run_score.py --measure_key mscp --dataset_name nq --rank_result_filename nq-contriever-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name nq --rank_result_filename nq-contriever-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-colbert-q100.tsv

python run_score.py --measure_key mscp --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name fiqa --rank_result_filename fiqa-contriever-colbert-q100.tsv

python run_score.py --measure_key mscp --dataset_name fiqa --rank_result_filename fiqa-contriever-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name fiqa --rank_result_filename fiqa-contriever-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-colbert-q100.tsv

python run_score.py --measure_key mscp --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name fever --rank_result_filename fever-contriever-colbert-q100.tsv

python run_score.py --measure_key mscp --dataset_name fever --rank_result_filename fever-contriever-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name fever --rank_result_filename fever-contriever-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name climate-fever --rank_result_filename climate-fever-contriever-colbert-q100.tsv

python run_score.py --measure_key mscp --dataset_name climate-fever --rank_result_filename climate-fever-contriever-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name climate-fever --rank_result_filename climate-fever-contriever-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key mscp --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-colbert-q100.tsv

python run_score.py --measure_key mscp --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key mscp --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

#### cse
# bm25

python run_score.py --measure_key cse --dataset_name nq --rank_result_filename nq-bm25-top10-q100.tsv

python run_score.py --measure_key cse --dataset_name nq --rank_result_filename nq-bm25-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name nq --rank_result_filename nq-bm25-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-top10-q100.tsv

python run_score.py --measure_key cse --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name fiqa --rank_result_filename fiqa-bm25-top10-q100.tsv

python run_score.py --measure_key cse --dataset_name fiqa --rank_result_filename fiqa-bm25-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name fiqa --rank_result_filename fiqa-bm25-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-top10-q100.tsv

python run_score.py --measure_key cse --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name fever --rank_result_filename fever-bm25-top10-q100.tsv

python run_score.py --measure_key cse --dataset_name fever --rank_result_filename fever-bm25-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name fever --rank_result_filename fever-bm25-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name climate-fever --rank_result_filename climate-fever-bm25-top10-q100.tsv

python run_score.py --measure_key cse --dataset_name climate-fever --rank_result_filename climate-fever-bm25-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name climate-fever --rank_result_filename climate-fever-bm25-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-top10-q100.tsv

python run_score.py --measure_key cse --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

# contriever

python run_score.py --measure_key cse --dataset_name nq --rank_result_filename nq-contriever-top10-q100.tsv

python run_score.py --measure_key cse --dataset_name nq --rank_result_filename nq-contriever-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name nq --rank_result_filename nq-contriever-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-top10-q100.tsv

python run_score.py --measure_key cse --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name fiqa --rank_result_filename fiqa-contriever-top10-q100.tsv

python run_score.py --measure_key cse --dataset_name fiqa --rank_result_filename fiqa-contriever-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name fiqa --rank_result_filename fiqa-contriever-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-top10-q100.tsv

python run_score.py --measure_key cse --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name fever --rank_result_filename fever-contriever-top10-q100.tsv

python run_score.py --measure_key cse --dataset_name fever --rank_result_filename fever-contriever-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name fever --rank_result_filename fever-contriever-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name climate-fever --rank_result_filename climate-fever-contriever-top10-q100.tsv

python run_score.py --measure_key cse --dataset_name climate-fever --rank_result_filename climate-fever-contriever-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name climate-fever --rank_result_filename climate-fever-contriever-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-top10-q100.tsv

python run_score.py --measure_key cse --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-top10-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-top10-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

# bm25-cross-encoder

python run_score.py --measure_key cse --dataset_name nq --rank_result_filename nq-bm25-cross-encoder-q100.tsv

python run_score.py --measure_key cse --dataset_name nq --rank_result_filename nq-bm25-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name nq --rank_result_filename nq-bm25-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-cross-encoder-q100.tsv

python run_score.py --measure_key cse --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name fiqa --rank_result_filename fiqa-bm25-cross-encoder-q100.tsv

python run_score.py --measure_key cse --dataset_name fiqa --rank_result_filename fiqa-bm25-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name fiqa --rank_result_filename fiqa-bm25-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-cross-encoder-q100.tsv

python run_score.py --measure_key cse --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name fever --rank_result_filename fever-bm25-cross-encoder-q100.tsv

python run_score.py --measure_key cse --dataset_name fever --rank_result_filename fever-bm25-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name fever --rank_result_filename fever-bm25-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name climate-fever --rank_result_filename climate-fever-bm25-cross-encoder-q100.tsv

python run_score.py --measure_key cse --dataset_name climate-fever --rank_result_filename climate-fever-bm25-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name climate-fever --rank_result_filename climate-fever-bm25-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-cross-encoder-q100.tsv

python run_score.py --measure_key cse --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

# contriever-cross-encoder

python run_score.py --measure_key cse --dataset_name nq --rank_result_filename nq-contriever-cross-encoder-q100.tsv

python run_score.py --measure_key cse --dataset_name nq --rank_result_filename nq-contriever-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name nq --rank_result_filename nq-contriever-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-cross-encoder-q100.tsv

python run_score.py --measure_key cse --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name fiqa --rank_result_filename fiqa-contriever-cross-encoder-q100.tsv

python run_score.py --measure_key cse --dataset_name fiqa --rank_result_filename fiqa-contriever-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name fiqa --rank_result_filename fiqa-contriever-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-cross-encoder-q100.tsv

python run_score.py --measure_key cse --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name fever --rank_result_filename fever-contriever-cross-encoder-q100.tsv

python run_score.py --measure_key cse --dataset_name fever --rank_result_filename fever-contriever-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name fever --rank_result_filename fever-contriever-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name climate-fever --rank_result_filename climate-fever-contriever-cross-encoder-q100.tsv

python run_score.py --measure_key cse --dataset_name climate-fever --rank_result_filename climate-fever-contriever-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name climate-fever --rank_result_filename climate-fever-contriever-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-cross-encoder-q100.tsv

python run_score.py --measure_key cse --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-cross-encoder-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-cross-encoder-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

# bm25-rankgpt

python run_score.py --measure_key cse --dataset_name nq --rank_result_filename nq-bm25-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name nq --rank_result_filename nq-bm25-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name nq --rank_result_filename nq-bm25-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name nq --rank_result_filename nq-bm25-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name fiqa --rank_result_filename fiqa-bm25-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name fiqa --rank_result_filename fiqa-bm25-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name fiqa --rank_result_filename fiqa-bm25-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name fiqa --rank_result_filename fiqa-bm25-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours


python run_score.py --measure_key cse --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name fever --rank_result_filename fever-bm25-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name fever --rank_result_filename fever-bm25-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name fever --rank_result_filename fever-bm25-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name fever --rank_result_filename fever-bm25-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name climate-fever --rank_result_filename climate-fever-bm25-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name climate-fever --rank_result_filename climate-fever-bm25-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name climate-fever --rank_result_filename climate-fever-bm25-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name climate-fever --rank_result_filename climate-fever-bm25-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

# contriever-rankgpt

python run_score.py --measure_key cse --dataset_name nq --rank_result_filename nq-contriever-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name nq --rank_result_filename nq-contriever-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name nq --rank_result_filename nq-contriever-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name nq --rank_result_filename nq-contriever-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name fiqa --rank_result_filename fiqa-contriever-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name fiqa --rank_result_filename fiqa-contriever-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name fiqa --rank_result_filename fiqa-contriever-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name fiqa --rank_result_filename fiqa-contriever-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name fever --rank_result_filename fever-contriever-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name fever --rank_result_filename fever-contriever-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name fever --rank_result_filename fever-contriever-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name fever --rank_result_filename fever-contriever-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name climate-fever --rank_result_filename climate-fever-contriever-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name climate-fever --rank_result_filename climate-fever-contriever-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name climate-fever --rank_result_filename climate-fever-contriever-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name climate-fever --rank_result_filename climate-fever-contriever-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-rankgpt-qwen7b-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-rankgpt-llama8b-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-rankgpt-dsv3-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-rankgpt-dsv3-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

# bm25-t5

python run_score.py --measure_key cse --dataset_name nq --rank_result_filename nq-bm25-t5-q100.tsv

python run_score.py --measure_key cse --dataset_name nq --rank_result_filename nq-bm25-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name nq --rank_result_filename nq-bm25-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-t5-q100.tsv

python run_score.py --measure_key cse --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name fiqa --rank_result_filename fiqa-bm25-t5-q100.tsv

python run_score.py --measure_key cse --dataset_name fiqa --rank_result_filename fiqa-bm25-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name fiqa --rank_result_filename fiqa-bm25-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-t5-q100.tsv

python run_score.py --measure_key cse --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name fever --rank_result_filename fever-bm25-t5-q100.tsv

python run_score.py --measure_key cse --dataset_name fever --rank_result_filename fever-bm25-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name fever --rank_result_filename fever-bm25-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name climate-fever --rank_result_filename climate-fever-bm25-t5-q100.tsv

python run_score.py --measure_key cse --dataset_name climate-fever --rank_result_filename climate-fever-bm25-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name climate-fever --rank_result_filename climate-fever-bm25-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-t5-q100.tsv

python run_score.py --measure_key cse --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

# contriever-t5

python run_score.py --measure_key cse --dataset_name nq --rank_result_filename nq-contriever-t5-q100.tsv

python run_score.py --measure_key cse --dataset_name nq --rank_result_filename nq-contriever-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name nq --rank_result_filename nq-contriever-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-t5-q100.tsv

python run_score.py --measure_key cse --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name fiqa --rank_result_filename fiqa-contriever-t5-q100.tsv

python run_score.py --measure_key cse --dataset_name fiqa --rank_result_filename fiqa-contriever-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name fiqa --rank_result_filename fiqa-contriever-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-t5-q100.tsv

python run_score.py --measure_key cse --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name fever --rank_result_filename fever-contriever-t5-q100.tsv

python run_score.py --measure_key cse --dataset_name fever --rank_result_filename fever-contriever-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name fever --rank_result_filename fever-contriever-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name climate-fever --rank_result_filename climate-fever-contriever-t5-q100.tsv

python run_score.py --measure_key cse --dataset_name climate-fever --rank_result_filename climate-fever-contriever-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name climate-fever --rank_result_filename climate-fever-contriever-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-t5-q100.tsv

python run_score.py --measure_key cse --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-t5-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-t5-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

# bm25-colbert

python run_score.py --measure_key cse --dataset_name nq --rank_result_filename nq-bm25-colbert-q100.tsv

python run_score.py --measure_key cse --dataset_name nq --rank_result_filename nq-bm25-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name nq --rank_result_filename nq-bm25-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-colbert-q100.tsv

python run_score.py --measure_key cse --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name nfcorpus --rank_result_filename nfcorpus-bm25-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name fiqa --rank_result_filename fiqa-bm25-colbert-q100.tsv

python run_score.py --measure_key cse --dataset_name fiqa --rank_result_filename fiqa-bm25-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name fiqa --rank_result_filename fiqa-bm25-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-colbert-q100.tsv

python run_score.py --measure_key cse --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-bm25-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name fever --rank_result_filename fever-bm25-colbert-q100.tsv

python run_score.py --measure_key cse --dataset_name fever --rank_result_filename fever-bm25-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name fever --rank_result_filename fever-bm25-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name climate-fever --rank_result_filename climate-fever-bm25-colbert-q100.tsv

python run_score.py --measure_key cse --dataset_name climate-fever --rank_result_filename climate-fever-bm25-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name climate-fever --rank_result_filename climate-fever-bm25-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-colbert-q100.tsv

python run_score.py --measure_key cse --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name hotpotqa --rank_result_filename hotpotqa-bm25-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours


# contriever-colbert

python run_score.py --measure_key cse --dataset_name nq --rank_result_filename nq-contriever-colbert-q100.tsv

python run_score.py --measure_key cse --dataset_name nq --rank_result_filename nq-contriever-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name nq --rank_result_filename nq-contriever-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-colbert-q100.tsv

python run_score.py --measure_key cse --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name nfcorpus --rank_result_filename nfcorpus-contriever-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name fiqa --rank_result_filename fiqa-contriever-colbert-q100.tsv

python run_score.py --measure_key cse --dataset_name fiqa --rank_result_filename fiqa-contriever-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name fiqa --rank_result_filename fiqa-contriever-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-colbert-q100.tsv

python run_score.py --measure_key cse --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name dbpedia-entity --rank_result_filename dbpedia-entity-contriever-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name fever --rank_result_filename fever-contriever-colbert-q100.tsv

python run_score.py --measure_key cse --dataset_name fever --rank_result_filename fever-contriever-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name fever --rank_result_filename fever-contriever-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name climate-fever --rank_result_filename climate-fever-contriever-colbert-q100.tsv

python run_score.py --measure_key cse --dataset_name climate-fever --rank_result_filename climate-fever-contriever-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name climate-fever --rank_result_filename climate-fever-contriever-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

python run_score.py --measure_key cse --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-colbert-q100.tsv

python run_score.py --measure_key cse --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-colbert-q100.tsv --gen_model qwen7b --cluster_model qwen7b --ours

python run_score.py --measure_key cse --dataset_name hotpotqa --rank_result_filename hotpotqa-contriever-colbert-q100.tsv --gen_model llama8b --cluster_model llama8b --ours

#### merge

python merge_score.py

echo "All Done"

end_time=$(date +%s)
duration=$((end_time - start_time))
echo "Total time taken: $((duration / 3600)) hours $(((duration % 3600) / 60)) minutes $((duration % 60)) seconds"
