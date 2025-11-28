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
| Qwen3 7B             | 0.879| 0.812  | 0.672| 0.524 |0.758|
| Code Qwen2.5 32B     | 0.827| 0.841  | 0.718| 0.548 |0.770|
| DeepSeek-R1 70B      | 0.774| 0.796  | 0.603| 0.482 |0.708|
| Qwen2.5 72B          | 0.915| 0.863  | 0.724| 0.633 |0.815|
| DeepSeek-R1          | 0.863| 0.787  | 0.736| 0.578 |0.763|

### Bird Dataset

| **Bird**             | simple | moderate | challenging | total |
|----------------------|--------|----------|-------------|-------|
| count                | 925    | 465      | 144         | 1534  |
| **ACCURACY**         |        |          |             |       |
| Qwen2.5 Code 7B      | 56.11  | 34.48    | 33.79       | 47.46 |
| Qwen3 7B             | 59.89  | 40.30    | 29.66       | 51.11 |
| DeepSeek-V2 Code 16B | 50.38  | 30.82    | 17.24       | 41.33 |
| DeepSeek-R1 32B      | 42.27  | 18.10    | 17.93       | 32.66 |
| QwQ 32B              | 58.92  | 40.30    | 35.86       | 51.11 |
| Qwen2.5 32B          | 61.08  | 39.87    | 33.10       | 52.02 |
| Qwen2.5 Code 32B     | 64.76  | 47.84    | 41.38       | **57.43** |
| DeepSeek-R1 70B      | 48.97  | 27.37    | 23.45       | 40.03 |
| Qwen2.5 72B          | 60.00  | 39.44    | 35.86       | 51.50 |
| DeepSeek-R1 671B     | 60.11  | 42.24    | 37.93       | 52.61 |

### The Impact of Schema Linking on NL2SQL

The performance of LLMs on NL2SQL is highly sensitive to the schema linking strategy. We provide the performance of different schema linking strategies on the Bird dataset with Qwen2.5-Coder-32B-Instruct model. The performance is calculated by the accuracy of the SQL query.

| **Bird**                 | simple | moderate | challenging | total |
|--------------------------|--------|----------|-------------|-------|
| count                    | 925    | 465      | 144         | 1534  |
| **ACCURACY**             |        |          |             |       |
| Vanilla                  | 64.76  | 47.84    | 41.38       | 57.43 |
| Gold Linker              | 68.54  | 48.28    | 42.07       | 59.91 |

### The Impact of Different Methods on NL2SQL

Qwen2 72B

| **Bird**             | simple | moderate | challenging | total |
|----------------------|--------|----------|-------------|-------|
| count                | 925    | 465      | 144         | 1534  |
| **ACCURACY**         |        |          |             |       |
| Base                 | 59.89  | 40.95    | 38.62       | 52.15 |
| Base (gold)          | 65.84  | 46.12    | 40.69       | 57.50 |
| Vote                 | 60.76  | 46.34    | 40.00       | 54.43 |
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
| Vote                 | 61.30  | 44.18    | 38.62       | 53.98 |
| Base (gold)          | 66.16  | 42.67    | 38.62       | 56.45 |
| Rule                 | 54.27  | 37.72    | 31.03       | 47.07 |
| CoT                  | 55.89  | 36.85    | 29.66       | 47.65 |
| Column Desc.         | 49.84  | 25.65    | 24.83       | 40.16 |
| Column Desc. (gold)  | 62.27  | 36.85    | 30.34       | 51.56 |
| Sketch               | 53.51  | 34.05    | 30.34       | 45.44 |
| Sketch (gold)        | 62.38  | 35.99    | 35.86       | 51.89 |

### Methods Comparison


| **Bird**             | simple | moderate | challenging | total |
|----------------------|--------|----------|-------------|-------|
| count                | 925    | 465      | 144         | 1534  |
| **ACCURACY**         |        |          |             |       |
| Base (gpt-4o)        | 60.22  | 40.09    | 31.72       | 51.43 |
| Prompt (gpt-4o)      | 57.51  | 38.36    | 29.66       | 49.09 |
| Hero-S (gpt-4o)      | 60.22  | 43.97    | 37.93       | 53.19 |
| Hero-D (gpt-4o)      | 60.65  | 40.73    | 40.00       | 52.67 |
| **ACCURACY**         |        |          |             |       |
| Base (qwen-plus)     | 66.16  | 50.65    | 49.66       | 59.91 |
| Prompt (qwen-plus)   | 64.00  | 48.28    | 49.66       | 57.89 |
| Hero-S (qwen-plus)   | 66.38  | 54.53    | 52.41       | 61.47 |
| Hero-D (qwen-plus)   | 66.81  | 52.37    | 54.48       | 61.28 |
