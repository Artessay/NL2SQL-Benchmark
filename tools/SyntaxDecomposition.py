
class SyntaxDecomposition():
    def __init__(self):
        self.prompt = """
To assist the user in creating a sql, follow these steps:

1. Analyze the User's Query: Examine the query for:

    Query Dimensions: Identify the main dimensions or variables involved.
    Filter Conditions: Note any specific criteria or limitations applied to the data.
    Grouping Requirements: Determine if the data needs to be grouped in a particular way.
    Sorting Requirements: Identify any sorting preferences specified by the user.
    
2. Translate the Query: Convert the user's natural language query into a clear, structured question that specifies the data.

User Query: %s

Return the result in this format:

    Query: [Rephrased natural language question for data retrieval]
    Query Dimensions: [List the dimensions]
    Other Requirements: [List any additional criteria or instructions]
"""

if __name__ == "__main__":
    model = SyntaxDecomposition()
    print(model.prompt)