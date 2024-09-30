import re
from tqdm import tqdm
from utils import (
    get_args,
    load_dataset,
    get_output_file,
)

def run(args):
    assert args.language_model == "seeklhy/codes-7b"

    dataset = load_dataset(args.data_path)
    result_file = get_output_file(args.result_path, mode='r')
    output_file = open('dev_pred_s.sql', 'w')

    def extract_select_to_semicolon(text):
        pattern = r'SELECT.*?;'
        match = re.search(pattern, text, re.IGNORECASE | re.DOTALL)
        if match:
            return match.group()
        else:
            # assert False, f"Cannot find SELECT statement in {text}"
            return ";"

    for item in tqdm(dataset):
        db = item['db_id']

        response = result_file.readline()
        response = response.strip()
        response = extract_select_to_semicolon(response)
        response = response + '\n'
        output_file.write(response)

        print('Q: ', item['question'])
        print('A: ', response)


    result_file.close()
    output_file.close()

if __name__ == '__main__':
    args = get_args()
    run(args)