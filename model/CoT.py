import re
import json5
import logging

logging.basicConfig(level=logging.INFO) 
logger = logging.getLogger(__name__)

from model import Base

class CoT(Base):
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
            if response_sql is None or len(response_sql) == 0:
                raise ValueError("SQL query not found in the response.")
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
{schema}

This schema offers an in-depth description of the database's architecture, detailing tables, columns, primary keys, foreign keys, and any pertinent information regarding relationships or constraints. Special attention should be given to the examples listed beside each column, as they directly hint at which columns are relevant to our query.

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