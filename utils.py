import os
import json
import argparse

# DEFAULT_LLM = "Qwen/Qwen2-7B-Instruct"
# DEFAULT_LLM = "THUDM/glm-4-9b-chat"
DEFAULT_LLM = "Qwen/Qwen2-72B-Instruct"

def seed_everything(seed: int):  
    import random, os
    import numpy as np
    import torch

    random.seed(seed)
    np.random.seed(seed)
    torch.manual_seed(seed)
    torch.cuda.manual_seed(seed)
    torch.backends.cudnn.benchmark = True
    torch.backends.cudnn.deterministic = True
    os.environ['PYTHONHASHSEED'] = str(seed)

def load_dataset(data_path):
    dev_path = os.path.join(data_path, 'dev.json')
    with open(dev_path, 'r', encoding='utf-8') as f:
        dataset = json.load(f)
    return dataset

def get_output_file(output_path, mode='w'):
    directory = os.path.dirname(output_path)
    os.makedirs(directory, exist_ok=True)

    return open(output_path, mode, encoding='utf8')

def get_prompt(schema:str, question:str, evidence:str = None) -> str:
    # base prompt for the question
    base_prompt = "The databse schema is as follows:\n" + schema + "\nWrite Sql for the following question: " + question
    
    # if extra knowledge is provided, add it to the prompt
    if evidence is not None:
        knowledge_prompt = "\n " + "Consider the extra knowledge, it is very useful to help you understand the question and the corresponding sql: " + evidence
    else:
        knowledge_prompt = ""
    
    base_ans_prompt = "\n" + "And lastly, only write sql with no comments." 

    return base_prompt + knowledge_prompt + base_ans_prompt

def get_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('-m', '--model_name', type=str, default=DEFAULT_LLM)
    parser.add_argument('-d', '--data_name', type=str, default='bird')
    parser.add_argument('-s', '--strategy', type=str, default='VanillaLinker')

    args = parser.parse_args()
    print(args)

    args.data_path = f'data/{args.data_name}'
    args.database_path = "data/spider/database" if args.data_name == 'spider' else 'data/bird/dev_databases'

    args.schema_path = f'output/{args.data_name}/database'
    args.result_path = f'output/{args.data_name}/{args.model_name}/{args.strategy}/dev_pred.sql'
    args.gt_result_path = f'output/{args.data_name}/{args.model_name}/{args.strategy}/dev_pred_gt.sql'

    return args