import os
import chardet
import subprocess

def preprocess(input_folder, output_folder):
    # iterate all folders in the input folder
    for folder_name in os.listdir(input_folder):
        os.makedirs(output_folder + '/' + folder_name + '/', exist_ok=True)

        sqlite_file = f"{input_folder}/{folder_name}/{folder_name}.sqlite"
        schema_file = f"{output_folder}/{folder_name}/schema.sql"

        data_schema_file = f"{input_folder}/{folder_name}/schema.sql"
        if os.path.exists(data_schema_file):
            order = f"cp {data_schema_file} {schema_file}"
        else:
            order = f"sqlite3 {sqlite_file} .dump > {schema_file}"

        print(f"running command: {order}")
        subprocess.run(order, shell=True, check=True)

        output_path = f"{output_folder}/{folder_name}/{folder_name}.sql"
        output_file = open(output_path, "w", encoding='utf-8')
        with open(schema_file, 'rb') as f:
            result = chardet.detect(f.read())
        print(result)

        # filter_out continous Insert command
        insert_count = 0
        with open(schema_file, 'r', encoding=result['encoding']) as f:
            for line in f.readlines():
                if line.startswith("INSERT"):
                    if insert_count < 5:
                        output_file.write(line)
                    insert_count += 1
                else:
                    output_file.write(line)
                    insert_count = 0
        output_file.close()

preprocess('data/spider/database', 'output/spider/database')
preprocess('data/bird/dev_databases', 'output/bird/database')
