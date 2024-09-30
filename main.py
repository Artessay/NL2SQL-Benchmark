import os
from tqdm import tqdm

import model
import schema_linking
from fix_gt import fix_gt
from evaluation import evaluation
from utils import (
    get_args,
    load_dataset,
    seed_everything,
    get_output_file,
)

def run(args):
    seed_everything(42)
    agent = model.load_agent(args.method, args)
    dataset = load_dataset(args.data_path)
    result_file = get_output_file(args.result_path)
    schema_linker = schema_linking.load_schema_linker(args.schema_linker)

    for item in tqdm(dataset):
        db_name = item['db_id']
        query = item['question']
        evidence = item.get('evidence', None)

        sqlite_path = os.path.join(args.database_path, db_name, f'{db_name}.sqlite')

        # get schema
        question = db_name + '\t' + query
        schema_query = query + ' ' + evidence if evidence else query
        schema = schema_linker.get_schema(sqlite_path, schema_query, question=question)
        
        response = agent.inference(schema, query, evidence)
        response = response.replace('\n',' ')
        
        print()
        print("On database:", db_name)
        print("Question:", query)
        print("LLM response:", response)
        print("Ground truth:", item['query'] if args.dataset == 'spider' else item['SQL'])
        print("====================================")

        result_file.write(response + '\n')

    result_file.close()

    if args.dataset in ['bird']:
        fix_gt(args)
    evaluation(args)

if __name__ == '__main__':
    import dotenv
    dotenv.load_dotenv()
    
    args = get_args()
    run(args)