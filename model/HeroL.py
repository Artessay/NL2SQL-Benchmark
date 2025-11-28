import logging

logging.basicConfig(level=logging.INFO) 
logger = logging.getLogger(__name__)

from model.HeroD import HeroD
from tools.LogicalAnalyzer import LogicalAnalyzer


class HeroL(HeroD):
    def __init__(self, args, **kwargs):
        super().__init__(args, **kwargs)

        # change the threshold
        self.logical_analyzer = LogicalAnalyzer(threshold=0.3)

    def get_lp_suggestion_prompt(self, schema, question, sql, reason, logical_plan):
        return f"""[Input Information]
Question: {question}

Database Schema:
{schema}

Predicted SQL Query:
{sql}

Logical Plan for the Predicted SQL Query:
{logical_plan}

Human Expert Feedback:
{reason}

[Analysis Steps]
1. **Understand the Requirement**: Clearly identify user's intent and the result the user wants to obtain from the question.  
2. **Validate the Query**: Determine that the query logic correctly implements the user's requirement.  
3. **Analyze the Logical Plan**: Examine the logical plan, tracing how the SQL would execute and highlighting any potential logical missteps.
4. **Mistake Identification**: If errors or mismatches are found, identify and explain them in detail.
    - Explain clearly why the mistake occurs.
    - Identify which part of the query is incorrect, redundant, or unnecessary.
    - Describe the implications of this mistake on query execution or results.
    - Provide a concise, understandable explanation suitable for someone familiar with SQL.
  If the query is correct, then briefly confirm correctness by simply answering a word "correct" without any other text.


[Output Requirements]
If the query may contain potential mistakes, then provide a detailed, step-by-step explanation of the mistake. The explanations should be concise but thorough.
Otherwise, just output a single word "correct" without any other text."""
