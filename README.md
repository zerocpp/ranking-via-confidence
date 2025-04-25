# Ranking-via-Confidence

## 1. Data Preparation
In `generation/`, we use `make_gen_dataset.sh` and `make-q100_csv.sh` to make dataset, based on huggingface.

## 2. Retrieving and Reranking
We use [Pyserini](https://github.com/castorini/pyserini) to retrieve, with BM25 and Contriever.
In `rerank/`, we use [Rerankers](https://github.com/AnswerDotAI/rerankers.git) to rerank, executing `batch run_rerankers.sh`.
Retrieved and reranked results are saved in `data/ranking-result`.

## 3. Sampling and Clustering
We use `batch gen-qwen7b.sh` and `batch gen-llama8b.sh` to sample responses from LLMs, and use `cluster-deberta.sh`, `cluster-qwen7b.sh` and `cluster-llama8b.sh` to cluster the responses.

## 4. Rerank-via-Confidence
In `conf-rank/`, we can use `run_score.py` to run our methods based on result of some retriever and reranker, then evaluate the final ranking result using nDCG@10.
```python
# first 100 queries of NQ dataset, based on BM25 retriever and Cross-Encoder reranker
python run_score.py --measure_key cnpe --dataset_name nq --rank_result_filename nq-bm25-cross-encoder-q100.tsv
```

## 5. Visualization
The data of this paper is saved in `data/raw/`, and the visualization result is in `visual/`.
We use `qwen7b-calib.ipynb` and `nq-calib.ipynb` to draw the calibration curves.
We use `draw-rere.ipynb` to visualize the result of the cofidence-based algorithms.
The result is saved in `data/new/`.
