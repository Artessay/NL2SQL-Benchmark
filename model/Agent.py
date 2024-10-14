from typing import List

from model import Base

class Agent(Base):
    def __init__(self, args, **kwargs):
        super().__init__(args, **kwargs)

        self.database_type = kwargs.pop("database_type", "SQLite")

        self.memory = [
            {"role": "system", "content": self.system_prompt}
        ]


    @property
    def system_prompt(self):
        return "You are a helpful data analyst expert."

    
    def get_prompt(self, schema:str, question:str, evidence:str = None) -> str:
        database_type = self.database_type
        schema = "\n".join(schema) if isinstance(schema, list) else schema
        
        # base prompt for the question
        base_prompt = f"""
You are a {database_type} expert. Given an input question, please create a syntactically correct {database_type} query. 

You can order the results by a relevant column to return the most interesting examples in the database.

Never query for all the columns from a specific table, only ask for a the few relevant columns given the question.

Pay attention to use only the column names that you can see in the schema description. Be careful to not query for columns that do not exist. Also, pay attention to which column is in which table.

Only use the following tables:
{schema}

Question: {question}
"""
        
        # if extra knowledge is provided, add it to the prompt
        if evidence is not None:
            knowledge_prompt = "\n " + "Consider the extra knowledge, it is very useful to help you understand the question and the corresponding SQL: " + evidence
        else:
            knowledge_prompt = ""
        
        base_ans_prompt = "\n\n" + "Please output the SQL query directly. Do NOT output any other information." 

        return base_prompt + knowledge_prompt + base_ans_prompt