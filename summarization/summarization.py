import os
import json
from openai import OpenAI

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

base_url = os.environ.get('OPENAI_API_BASE_URL')
client = OpenAI(api_key='sk-', base_url=base_url)

def chat(query: str) -> str:
    response = client.chat.completions.create(
        model="Qwen/Qwen2-7B-Instruct",
        messages=[{"role": "user", "content": query}],
        temperature=0.0,
    )

    response = response.choices[0].message.content
    return response


def run():
    seed_everything(42)
    
    dev_path = '../data/bird/dev.json'
    with open(dev_path, 'r', encoding='utf-8') as f:
        dataset = json.load(f)

    for item in dataset:
        db = item['db_id']
        sql = item['SQL']
        query = item['question']

        # TODO:
        # 1. sql -> summarization
        # 2. evaluate result
        answer = chat("Please explain the SQL:" + query)

        print()
        print("SQL:", sql)
        print("Question:", query)
        print("Answer:", answer)
        print("====================================")

if __name__ == '__main__':
    run()