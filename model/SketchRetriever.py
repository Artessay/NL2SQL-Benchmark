import logging
from typing import List

logging.basicConfig(level=logging.INFO) 
logger = logging.getLogger(__name__)

from model.Agent import Agent

class SketchRetriever(Agent):
    def __init__(self, args):
        super().__init__(args)

        self.memory = [
            {"role": "system", "content": self.system_prompt}
        ]

    
    def inference(self, schema:List[str], question:str, evidence:str = None):
        # retrieve
        self.memory.append({"role": "user", "content": self.retrieve_prompt(schema, question)})
        response = self.model.chat(self.memory)
        self.memory.append({"role": "assistant", "content": response})
        logger.info(f"Retrieve: \n{response}")

        # generate
        self.memory.append({"role": "user", "content": self.get_prompt(schema, question, evidence)})
        response = self.model.chat(self.memory)
        return self.fetch_code(response, code_type="sql", default=";")

    def retrieve_prompt(self, schema:List[str], question:str):
        schema = "\n".join(schema) if isinstance(schema, list) else schema

        return f"""
To assist the user in creating SQL query, please analyze the user's query and examine the query for:

    Query Dimensions: Identify the main dimensions or variables involved.
    Filter Conditions: Note any specific criteria or limitations applied to the data.
    Aggregation Functions: Determine if any aggregation functions are required.
    Grouping Requirements: Determine if the data needs to be grouped in a particular way.
    Sorting Requirements: Identify any sorting preferences specified by the user.

User Query: {question}

Database Schema:
{schema}

Return the result in this format:

    Query Dimensions: [List the dimensions]
    Filter Conditions: [Optional, List the conditions if any]
    Aggregation Functions: [Optional, List the aggregation functions if any]
    Grouping Requirements: [Optional, List the grouping requirements if any]
    Sorting Requirements: [Optional, List the sorting requirements if any]

There is no need to include the SQL query in the response. Only the dimensions, filters, grouping, and sorting requirements are required.
"""

if __name__ == "__main__":
    model = SketchRetriever()
    print(model.prompt)