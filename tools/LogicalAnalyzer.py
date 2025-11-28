import requests
import logging

logging.basicConfig(level=logging.INFO) 
logger = logging.getLogger(__name__)

class LogicalAnalyzer:
    def __init__(self, threshold: float = 0.5):
        self.url = "http://222.29.136.49:9312/hero"
        self.threshold = threshold

    def __call__(self, db_name: str, question: str, sql: str):
        payload = {
            "db_name": db_name,
            "question": question,
            "sql": sql,
        }

        response = requests.post(self.url, json=payload)
        if response.status_code != 200:
            logger.error(f"Error: {response.status_code}, {response.text}")
            return {"is_correct": True, "reason": "Can not get logical plan."} # TODO: Make this better
        
        result = response.json()
        logger.info(f"Semantic validation score: {result['score']}")
        is_correct = result['score'] > self.threshold
        logical_plan = result['logical_plan']

        nodes_score = result['node_scores']
        nodes_property = result['node_properties']
        reason = self.build_correction_signal(nodes_score, nodes_property)

        return {"is_correct": is_correct, "reason": reason, "logical_plan": logical_plan}

    def build_correction_signal(self, nodes_score: list, nodes_property: list):
        risk_nodes = []
        for node_score, node_property in zip(nodes_score, nodes_property):
            if node_score < self.threshold:
                risk_nodes.append(node_property)

        if len(risk_nodes) > 0:
            return f"Logical plan nodes {risk_nodes} may have error, please pay more attention to the corresponding SQL clauses."
        else:
            return "Not very sure whether the SQL query is semantically correct, please check it carefully."
        
        # reason = ""
        # for node_score, node_property in zip(nodes_score, nodes_property):
        #     if node_score < self.threshold:
        #         reason += f"Logical plan node {node_property} has a high risk of error.\n"
        #         # reason += f"The probability that an error occurs on logical plan node {node_property} is {1 - node_score}.\n"

        # return reason

if __name__ == "__main__":
    analyzer = LogicalAnalyzer()
    status = analyzer(
        "california_schools",
        "What is the highest eligible free rate for K-12 students in the schools in Alameda County?",
        "SELECT `Free Meal Count (K-12)` / `Enrollment (K-12)` FROM frpm WHERE `County Name` = 'Alameda' ORDER BY (CAST(`Free Meal Count (K-12)` AS REAL) / `Enrollment (K-12)`) DESC LIMIT 1",
    )
    print(status)