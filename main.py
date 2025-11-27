from tqdm import tqdm

import model
import tools
import schema_linking
from fix_gt import fix_gt
from evaluation import evaluation
from utils import (
    get_args,
    load_dataset,
    seed_everything,
    get_output_file,
    remove_sql_comments,
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

        # get schema
        schema = schema_linker.get_schema(args.database_path, db_name, query, evidence)
        
        # set Sql Executor
        sql_executor = tools.SqlExecutor(args.database_path, db_name)
        print(sql_executor.database_path)
        exit(0)
        if hasattr(agent, 'sql_executor'):
            agent.sql_executor = sql_executor
        
        response = agent(schema, query, evidence)
        response = remove_sql_comments(response)
        response = response.replace('\n',' ')
        
        # fix empty response
        if len(response) == 0:
            response = ";"
        
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