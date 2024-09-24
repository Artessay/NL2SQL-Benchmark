from flask import Flask, render_template, request
import sqlite3

app = Flask(__name__)


# 数据库名称列表
DATABASES = ['california_schools', 'card_games', 'codebase_community', 'debit_card_specializing', 'european_football_2', 'financial', 'formula_1', 'student_club', 'superhero', 'thrombosis_prediction', 'toxicology']

def get_table_schema(db_path):
    # connect to the database
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()
    cursor.execute("SELECT sql FROM sqlite_master WHERE type='table';")
    schema_statements = cursor.fetchall()
    conn.close()

    schema = "\n\n".join(statement[0] for statement in schema_statements if statement[0] is not None)
    return schema


def execute_sql(sql, db_path):
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()
    cursor.execute(sql)
    predicted_res = cursor.fetchall()
    print(f"set(predicted_res): {set(predicted_res)}")
    cursor.close()
    res = ''
    total = len(predicted_res)
    for o in predicted_res:
        res += f"{str(o)}\n\n"
    if res == '':
        res = '未查询到结果'
    
    if total > 5:
        res += f"total records = {total}\n"
    return res


@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        # 获取用户选择的数据库和输入的 SQL
        database = request.form.get('database')
        sql = request.form.get('sql')

        db_path = f'../data/bird/dev_databases/{database}/{database}.sqlite'
        schema = get_table_schema(db_path)

        # 执行 SQL 查询
        result = '查询异常'
        try:
            result = execute_sql(sql, db_path)
        except Exception as e:
            result = str(e)
        return render_template('index.html', databases=DATABASES, result=result, sql=sql, selected_database=database, table_schema=schema)

    # 渲染初始页面
    return render_template('index.html', databases=DATABASES, sql='', selected_database='', table_schema='')


if __name__ == '__main__':
    app.run(debug=True, port=5002)