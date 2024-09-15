import os
import traceback
from tqdm import tqdm

import language_model
import schema_linking
from fix_gt import fix_gt
from evaluation import evaluation
from scripts.vanilla import get_table_schema_with_insert_data
from utils import (
    get_args,
    get_prompt,
    load_dataset,
    seed_everything,
    get_output_file,
)

def run(args):
    seed_everything(42)
    model = language_model.load_language_model(args.model_name)
    dataset = load_dataset(args.data_path)
    result_file = get_output_file(args.result_path)
    schema_linker = schema_linking.load_schema_linker(args.strategy)

    for item in tqdm(dataset):
        db_name = item['db_id']
        query = item['question']
        evidence = item.get('evidence', None)

        sqlite_path = os.path.join(args.database_path, db_name, f'{db_name}.sqlite')
        db_path = os.path.join(args.schema_path, db_name, f'{db_name}.sql') 

        try:
            question = db_name + '\t' + query
            schema_query = query + ' ' + evidence if evidence else query
            schema = schema_linker.get_schema(sqlite_path, schema_query, question=question)
        except Exception as e:
            traceback.print_exc()
            # few shot strategy
            schema = get_table_schema_with_insert_data(db_path)
        
        prompt = get_prompt(schema, query, evidence) 
        response = model.generate_sql(prompt)
        response = response.replace('\n',' ')
        
        print()
        print("On database:", db_name)
        print("Question:", query)
        print("LLM response:", response)
        print("Ground truth:", item['query'] if args.data_name == 'spider' else item['SQL'])
        print("====================================")

        result_file.write(response + '\n')

    result_file.close()

    if args.data_name in ['bird']:
        fix_gt(args)
    evaluation(args)

if __name__ == '__main__':
    import dotenv
    dotenv.load_dotenv()
    
    args = get_args()
    run(args)