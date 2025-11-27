
import json5
import logging

logging.basicConfig(level=logging.INFO) 
logger = logging.getLogger(__name__)

from model import Base


class Agent(Base):
    def __init__(self, args, **kwargs):
        super().__init__(args, **kwargs)

        self.check_prompt = "You are an experienced SQL expert responsible for verifying the correctness of a given SQL query."
        self.refine_prompt = "As a data analysis expert, you are to extract the necessary information from the data provided and output the corresponding SQL query based on the user's question."

    def inference(self, schema:str, question:str, evidence:str = None) -> str:
        query = self.get_prompt(schema, question, evidence)
        response = self.model.generate(query)
        sql = self.fetch_code(response, code_type="sql", default=";")

        return self.check_and_refine_sql(schema, question, evidence, sql)

    def check_and_refine_sql(self, schema: str, question: str, evidence:str, sql: str) -> str:
        question_str = question + " " + evidence if evidence else question
        schema_str = "\n".join(schema) if isinstance(schema, list) else schema
        
        check_status = self.check_sql_status(sql, schema_str, question_str)
        logger.info(f"Check Status: {check_status}")

        is_correct = check_status.get("is_correct", True)
        if is_correct:
            return sql
        
        # Refine the SQL query
        reason = check_status.get("reason", "")
        refined_sql = self.refine_sql_query(schema_str, question_str, sql, reason)

        return refined_sql

    def check_sql_status(self, sql: str, schema_str: str, question_str: str) -> str:
        # Check whether the SQL query is correct
        check_query = self.get_check_query(schema_str, question_str, sql)
        check_response = self.model.generate(check_query, system_prompt=self.check_prompt)
        logger.debug(f"Check Response: {check_response}")

        check_status_str = self.fetch_code(check_response, code_type="json", default="{}")
        check_status = json5.loads(check_status_str)

        return check_status
    
    def refine_sql_query(self, schema_str: str, question_str: str, sql: str, reason: str) -> str:
        refine_query = self.get_refine_prompt(schema_str, question_str, sql, reason)
        refine_response = self.model.generate(refine_query, system_prompt=self.refine_prompt)
        refined_sql = self.fetch_code(refine_response, code_type="sql", default=";")
        return refined_sql

    def get_check_query(self, schema: str, question: str, sql: str) -> str:
        return f"""The database schema is as follows:
```
{schema}
```

Given the question and predicted SQL query, please reflect that whether the SQL query is correct.

Question: {question}
Predicted SQL Query:  
```
{sql}
```

[Verification Steps]
1. **Understand the Requirement**: Clearly identify the result the user wants to obtain from the QUESTION.  
2. **Analyze the Schema**: Review the tables, columns, data types, and relationships described in the SCHEMA.  
3. **Validate the Query**:  
   - Syntax Correctness: Check if the SQL query follows correct syntax.  
   - Structural Matching: Ensure that all referenced tables and columns exist in the SCHEMA.  
   - Logical Accuracy: Confirm that the query logic correctly implements the user's requirement.  

[Output Requirements] 
Provide the final result in JSON format with the following keys:  
- `"reason"`: String, explaining the reason for correctness or detailing the issues if incorrect.  
- `"is_correct"`: Boolean (true/false), indicating whether the query is correct.  

[Example Output]
```json
{{
  "reason": "The reason for correctness or the issues if incorrect.",
  "is_correct": true / false
}}
```
"""
    
    def get_refine_prompt(self, schema: str, question: str, sql: str, reason: str) -> str:
        
        # base prompt for the question
        base_prompt = "The database schema is as follows:\n```\n" + schema + "\n```\nThe question is:\n" + question
        
        refine_prompt = "\nThe previous predicted SQL query is:\n```sql\n" + sql + "\n```" + \
            "\nThe human expert feedback for the SQL query is:\n" + reason
        
        base_ans_prompt = "\n" + "Based on the human expert feedback, please correct the previous mistakes and generate a new correct SQL query. Only write the correct sql with no comments." 

        return base_prompt + refine_prompt + base_ans_prompt
    

if __name__ == "__main__":
    import utils
    args = utils.get_args()
    model = Agent(args)
    print(model("", "Hello", ""))