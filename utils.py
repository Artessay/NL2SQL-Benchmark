import os
import json
import argparse

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

def get_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('-m', '--method', type=str, default="Base")
    parser.add_argument('-d', '--dataset', type=str, default='bird')
    parser.add_argument('-l', '--language_model', type=str, default='Qwen/Qwen2.5-72B-Instruct')
    parser.add_argument('-s', '--schema_linker', type=str, default='VanillaLinker')

    args = parser.parse_args()
    print(args)

    args.data_path = f'data/{args.dataset}'
    args.database_path = "data/spider/database" if args.dataset == 'spider' else 'data/bird/dev_databases'

    args.schema_path = f'output/{args.dataset}/database'
    args.result_path = f'output/{args.dataset}/{args.method}/{args.language_model}/{args.schema_linker}/dev_pred.sql'
    args.gt_result_path = f'output/{args.dataset}/{args.method}/{args.language_model}/{args.schema_linker}/dev_pred_gt.sql'

    return args