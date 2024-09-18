# Choose the engine to run, e.g. gpt-4, gpt-4-32k, gpt-4-turbo, gpt-35-turbo, GPT35-turbo-instruct
engine='qwen2-72b-instruct'

# Choose the number of threads to run in parallel, 1 for single thread
num_threads=3

# Choose the SQL dialect to run, e.g. SQLite, MySQL, PostgreSQL
# PLEASE NOTE: You have to setup the database information in table_schema.py 
# if you want to run the evaluation script using MySQL or PostgreSQL
# sql_dialect='SQLite'
sql_dialect='MySQL'
# sql_dialect='PostgreSQL'

db_root_path='./data/dev_databases/'
use_knowledge='True'
mode='mini_dev' # dev, train, mini_dev
cot='True'


# Load environment variables from .env file
if [ -f ./.env ]; then
    set -a
    source ./.env
    set +a
else
    echo ".env file not found!"
    exit 1
fi

# Check that required variables are set
if [ -z "${API_KEY}" ] || [ -z "${API_BASE_URL}" ]; then
    echo "Error: API_KEY or API_BASE_URL is not set in .env file"
    exit 1
fi

# Set eval_path based on sql_dialect
case "${sql_dialect}" in
    SQLite)
        eval_path='./data/mini_dev_sqlite.json'
        ;;
    MySQL)
        eval_path='./data/mini_dev_mysql.json'
        ;;
    PostgreSQL)
        eval_path='./data/mini_dev_postgresql.json'
        ;;
    *)
        echo "Unsupported sql_dialect: ${sql_dialect}"
        exit 1
        ;;
esac

# Choose the output path for the generated SQL queries
if [ "$use_knowledge" = "True" ]; then
    data_output_path='./exp_result/turbo_output_kg/'
else
    data_output_path='./exp_result/turbo_output/'
fi

echo "generate $engine batch, run in $num_threads threads, with knowledge: $use_knowledge, with chain of thought: $cot"
python3 -u ./src/gpt_request.py --db_root_path ${db_root_path} --api_key ${API_KEY} --mode ${mode} \
--engine ${engine} --eval_path ${eval_path} --data_output_path ${data_output_path} --use_knowledge ${use_knowledge} \
--chain_of_thought ${cot} --num_process ${num_threads} --sql_dialect ${sql_dialect}