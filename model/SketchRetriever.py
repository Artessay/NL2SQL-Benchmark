import logging
from typing import List

logging.basicConfig(level=logging.INFO) 
logger = logging.getLogger(__name__)

if __name__ == '__main__':
    import os, sys
    sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from model.Agent import Agent

class SketchRetriever(Agent):
    def __init__(self, args):
        super().__init__(args)

    
    def inference(self, schema:List[str], question:str, evidence:str = None):
        # retrieve
        sketch_description = self.retrieve_sketch(schema, question, evidence)

        # generate
        evidence = f"{evidence}\n{sketch_description}" if evidence else {sketch_description}
        return super(Agent, self).inference(schema, question, evidence=evidence)

    def retrieve_sketch(self, schema:List[str], question:str, evidence:str):
        system_prompt = \
"""You are a helpful data analyst expert. Your task is to extract Query Dimensions and other necessary requirements from user's query and database schema provided.
Please return the result in this format:
    Query Dimensions: [List the dimensions]
    Filter Conditions: [Optional, List the conditions if any]
    Aggregation Functions: [Optional, List the aggregation functions if any]
    Grouping Requirements: [Optional, List the grouping requirements if any]
    Sorting Requirements: [Optional, List the sorting requirements if any]
"""
        
        messages = [
            {"role": "system", "content": system_prompt},
            {"role": "user", "content": self.retrieve_prompt(schema, question, evidence)},
        ]

        response = self.model.chat(messages)
        logger.info(f"Retrieve: \n{response}")

        return response

    def retrieve_prompt(self, schema:List[str], question:str, evidence:str):
        schema = "\n".join(schema) if isinstance(schema, list) else schema

        base_prompt = """
To assist the user in creating SQL query, please analyze the user's query and examine the query for:

    Query Dimensions: Identify the main dimensions or variables involved.
    Filter Conditions: Note any specific criteria or limitations applied to the data.
    Aggregation Functions: Determine if any aggregation functions are required.
    Grouping Requirements: Determine if the data needs to be grouped in a particular way.
    Sorting Requirements: Identify any sorting preferences specified by the user.

Return the result in this format:

    Query Dimensions: [List the dimensions]
    Filter Conditions: [Optional, List the conditions if any]
    Aggregation Functions: [Optional, List the aggregation functions if any]
    Grouping Requirements: [Optional, List the grouping requirements if any]
    Sorting Requirements: [Optional, List the sorting requirements if any]

There is no need to include the SQL query in the response. Only the dimensions, filters, grouping, and sorting requirements are required.
"""

        few_shot_prompt = """
# Example 1:

## Database Schema:
CREATE TABLE `frpm` 
(
        `CDSCode`       TEXT    NOT NULL        PRIMARY KEY,
        `Academic Year` TEXT    NULL,
        `County Code`   TEXT    NULL,
        `District Code` INTEGER NULL,
        `School Code`   TEXT    NULL,
        `County Name`   TEXT    NULL,
        `District Name` TEXT    NULL,
        `School Name`   TEXT    NULL,
        `District Type` TEXT    NULL,
        `School Type`   TEXT    NULL,
        `Educational Option Type`       TEXT    NULL,
        `NSLP Provision Status` TEXT    NULL,
        `Charter School (Y/N)`  INTEGER NULL,
        `Charter School Number` TEXT    NULL,
        `Charter Funding Type`  TEXT    NULL,
        `IRC`   INTEGER NULL,
        `Low Grade`     TEXT    NULL,
        `High Grade`    TEXT    NULL,
        `Enrollment (K-12)`     REAL    NULL,
        `Free Meal Count (K-12)`        REAL    NULL,
        `Percent (%) Eligible Free (K-12)`      REAL    NULL,
        `FRPM Count (K-12)`     REAL    NULL,
        `Percent (%) Eligible FRPM (K-12)`      REAL    NULL,
        `Enrollment (Ages 5-17)`        REAL    NULL,
        `Free Meal Count (Ages 5-17)`   REAL    NULL,
        `Percent (%) Eligible Free (Ages 5-17)` REAL    NULL,
        `FRPM Count (Ages 5-17)`        REAL    NULL,
        `Percent (%) Eligible FRPM (Ages 5-17)` REAL    NULL,
        `2013-14 CALPADS Fall 1 Certification Status`   INTEGER NULL,
        foreign key (`CDSCode`) references `schools` (`CDSCode`)
);

## User Query: 
What is the highest eligible free rate for K-12 students in the schools in Alameda County? 
Eligible free rate for K-12 = `Free Meal Count (K-12)` / `Enrollment (K-12)`

## Result:
Query Dimensions: [`Free Meal Count (K-12)` / `Enrollment (K-12)`]
Filter Conditions: [`County Name` = 'Alameda']
Aggregation Functions: [MAX]


# Example 2:

## Database Schema:
CREATE TABLE `comments` 
(
        `Id`    INTEGER NOT NULL        PRIMARY KEY,
        `PostId`        INTEGER NULL,
        `Score` INTEGER NULL,
        `Text`  TEXT    NULL,
        `CreationDate`  DATETIME        NULL,
        `UserId`        INTEGER NULL,
        `UserDisplayName`       TEXT    NULL,
        foreign key (`PostId`) references `posts` (`Id`),
        foreign key (`UserId`) references `users` (`Id`)
);

CREATE TABLE `posts` 
(
        `Id`    INTEGER NOT NULL        PRIMARY KEY,
        `PostTypeId`    INTEGER NULL,
        `AcceptedAnswerId`      INTEGER NULL,
        `CreaionDate`   DATETIME        NULL,
        `Score` INTEGER NULL,
        `ViewCount`     INTEGER NULL,
        `Body`  TEXT    NULL,
        `OwnerUserId`   INTEGER NULL,
        `LasActivityDate`       DATETIME        NULL,
        `Title` TEXT    NULL,
        `Tags`  TEXT    NULL,
        `AnswerCount`   INTEGER NULL,
        `CommentCount`  INTEGER NULL,
        `FavoriteCount` INTEGER NULL,
        `LastEditorUserId`      INTEGER NULL,
        `LastEditDate`  DATETIME        NULL,
        `CommunityOwnedDate`    DATETIME        NULL,
        `ParentId`      INTEGER NULL,
        `ClosedDate`    DATETIME        NULL,
        `OwnerDisplayName`      TEXT    NULL,
        `LastEditorDisplayName` TEXT    NULL,
        foreign key (`OwnerUserId`) references `users` (`Id`),
        foreign key (`LastEditorUserId`) references `users` (`Id`),
        foreign key (`ParentId`) references `posts` (`Id`)
);

## User Query:
Calculate the average view count of each post tagged as 'humor' and list the title and the comment of each post.
tagged as  'humor' refers to tag = '<humor>'; comment of the post refers to Text; average view count = AVG(ViewCount)

## Result:
Query Dimensions: [AVG(ViewCount), Title, Text]
Filter Conditions: [Tags = '<humor>']
Aggregation Functions: [AVG]
Grouping Requirements: [Title, Text]


# Example 3:

## Database Schema:
CREATE TABLE `customers` 
(
        `CustomerID`    INTEGER NOT NULL        PRIMARY KEY,
        `Segment`       TEXT    NULL,
        `Currency`      TEXT    NULL
);

INSERT INTO `customers` VALUES (3, 'SME', 'EUR');
INSERT INTO `customers` VALUES (5, 'LAM', 'EUR');
INSERT INTO `customers` VALUES (6, 'SME', 'EUR');
INSERT INTO `customers` VALUES (7, 'LAM', 'EUR');
INSERT INTO `customers` VALUES (9, 'SME', 'EUR');

CREATE TABLE `yearmonth` 
(
        `CustomerID`    INTEGER NOT NULL        PRIMARY KEY,
        `Date`  TEXT    NOT NULL        PRIMARY KEY,
        `Consumption`   REAL    NULL,
        foreign key (`CustomerID`) references `customers` (`None`)
);

INSERT INTO `yearmonth` VALUES (5, '201207', 528.3);
INSERT INTO `yearmonth` VALUES (5, '201302', 1598.28);
INSERT INTO `yearmonth` VALUES (5, '201303', 1931.36);
INSERT INTO `yearmonth` VALUES (5, '201304', 1497.14);
INSERT INTO `yearmonth` VALUES (6, '201203', 51.06);

## User Query:
What is the difference in the annual average consumption of the customers with the least amount of consumption paid in CZK for 2013 between SME and LAM, LAM and KAM, and KAM and SME?
annual average consumption of customer with the lowest consumption in each segment = total consumption per year / the number of customer with lowest consumption in each segment; Difference in annual average = SME's annual average - LAM's annual average; Difference in annual average = LAM's annual average - KAM's annual average; Year 2013 can be presented as Between 201301 And 201312; The first 4 strings of the Date values in the yearmonth table can represent year.

## Result:
Query Dimensions: [CAST(SUM(IIF(customers.Segment = 'SME', yearmonth.Consumption, 0)) AS REAL) / COUNT(customers.CustomerID) - CAST(SUM(IIF(customers.Segment = 'LAM', yearmonth.Consumption, 0)) AS REAL) / COUNT(customers.CustomerID), CAST(SUM(IIF(customers.Segment = 'LAM', yearmonth.Consumption, 0)) AS REAL) / COUNT(customers.CustomerID) - CAST(SUM(IIF(customers.Segment = 'KAM', yearmonth.Consumption, 0)) AS REAL) / COUNT(customers.CustomerID) , CAST(SUM(IIF(customers.Segment = 'KAM', yearmonth.Consumption, 0)) AS REAL) / COUNT(customers.CustomerID) - CAST(SUM(IIF(customers.Segment = 'SME', yearmonth.Consumption, 0)) AS REAL) / COUNT(customers.CustomerID)]
Filter Conditions: [Currency = 'CZK', Consumption = ( SELECT MIN(Consumption) FROM yearmonth ), Date BETWEEN 201301 AND 201312]
Aggregation Functions: [SUM]
Grouping Requirements: [Title, Text]


Now, it's your turn:
"""

        answer_prompt = f"""
## Database Schema:
{schema}

## User Query: 
{question}
{evidence}

## Result:"""
        return base_prompt + answer_prompt
        # return base_prompt + few_shot_prompt + answer_prompt

if __name__ == "__main__":
    import utils
    args = utils.get_args()
    model = SketchRetriever(args)
    print(model.retrieve_prompt("[schema]", "[question]", "[evidence]"))