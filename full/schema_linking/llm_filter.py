import sqlite3
import os
import json

def get_llm_filterd_table_schema(sqlite_path, result_path):
    if not os.path.exists(result_path):
        raise FileNotFoundError(f"{result_path} does not exist.")
    
    with open(result_path, 'r', encoding='utf-8') as file:
        selected_columns_json = json.load(file)
    selected_columns = [column_json['column_name'] for column_json in selected_columns_json] 

    create_statements, insert_statements = create_new_database_with_selected_columns(sqlite_path, selected_columns, test_sql=True, insert_sql_num=5)
    
    statements = create_statements + insert_statements
    schema = "\n\n".join(statements)
    return schema

def create_new_database_with_selected_columns(original_db, selected_columns_ori, insert_sql_num=5, test_sql=False):
    if test_sql:
        if os.path.exists('/tmp/temp.sqlite'):
            os.remove('/tmp/temp.sqlite')
    
    # 解析输入的列名列表
    selected_columns_dict = {}
    for item in selected_columns_ori:
        if '.' in item and len(item.split('.')) == 2:
            table, column = item.split('.')
            column = column.strip('`')
            if table not in selected_columns_dict:
                selected_columns_dict[table] = []
            selected_columns_dict[table].append(column)

    # 连接到原始数据库
    conn_orig = sqlite3.connect(original_db)
    cursor_orig = conn_orig.cursor()

    # 创建新的数据库
    if test_sql:
        conn_new = sqlite3.connect('/tmp/temp.sqlite')
        cursor_new = conn_new.cursor()

    create_statements = []
    insert_statements = []
    for selected_table, selected_columns in selected_columns_dict.items():
        # 判断表是否存在
        cursor_orig.execute("SELECT name FROM sqlite_master WHERE type='table';")
        tables = cursor_orig.fetchall()
        # 提取表名列表
        table_names = [table[0] for table in tables]
        if selected_table not in table_names:
            continue

        # 获取原始表结构
        cursor_orig.execute(f"PRAGMA table_info('{selected_table}');")
        table_info = cursor_orig.fetchall()
        primary_key_count = sum(1 for column in table_info if column[5] != 0)

        # 获取表结构信息
        cursor_orig.execute(f"PRAGMA table_info('{selected_table}')")
        selected_table_all_column = cursor_orig.fetchall()
        selected_table_all_column = [col[1] for col in selected_table_all_column]

        if len(set(selected_columns) & set(selected_table_all_column)) == 0:
            continue
        
        # 构建新表的CREATE TABLE语句
        create_table_sql = f"CREATE TABLE '{selected_table}' \n(\n"
        primary_keys = []
        for column_info in table_info:
            col_name = column_info[1]
            col_type = column_info[2]
            col_notnull = column_info[3]
            col_dflt_value = column_info[4]
            col_pk = column_info[5]

            if col_name in selected_table_all_column:
                if col_name in selected_columns:
                    create_table_sql += f"\t'{col_name}'\t{col_type}"
                    if col_notnull:
                        create_table_sql += "\tNOT NULL"
                    else:
                        create_table_sql += "\tNULL"
                    if col_dflt_value is not None:
                        create_table_sql += f"\tDEFAULT {col_dflt_value}"
                    # 添加主键约束
                    if col_pk:
                        primary_keys.append(col_name)
                        # create_table_sql += f"\n\t\tprimary key"
                    create_table_sql += ",\n"
        
        if primary_keys and primary_key_count == len(set(primary_keys)):
            create_table_sql += "\tPRIMARY KEY(" + ", ".join(f"'{pk}'" for pk in primary_keys) + "),\n"
        
        # 添加外键约束
        cursor_orig.execute(f"PRAGMA foreign_key_list('{selected_table}');")
        foreign_keys = cursor_orig.fetchall()
        
        for fk in foreign_keys:
            from_table = fk[2]
            from_column = fk[4]
            to_column = fk[3]
            if from_table is not None and from_column is not None and to_column is not None:
                if selected_table + '.' + to_column in selected_columns_ori and from_table + '.' + from_column in selected_columns_ori:
                    create_table_sql += f"\tforeign key ('{to_column}') references '{from_table}' ('{from_column}')"
        
        # 移除最后的逗号和空格，并添加结束括号
        create_table_sql = create_table_sql.rstrip(",\n") + "\n);"

        # 创建新表
        if test_sql:
            cursor_new.execute(create_table_sql)
        create_statements.append(create_table_sql)
        
        selected_column_sort = []
        for col in selected_table_all_column:
            if col in selected_columns:
                selected_column_sort.append("'" + col + "'")

        # 获取表中所有数据
        cursor_orig.execute(f"SELECT * FROM '{selected_table}'")
        rows = cursor_orig.fetchall()

        # 生成插入语句
        for row in rows[:insert_sql_num]:
            values_list = []
            for index, value in enumerate(row):
                if selected_table_all_column[index] in selected_columns:
                    if value is None:
                        values_list.append("Null")
                    elif isinstance(value, str):
                        if '"' in value and "'" not in value:
                            values_list.append(f"'{str(value)}'")
                        elif '"' not in value and "'" in value:
                            values_list.append(f'"{str(value)}"')
                        elif '"' in value and "'" in value:
                            value = value.replace('"', "'")
                            values_list.append(f'"{str(value)}"')
                        else:
                            values_list.append(f'"{str(value)}"')
                    else:
                        values_list.append(str(value))
            values = ', '.join(values_list)
            insert_statement = f"INSERT INTO '{selected_table}' ({', '.join(selected_column_sort)}) VALUES ({values});"
            if test_sql:
                cursor_new.execute(insert_statement)
            insert_statements.append(insert_statement)

    # 提交更改并关闭连接
    if test_sql:
        conn_new.commit()
    conn_orig.close()
    if test_sql:
        conn_new.close()
    return create_statements, insert_statements

