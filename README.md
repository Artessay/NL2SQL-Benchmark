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

python -c "import nltk; nltk.download('punkt')"
```

## Running

Our evaluation framework supports almost all models that can be downloaded from HuggingFace and Spider dataset and Bird dataset. You can run the benchmark with the following command and specify the model and dataset.

```sh
python runner.py -m [model_name] -d [dataset_name] -s [schema_linking_strategy]
```

## Evaluation Result

### Bird Dataset

| **Bird**             | simple | moderate | challenging | total |
|----------------------|--------|----------|-------------|-------|
| count                | 925    | 465      | 144         | 1534  |
| **ACCURACY**         |        |          |             |       |
| Qwen1.5 7B           | 26.49  | 9.46     | 4.17        | 19.23 |
| Qwen2 7B             | 45.51  | 25.38    | 19.44       | 36.96 |
| CodeS 7B             | 24.11  | 7.31     | 5.56        | 17.28 |
| Code Qwen1.5 7B      | 41.95  | 22.37    | 19.44       | 33.90 |
| Code Qwen2.5 7B      | 56.11  | 34.48    | 33.79       | 47.46 |
| Symbol LLM 7B        | 21.19  | 6.02     | 6.94        | 15.25 |
| LLaMA 8B             | 13.73  | 5.38     | 9.03        | 10.76 |
| SQL Coder 8B         | 42.49  | 22.58    | 17.36       | 34.09 |
| GLM 9B               | 47.57  | 24.73    | 19.44       | 38.01 |
| Symbol LLM 13B       | 25.84  | 9.89     | 8.33        | 19.36 |
| Qwen1.5 14B          | 39.68  | 16.99    | 10.42       | 30.05 |
| CodeS 15B            | 29.19  | 12.90    | 8.33        | 22.29 |
| Qwen1.5 32B          | 47.68  | 26.45    | 17.36       | 38.40 |
| SQL Coder 34B        | 43.78  | 24.73    | 17.36       | 35.53 |
| Granite code 34B     | 42.92  | 17.46    | 13.10       | 32.40 |
| Qwen2 72B            | 60.43  | 40.73    | 35.86       | **52.15** |

| **Bird**             | simple | moderate | challenging | total |
|----------------------|--------|----------|-------------|-------|
| count                | 925    | 465      | 144         | 1534  |
| **VES**              |        |          |             |       |
| Qwen 7B              | 27.77  | 9.92     | 4.42        | 20.17 |
| CodeS 7B             | 26.29  | 8.26     | 5.15        | 18.84 |
| Code Qwen1.5 7B      | 42.06  | 22.89    | 18.95       | 34.08 |
| Code Qwen2.5 7B      | 58.29  | 36.58    | 34.73       | 49.50 |
| Symbol LLM 7B        | 23.56  | 8.17     | 11.53       | 17.77 |
| LLaMA 8B             | 14.18  | 5.47     | 6.93        | 10.86 |
| SQL Coder 8B         | 43.76  | 23.04    | 17.47       | 35.01 |
| GLM 9B               | 50.21  | 24.61    | 20.52       | 39.66 |
| Symbol LLM 13B       | 26.78  | 10.61    | 9.07        | 20.21 |
| Qwen 14B             | 40.61  | 17.88    | 10.15       | 30.86 |
| CodeS 15B            | 30.25  | 13.49    | 6.83        | 22.97 |
| Qwen 32B             | 49.26  | 26.33    | 18.57       | 39.43 |
| SQL Coder 34B        | 46.50  | 28.34    | 17.86       | 38.30 |
| Granite code 34B     | 43.91  | 18.61    | 12.33       | 33.27 |
| Qwen2 72B            | 62.63  | 43.47    | 33.84       | 54.11 |

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