import re
import json5
import logging

logging.basicConfig(level=logging.INFO) 
logger = logging.getLogger(__name__)

from model import Base

class Chess(Base):
    def __init__(self, args):
        super().__init__(args)

    def inference(self, schema:str, question:str, evidence:str = None):
        schema = "\n".join(schema) if isinstance(schema, list) else schema
        query = self.get_prompt(schema, question, evidence)
        response = self.model.generate(query)
        try:
            response = self.fetch_code(response, code_type="json", default=response)
            response = self.extract_first_json(response)
            response_json: dict = json5.loads(response)
            logger.info(f"reasoning: {response_json.get('chain_of_thought_reasoning')}")
            response_sql = response_json.get("SQL")
            return response_sql
        except:
            response = self.fetch_code(response, code_type="sql", default=";")
            return response

    def get_prompt(self, schema: str, question: str, evidence: str = None) -> str:
        return f"""
You are a data science expert.
Below, you are presented with a database schema and a question.
Your task is to read the schema, understand the question, and generate a valid SQLite query to answer the question.
Before generating the final SQL query think step by step on how to write the query.

###
Database Schema: 
```sql
{schema}
```

This schema offers an in-depth description of the database's architecture, detailing tables, columns, primary keys, foreign keys, and any pertinent information regarding relationships or constraints. Special attention should be given to the examples listed beside each column, as they directly hint at which columns are relevant to our query.

Database admin instructions:
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

###
Question: 
{question} 

Hint:
{evidence if evidence else "No extra knowledge provided."}

Please respond with a JSON object structured as follows:

{{
    "chain_of_thought_reasoning": "Your thought process on how you arrived at the final SQL query.",
    "SQL": "Your SQL query in a single string."
}}

Priority should be given to columns that have been explicitly matched with examples relevant to the question's context.

Take a deep breath and think step by step to find the correct sqlite SQL query.
"""
    
    def extract_first_json(self, text: str) -> str:
        # define a regular expression pattern
        pattern = r"\{[^{}]*\}"
        
        # search for the first occurrence of the pattern in the text
        match = re.search(pattern, text)
        
        # return the matched text
        return match.group(0) if match else text