import requests

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
            return {"is_correct": True, "reason": "Can not get logical plan."} # TODO: Make this better
        
        result = response.json()
        is_correct = result['score'] > self.threshold
        logical_plan = result['logical_plan']
        return {"is_correct": is_correct, "reason": "", "logical_plan": logical_plan}

if __name__ == "__main__":
    analyzer = LogicalAnalyzer()
    status = analyzer(
        "california_schools",
        "What is the highest eligible free rate for K-12 students in the schools in Alameda County?",
        "SELECT `Free Meal Count (K-12)` / `Enrollment (K-12)` FROM frpm WHERE `County Name` = 'Alameda' ORDER BY (CAST(`Free Meal Count (K-12)` AS REAL) / `Enrollment (K-12)`) DESC LIMIT 1",
    )
    print(status)