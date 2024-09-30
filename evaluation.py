import subprocess
from utils import get_args

def run_evaluation_spider(args):
    gold = "data/spider/dev_gold.sql"
    db = "data/spider/database/"
    table = "data/spider/tables.json"
    etype = "all"
    pred = args.result_path
    
    command = [
        "python", "evaluation/evaluation_spider.py",
        "--gold", gold,
        "--pred", pred,
        "--db", db,
        "--table", table,
        "--etype", etype
    ]
    
    subprocess.run(command)

def run_evaluation_bird(args):
    base_command = {
        "ex": "evaluation/evaluation_bird_ex.py",
        "ves": "evaluation/evaluation_bird_ves.py"
    }
    predicted_sql_json_path = args.gt_result_path
    ground_truth_sql_path = "data/bird/dev_gold.sql"
    data_mode = "dev"
    db_root_path = "data/bird/dev_databases/"
    mode_predict = "gt"
    diff_json_path = "data/bird/dev.json"

    for cmd_key in base_command:
        command = [
            "python", base_command[cmd_key],
            "--predicted_sql_json_path", predicted_sql_json_path,
            "--ground_truth_sql_path", ground_truth_sql_path,
            "--data_mode", data_mode,
            "--db_root_path", db_root_path,
            "--mode_predict", mode_predict,
            "--diff_json_path", diff_json_path
        ]
        
        subprocess.run(command)


def evaluation(args):
    if args.dataset == 'spider':
        run_evaluation_spider(args)
    elif args.dataset == 'bird':
        run_evaluation_bird(args)

if __name__ == "__main__":
    args = get_args()
    evaluation(args)