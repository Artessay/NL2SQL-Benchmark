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

def remove_sql_comments(sql):
    """
    Remove all SQL comments (both inline and full-line) from a SQL string.
    
    Args:
        sql (str): Input SQL string potentially containing comments.
        
    Returns:
        str: SQL string with all comments removed while preserving string literals.
        
    Handles:
    - Both single (') and double (") quoted strings
    - Escaped quotes within strings (e.g. 'It''s valid')
    - Comments appearing anywhere in the SQL
    - Preservation of newlines (to be replaced later)
    """
    result = []
    in_string = None  # Track string state: None, 'single', or 'double'
    i = 0
    n = len(sql)
    
    while i < n:
        char = sql[i]
        
        if in_string:
            # Handle quoted string content
            if (in_string == 'single' and char == "'") or (in_string == 'double' and char == '"'):
                # Check for escaped quote (SQL-standard '' or "")
                if i + 1 < n and sql[i+1] == char:
                    result.extend([char, char])
                    i += 2  # Skip escaped quote
                else:
                    in_string = None
                    result.append(char)
                    i += 1
            else:
                result.append(char)
                i += 1
        else:
            # Handle comment detection
            if char == '-' and i + 1 < n and sql[i+1] == '-':
                # Skip all characters until end of line
                while i < n and sql[i] not in ('\n', '\r'):
                    i += 1
            elif char in ("'", '"'):
                in_string = 'single' if char == "'" else 'double'
                result.append(char)
                i += 1
            else:
                result.append(char)
                i += 1
                
    return ''.join(result)

def get_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('-m', '--method', type=str, default="Base")
    parser.add_argument('-d', '--dataset', type=str, default='bird')
    parser.add_argument('-l', '--language_model', type=str, default='Qwen/Qwen2.5-Coder-32B-Instruct')
    # parser.add_argument('-l', '--language_model', type=str, default='Qwen/Qwen2-72B-Instruct')
    parser.add_argument('-s', '--schema_linker', type=str, default='VanillaLinker')

    args = parser.parse_args()
    print(args)

    args.data_path = f'data/{args.dataset}'
    args.database_path = "data/spider/database" if args.dataset == 'spider' else 'data/bird/dev_databases'

    args.schema_path = f'output/{args.dataset}/database'
    args.result_path = f'output/{args.dataset}/{args.method}/{args.language_model}/{args.schema_linker}/dev_pred.sql'
    args.gt_result_path = f'output/{args.dataset}/{args.method}/{args.language_model}/{args.schema_linker}/dev_pred_gt.sql'

    return args