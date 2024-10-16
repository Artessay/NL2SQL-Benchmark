# NL2SQL Benchmark

## Overview

This repository contains the code for the LLM NL2SQL Benchmark. 

## Installation

Use the following commands to install the required packages.

```sh
pip install nltk
pip install torch
pip install chardet
pip install protobuf
pip install sqlparse
pip install accelerate
pip install func_timeout
pip install transformers
pip install sentencepiece
pip install python-dotenv
pip install langchain_openai

python -c "import nltk; nltk.download('punkt')"
```

## Running

Our evaluation framework supports almost all models that can be downloaded from HuggingFace and Spider dataset and Bird dataset. You can run the benchmark with the following command and specify the model and dataset.

```sh
python main.py -m [method_name] -d [dataset_name] -l [language_model_name] -s [schema_linking_strategy]
```

## Evaluation Result

### Spider Dataset


| **Spider**           | easy | medium | hard | extra | all |
|----------------------|------|--------|------|-------|-----|
| count                | 248  | 446    | 174  | 166   | 1034|
| **ACCURACY**         |      |        |      |       |     |
| Code Qwen2.5 7B      | 0.935| 0.877  | 0.759| 0.584 |0.824|

### Bird Dataset

| **Bird**             | simple | moderate | challenging | total |
|----------------------|--------|----------|-------------|-------|
| count                | 925    | 465      | 144         | 1534  |
| **ACCURACY**         |        |          |             |       |
| Qwen2 7B             | 45.51  | 25.38    | 19.44       | 36.96 |
| Code Qwen2.5 7B      | 56.11  | 34.48    | 33.79       | 47.46 |
| GLM 9B               | 47.57  | 24.73    | 19.44       | 38.01 |
| Qwen2.5 32B          | 61.08  | 39.87    | 33.10       | 52.02 |
| Qwen2 72B            | 60.43  | 40.73    | 35.86       | **52.15** |
| Qwen2.5 72B          | 60.00  | 39.44    | 35.86       | 51.50 |

### The Impact of Schema Linking on NL2SQL

The performance of LLMs on NL2SQL is highly sensitive to the schema linking strategy. We provide the performance of different schema linking strategies on the Bird dataset with Qwen2-72B-Instruct model. The performance is calculated by the accuracy of the SQL query.

| **Bird**                 | simple | moderate | challenging | total |
|--------------------------|--------|----------|-------------|-------|
| count                    | 925    | 465      | 144         | 1534  |
| **ACCURACY**             |        |          |             |       |
| Vanilla                  | 59.89  | 40.95    | 38.62       | 52.15 |
| Gold Linker              | 65.84  | 46.12    | 40.69       | 57.50 |


| **Bird**             | simple | moderate | challenging | total |
|----------------------|--------|----------|-------------|-------|
| count                | 925    | 465      | 144         | 1534  |
| **VES**              |        |          |             |       |
| Vanilla              | 64.67  | 45.59    | 37.15       | 56.30 |
| Gold Linker          | 70.40  | 51.30    | 42.28       | 61.96 |

### The Impact of Different Methods on NL2SQL

Qwen2 72B

| **Bird**             | simple | moderate | challenging | total |
|----------------------|--------|----------|-------------|-------|
| count                | 925    | 465      | 144         | 1534  |
| **ACCURACY**         |        |          |             |       |
| Base                 | 59.89  | 40.95    | 38.62       | 52.15 |
| Base (gold)          | 65.84  | 46.12    | 40.69       | 57.50 |
| Rule                 | 36.43  | 18.53    | 15.17       | 29.01 |
| CoT                  | 39.89  | 19.18    | 24.83       | 32.20 |
| Column Desc.         | 28.76  | 13.58    | 19.31       | 23.27 |
| Column Desc. (gold)  | 65.41  | 43.32    | 36.55       | 56.00 |
| Sketch               | 9.19   | 4.53     | 8.28        | 7.69  |
| Sketch (gold)        | 60.76  | 37.50    | 30.34       | 50.85 |

Qwen2.5 Coder 7B

| **Spider**           | easy | medium | hard | extra | all |
|----------------------|------|--------|------|-------|-----|
| count                | 248  | 446    | 174  | 166   | 1034|
| **ACCURACY**         |      |        |      |       |     |
| Base                 | 93.5 |  87.7  | 75.9 | 58.4  | 82.4|
| Vote                 | 94.4 |  89.7  | 82.8 | 63.9  | 85.5|
| Rule                 | 92.7 |  83.9  | 70.1 | 57.2  | 79.4|
| CoT                  | 90.7 |  84.3  | 69.5 | 49.4  | 77.8|
| Sketch               | 89.9 |  80.5  | 67.8 | 40.4  | 74.2|

Qwen2.5 Coder 7B

| **Bird**             | simple | moderate | challenging | total |
|----------------------|--------|----------|-------------|-------|
| count                | 925    | 465      | 144         | 1534  |
| **ACCURACY**         |        |          |             |       |
| Base                 | 56.11  | 34.48    | 33.79       | 47.46 |
| Base (gold)          | 66.16  | 42.67    | 38.62       | 56.45 |
| Rule                 | 54.27  | 37.72    | 31.03       | 47.07 |
| CoT                  | 55.89  | 36.85    | 29.66       | 47.65 |
| Column Desc.         | 49.84  | 25.65    | 24.83       | 40.16 |
| Column Desc. (gold)  | 62.27  | 36.85    | 30.34       | 51.56 |
| Sketch               | 53.51  | 34.05    | 30.34       | 45.44 |
| Sketch (gold)        | 62.38  | 35.99    | 35.86       | 51.89 |
