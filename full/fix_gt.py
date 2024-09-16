from tqdm import tqdm
from utils import (
    get_args,
    load_dataset,
    get_output_file,
)

def fix_gt(args):
    assert args.data_name == 'bird'
    dataset = load_dataset(args.data_path)
    result_file = get_output_file(args.result_path, mode='r')
    output_file = get_output_file(args.gt_result_path, mode='w')

    for item in tqdm(dataset):
        db = item['db_id']

        line: str = result_file.readline()
        line = line.strip().replace('\t', ' ')
        if line.startswith('CREATE'):
            line = ';'
        response = line + '\t' + db + '\n'
        output_file.write(response)

    result_file.close()
    output_file.close()

if __name__ == '__main__':
    args = get_args()
    fix_gt(args)