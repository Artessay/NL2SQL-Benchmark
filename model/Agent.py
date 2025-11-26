
import json5
import logging

logging.basicConfig(level=logging.INFO) 
logger = logging.getLogger(__name__)

from model import Base


class Agent(Base):
    def __init__(self, args, **kwargs):
        super().__init__(args, **kwargs)

        self.check_prompt = "You are an experienced SQL expert responsible for verifying the correctness of a given SQL query."

    def inference(self, schema:str, question:str, evidence:str = None) -> str:
        query = self.get_prompt(schema, question, evidence)
        response = self.model.generate(query)
        sql = self.fetch_code(response, code_type="sql", default=";")

        return self.check_and_refine_sql(schema, question, evidence, sql)

    def check_and_refine_sql(self, schema: str, question: str, evidence:str, sql: str) -> str:
        question_str = question + " " + evidence if evidence else question
        schema_str = "\n".join(schema) if isinstance(schema, list) else schema
        
        # Check whether the SQL query is correct
        check_query = self.get_check_query(schema_str, question_str, sql)
        check_response = self.model.generate(check_query, system_prompt=self.check_prompt)
        logger.debug(f"Check Response: {check_response}")

        check_status_str = self.fetch_code(check_response, code_type="json", default="{}")
        check_status = json5.loads(check_status_str)
        logger.info(f"Check Status: {check_status}")

        is_correct = check_status.get("is_correct", True)
        if is_correct:
            return sql
        
        # Refine the SQL query
        suggestion = check_status.get("suggestion", "")
        refine_query = self.get_refine_prompt(schema_str, question_str, sql, suggestion)
        refine_response = self.model.generate(refine_query)
        refined_sql = self.fetch_code(refine_response, code_type="sql", default=";")

        return refined_sql

    def get_check_query(self, schema: str, question: str, sql: str) -> str:
        return f"""### Input Information  

Database Schema:  
```
{schema}
```

Question: 
{question}

Predicted SQL Query:  
```
{sql}
```

### Verification Steps  
1. **Understand the Requirement**: Clearly identify the result the user wants to obtain from the QUESTION.  
2. **Analyze the Schema**: Review the tables, columns, data types, and relationships described in the SCHEMA.  
3. **Validate the Query**:  
   - Syntax Correctness: Check if the SQL query follows correct syntax.  
   - Structural Matching: Ensure that all referenced tables and columns exist in the SCHEMA.  
   - Logical Accuracy: Confirm that the query logic correctly implements the user's requirement (including conditions, aggregations, joins, etc.).  
   - Semantic Completeness: Verify that the SQL query fully meets the user's intent as described in the QUESTION.  

### Output Requirements  
Provide the final result in JSON format with the following keys:  
- `"is_correct"`: Boolean (true/false), indicating whether the query is correct.  
- `"reason"`: String, explaining the reason for correctness or detailing the issues if incorrect.  

### Example Output  
```json
{{
  "is_correct": false,
  "reason": "The field 'user_age' referenced in the query does not exist in the 'users' table; the correct field name is 'age'."
}}
```

Now, please verify the given SQL query and output the result."""
    
    def get_refine_prompt(self, schema: str, question: str, sql: str, reason: str) -> str:
        
        # base prompt for the question
        base_prompt = "The database schema is as follows:\n```\n" + schema + "\n```\nThe question is:\n" + question
        
        refine_prompt = "\nThe following SQL statement may contain errors for answering the question." \
            + "The previous generated SQL query is:\n```\n" + sql + "\n```\nThe possible causes of the error are as follows:\n" + reason
        
        base_ans_prompt = "\n" + "Please correct the previous mistakes according to the possible causes and generate a new correct SQL query. Only write the correct sql with no comments." 

        return base_prompt + refine_prompt + base_ans_prompt
    

if __name__ == "__main__":
    import utils
    args = utils.get_args()
    model = Agent(args)
    print(model("", "Hello", ""))