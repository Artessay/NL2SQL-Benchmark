

from model import Base

class Rule(Base):
    def __init__(self, args):
        super().__init__(args)

    def inference(self, schema:str, question:str, evidence:str = None):
        schema = "\n".join(schema) if isinstance(schema, list) else schema
        query = self.get_prompt(schema, question, evidence)
        response = self.model.generate(query)
        return self.fetch_code(response, code_type="sql", default=";")

    def get_prompt(self, schema:str, question:str, evidence:str = None) -> str:
        # base prompt for the question
        base_prompt = "The databse schema is as follows:\n" + schema + "\nWrite Sql for the following question: " + question
        
        # if extra knowledge is provided, add it to the prompt
        if evidence is not None:
            knowledge_prompt = "\n" + "Consider the extra knowledge, it is very useful to help you understand the question and the corresponding sql: " + evidence
        else:
            knowledge_prompt = ""

        rule_prompt = "\n\n" + "Besides, the following instructions are useful to help you write sql:" + """
1. When you need to find the highest or lowest values based on a certain condition, using ORDER BY + LIMIT 1 is prefered over using MAX/MIN within sub queries.
2. If predicted query includes an ORDER BY clause to sort the results, you should only include the column(s) used for sorting in the SELECT clause if the question specifically ask for them. Otherwise, omit these columns from the SELECT.
3. If the question doesn't specify exactly which columns to select, between name column and id column, prefer to select id column.
4. Make sure you only output the information that is asked in the question. If the question asks for a specific column, make sure to only include that column in the SELECT clause, nothing more.
5. Predicted query should return all of the information asked in the question without any missing or extra information.
6. For key phrases mentioned in the question, we have provided the most similar values within the columns denoted by "-- examples" in front of the corresponding column names. This is a crucial hint indicating the correct columns to use for your SQL query.
7. No matter of how many things the question asks, you should only return one SQL query as the answer having all the information asked in the question, seperated by a comma.
8. Never use || to concatenate columns in the SELECT. Rather output the columns as they are.
9. If you are joining multiple tables, make sure to use alias names for the tables and use the alias names to reference the columns in the query. Use T1, T2, T3, ... as alias names.
10. If you are doing a logical operation on a column, such as mathematical operations and sorting, make sure to filter null values within those columns.
"""
        
        base_ans_prompt = "\n" + "And lastly, only write sql with no comments." 

        return base_prompt + knowledge_prompt + rule_prompt + base_ans_prompt

    def fetch_code(self, response: str, code_type: str, default: str = "") -> str:
        # fetch code block
        if "```" in response:
            code = response.split("```")[1]
        else:
            code = response

        # remove code type from the beginning of the code block
        length = len(code_type) + 1
        if f'{code_type}\n' in code[:length]:
            code = code[length:]

        # if code is empty, return default value
        if code == "":
            code = default

        return code