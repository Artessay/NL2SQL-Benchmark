# Choose the engine to run, e.g. gpt-4, gpt-4-32k, gpt-4-turbo, gpt-35-turbo, GPT35-turbo-instruct
engine='qwen2-72b-instruct'

# Choose the number of threads to run in parallel, 1 for single thread
num_cpus=16
meta_time_out=30.0

# Choose the SQL dialect to run, e.g. SQLite, MySQL, PostgreSQL
# PLEASE NOTE: You have to setup the database information in evaluation_utils.py 
# if you want to run the evaluation script using MySQL or PostgreSQL
# sql_dialect='SQLite'
sql_dialect='MySQL'
# sql_dialect='PostgreSQL'

db_root_path='./data/dev_databases/'
data_mode='mini_dev' # dev, train, mini_dev

# Path where the ground truth SQL queries are stored
case "${sql_dialect}" in
    SQLite)
        diff_json_path='./data/mini_dev_sqlite.json'
        ;;
    MySQL)
        diff_json_path='./data/mini_dev_mysql.json'
        ;;
    PostgreSQL)
        diff_json_path='./data/mini_dev_postgresql.json'
        ;;
    *)
        echo "Unsupported sql_dialect: ${sql_dialect}"
        exit 1
        ;;
esac

# Path where the predicted SQL queries are stored
use_knowledge='True'
if [ "$use_knowledge" = "True" ]; then
    predicted_sql_path='./exp_result/turbo_output_kg/'
else
    predicted_sql_path='./exp_result/turbo_output/'
fi

ground_truth_path='./data/'
mode_gt='gt'
mode_predict='gpt'

# Load environment variables from .env file
if [ -f ./.env ]; then
    set -a
    source ./.env
    set +a
else
    echo ".env file not found!"
    exit 1
fi

echo "starting to compare with knowledge for ex engine: ${engine} sql_dialect: ${sql_dialect}"
python3 -u ./src/evaluation_ex.py --db_root_path ${db_root_path} --predicted_sql_path ${predicted_sql_path} --data_mode ${data_mode} \
--ground_truth_path ${ground_truth_path} --num_cpus ${num_cpus} --mode_gt ${mode_gt} --mode_predict ${mode_predict} \
--diff_json_path ${diff_json_path} --meta_time_out ${meta_time_out} --engine ${engine} --sql_dialect ${sql_dialect}



echo "starting to compare with knowledge for ves engine: ${engine} sql_dialect: ${sql_dialect}"
python3 -u ./src/evaluation_ves.py --db_root_path ${db_root_path} --predicted_sql_path ${predicted_sql_path} --data_mode ${data_mode} \
--ground_truth_path ${ground_truth_path} --num_cpus ${num_cpus} --mode_gt ${mode_gt} --mode_predict ${mode_predict} \
--diff_json_path ${diff_json_path} --meta_time_out ${meta_time_out}  --engine ${engine} --sql_dialect ${sql_dialect}


echo "starting to compare with knowledge for soft-f1 engine: ${engine} sql_dialect: ${sql_dialect}"
python3 -u ./src/evaluation_f1.py --db_root_path ${db_root_path} --predicted_sql_path ${predicted_sql_path} --data_mode ${data_mode} \
--ground_truth_path ${ground_truth_path} --num_cpus ${num_cpus} --mode_gt ${mode_gt} --mode_predict ${mode_predict} \
--diff_json_path ${diff_json_path} --meta_time_out ${meta_time_out}  --engine ${engine} --sql_dialect ${sql_dialect}