import time
import json
import openai
from tqdm import tqdm
from multiprocessing.dummy import Pool as ThreadPool
from langchain_openai import ChatOpenAI


MODEL_NAME = "gpt-3.5-turbo"
SPLIT = "dev"
EXPERIMENT = 'qpl_to_dq'
TRIES = 2
openai.api_key = 'API_KEY'
llm = ChatOpenAI(model_name=MODEL_NAME)


with open("db_schemas.json") as f:
    db_schemas = json.load(f)

with open(f"""../dataset_creation/output/{SPLIT}.json""") as f:
    data = json.load(f)


def get_prompt(example):
    return f"""QPL is a formalism to describe data retrieval operations over an SQL schema in a modular manner.
A QPL plan is a sequence of instructions for querying tabular data to answer a natural language question.
Forget everything you know about SQL, only use the following explanations.

A schema is specified as a list of <table> specification in the format:
<table>: <comma separated list of columns>

A plan contains a sequence of operations.
All operations return a stream of tuples.
All operations take as input either a physical table from the schema (for the Scan operation) or the output of other operations.

This is the formal specification for each operation:

<step> ::= 1...n

Scan ::= #<step> = Scan Table [ <tableName> ] <Predicate>? Output [ <fieldName>+ ]

// Binary operations
Join ::= Join ( #<InputStep1>, #<InputStep2> ) <Predicate> Output [ <qualifiedFieldName>+ ]
Intersect ::= Intersect  ( #<InputStep1>, #<InputStep2> ) <Predicate>? Output [ <qualifiedFieldName>+ ]
Except ::= Except ( #<InputStep1>, #<InputStep2> ) Output [ <qualifiedFieldName>+ ]
Union ::= Union ( #<InputStep1>, #<InputStep2> ) Output [ <qualifiedFieldName>+ ]

// Unary operations
Aggregate ::= Aggregate ( #<InputStep> ) <GroupBy>? Output [ <fieldName>+ | (<Agg> as <aliasName>)]
Filter ::= Filter ( #<InputStep> ) <Predicate> Output [ <fieldName>+ ]
TopSort ::= TopSort  ( #<InputStep> ) Rows [ <numRows> ] OrderBy [ <fieldName> ASC | DESC ] Output [ <fieldName>+ ]
Top ::= Top ( #<InputStep> ) Rows [ <numRows> ] Output [ <fieldName>+ ]
Sort ::= Sort  ( #<InputStep> ) OrderBy [ <fieldName> ASC | DESC ] (Distinct [ true ])? Output [ <fieldName>+ ]

// Predicate, Aggregate, Sort
Predicate ::= Predicate [ (Comparison AND | OR)+ ]
Comparison ::= ( countstar | <Agg> ) <ComparisonOp> ( countstar | <Agg> | Number | NULL )
Agg ::= ( AVG | COUNT | SUM | MIN | MAX ) ( <fieldName> )
ComparisonOp ::= <> | <= | >= | IS NOT | IS | LIKE | < | > | =
GroupBy ::= GroupBy [ <fieldName>+ ]


Let's think step by step to convert QPL plan to natural language plan given scheme, question, and QPL that describe the question.

In the natural language plan:
1. You must have exactly the same number of questions as there are steps in the QPL.
2. The questions you generate must follow exactly the same order as the steps in the QPL.


Example 1:

Schema:
Table Visitor (ID, Name, Age, Level_of_membership)
Table Museum (Museum_ID, Name, Open_Year, Num_of_staff)
Table Visit (Visitor_ID, Museum_ID, Total_Spent, Num_of_Ticket)

Question:
What is the total ticket expense of the visitors whose membership level is 1?

QPL Plan:
#1 = Scan Table [ visitor ] Predicate [ visitor.Level_of_membership = 1 ] Output [ ID ]
#2 = Scan Table [ visit ] Output [ visitor_ID , Total_spent ]
#3 = Join [ #1, #2 ] Predicate [ visitor.ID = visit.visitor_ID ] Output [ visit.Total_spent ]
#4 = Aggregate [ #3 ] Output [ SUM(visit.Total_spent) ]

Natural Language Plan:
#1 = Scan the table Visitor to find who are the visitors with membership level 1
#2 = Scan the table Visit to find what is the total spent by visitors during their visits
#3 = Join #1 and #2 to find what is the total spent by each visitor with membership level 1 during their visits
#4 = Group #3 by Visitor and aggregate the sum of total spent to find what is the total spent by all visitors with membership level 1 during their visit


Example 2:

Schema:
Table city (ID, Name, CountryCode, District, Population)
Table country (Code, Name, Continent, Region, SurfaceArea, IndepYear, Population, LifeExpectancy, GNP, GNPOld, LocalName, GovernmentForm, HeadOfState, Capital, Code2)
Table countrylanguage (CountryCode, Language, IsOfficial, Percentage)

Question:
What is name of the country that speaks the largest number of languages?

QPL Plan:
#1 = Scan Table [ country ] Output [ Code , Name ]
#2 = Scan Table [ countrylanguage ] Output [ CountryCode ]
#3 = Join [ #1, #2 ] Predicate [ #1.Code = #2.CountryCode ] Output [ #1.Name ]
#4 = Aggregate [ #3 ] GroupBy [ Name ] Output [ Name , countstar as count ]
#5 = TopSort [ #4 ] Rows [ 1 ] OrderBy [ count DESC ] Output [ Name , count ]

Natural Language Plan:
#1 = Scan the table country and retrieve the code, names of all countries.
#2 = Scan the table countrylanguage and retrieve all country codes.
#3 = Join #1 and #2 based on the matching code and retrieve the names of the countries.
#4 = Group #3 by name and aggregate the count per name to find the number of languages that speaks in each country.
#5 = Sort the records from #3 based on the count of the languages in descending order, select the first record, and identify the name of the country that speaks the largest number of languages and the its count of languages.


Example 3:

Schema:
Table museum (Museum_ID, Name, Num_of_Staff, Open_Year)
Table visitor (ID, Name, Level_of_membership, Age)
Table visit (Museum_ID, visitor_ID, Num_of_Ticket, Total_spent)

Question:
Find the number of visitors who did not visit any museum opened after 2010.


QPL Plan:
#1 = Scan Table [ visitor ] Output [ ID ]
#2 = Scan Table [ museum ] Predicate [ Open_Year > 2010 ] Output [ Museum_ID ]
#3 = Scan Table [ visit ] Output [ Museum_ID , visitor_ID ]
#4 = Join [ #2, #3 ] Predicate [ #2.Museum_ID = #3.Museum_ID ] Output [ #3.visitor_ID ]
#5 = Except [ #1, #4 ] Predicate [ #1.ID = #4.visitor_ID ] Output [ #1.ID ]
#6 = Aggregate [ #5 ] Output [ countstar as count ]

Natural Language Plan:
#1 = Scan the table Visitor to find who are the visitors
#2 = Scan the table Museum to find all the museums that opened after 2010
#3 = Scan the table Visit and retrieve the museum IDs and visitor IDs of all visits
#4 = Join #2 and #3 based on the matching museum ID and retrieve all the visitor IDs
#5 = return all the visitors IDs that from #1 that not in #4 to find all the visitors who did not visit any museum opened after 2010
#6 = Aggregate the number of all visitors in #5


Example 4:

Schema:
Table Ref_Feature_Types (feature_type_code, feature_type_name)
Table Ref_Property_Types (property_type_code, property_type_description)
Table Other_Available_Features (feature_id, feature_type_code, feature_name, feature_description)
Table Properties (property_id, property_type_code, date_on_market, date_sold, property_name, property_address, room_count, vendor_requested_price, buyer_offered_price, agreed_selling_price, apt_feature_1, apt_feature_2, apt_feature_3, fld_feature_1, fld_feature_2, fld_feature_3, hse_feature_1, hse_feature_2, hse_feature_3, oth_feature_1, oth_feature_2, oth_feature_3, shp_feature_1, shp_feature_2, shp_feature_3, other_property_details)
Table Other_Property_Features (property_id, feature_id, property_feature_description)

Question:
What are the names of properties that are either houses or apartments with more than 1 room?

QPL Plan:
#1 = Scan Table [ Properties ] Predicate [ property_type_code = 'House' ] Output [ property_name ]
#2 = Scan Table [ Properties ] Predicate [ room_count > 1 AND property_type_code = 'Apartment' ] Output [ property_name ]
#3 = Union [ #1, #2 ] Output [ #1.property_name ]
#4 = Sort [ #3 ] OrderBy [ property_name ASC ] Distinct [ true ] Output [ property_name ]

Natural Language Plan:
#1 = Scan the table Properties and retrieve the property name of all the properties with house code
#2 = Scan the table Properties and retrieve the property name of all the properties with more than 1 room and apartment code
#3 = Union #1 and #2 and retrieve all the property names
#4 = Sort the records from #3 based on the property name in ascending order and retrieve the property name without duplicates


Example 5:

Schema:
Table stadium (Stadium_ID, Location, Name, Capacity, Highest, Lowest, Average)
Table singer (Singer_ID, Name, Country, Song_Name, Song_release_year, Age, Is_male)
Table concert (concert_ID, concert_Name, Theme, Stadium_ID, Year)
Table singer_in_concert (concert_ID, Singer_ID)

Question:
What are the names and locations of the stadiums that had concerts that occurred in both 2014 and 2015?

QPL Plan:
#1 = Scan Table [ concert ] Predicate [ Year = 2014 ] Output [ Stadium_ID ]
#2 = Scan Table [ stadium ] Output [ Stadium_ID , Location , Name ]
#3 = Join [ #1, #2 ] Predicate [ #1.Stadium_ID = #2.Stadium_ID ] Output [ #2.Location , #2.Name ]
#4 = Scan Table [ concert ] Predicate [ Year = 2015 ] Output [ Stadium_ID ]
#5 = Scan Table [ stadium ] Output [ Stadium_ID , Location , Name ]
#6 = Join [ #4, #5 ] Predicate [ #4.Stadium_ID = #5.Stadium_ID ] Output [ #5.Location , #5.Name ]
#7 = Intersect [ #3, #6 ] Predicate [ #3.Name IS #6.Name AND #3.Location IS #6.Location ] Output [ #6.Location , #6.Name ]

Natural Language Plan:
#1 = Scan the table concert and retrieve the stadium IDs of all the concerts that occurred in 2014
#2 = Scan the table stadium and retrieve the stadium IDs, locations, names of all stadiums
#3 = Join #1 and #2 based on the matching Stadium IDs and retrieve the locations and names
#4 = Scan the table concert and retrieve the stadium IDs of all the concerts that occurred in 2015
#5 = Scan the table stadium and retrieve the stadium IDs, locations, names of all stadiums
#6 = Join #4 and #5 based on the matching Stadium IDs and retrieve the locations and names
#7 = Intersect #3 and #6 based on the matching names and locations and retrieve the locations and names


Example 6:

Schema:
Table city (ID, Name, CountryCode, District, Population)
Table sqlite_sequence (name, seq)
Table country (Code, Name, Continent, Region, SurfaceArea, IndepYear, Population, LifeExpectancy, GNP, GNPOld, LocalName, GovernmentForm, HeadOfState, Capital, Code2)
Table countrylanguage (CountryCode, Language, IsOfficial, Percentage)

Question:
How many type of governments are in Africa?

QPL Plan:
#1 = Scan Table [ country ] Output [ Continent , GovernmentForm ]
#2 = Filter [ #1 ] Predicate [ Continent = 'Africa' ] Output [ GovernmentForm ]
#3 = Aggregate [ #2 ] Output [ countstar as count ]

Natural Language Plan:
#1 = Scan table country and retrieve the continent and government form of all countries
#2 = Filter from #1 all the country with Africa continent and retrieve the government form
#3 = Aggregate the number of records of #2

Now your turn:

Schema:
{example['schema_str']}

Question:
{example['question']}

QPL Plan:
{example['qpl_str']}

Natural Language Plan:"""


def get_response(history_messages):
    res = llm.client.create(
        messages=history_messages, stream=False, model=MODEL_NAME
    )
    if "choices" in res:
        choice = res["choices"][0]
        if choice.get("finish_reason") == "stop":
            return str(choice["message"]['content'])


def gpt_predict_qd(i):
    example = data[i]
    try:
        with open(f"{EXPERIMENT}/{SPLIT}_{example['id']}.json", "r") as f:
            return
    except:
        pass

    db_id, qpl = example['qpl'].split(' | ')
    schema = db_schemas[db_id]
    schema_str = ""

    for table, columns in schema['tables'].items():
        schema_str += f"""Table {table} ({', '.join([c[0] for c in columns])})\n"""

    example['schema_str'] = schema_str
    example['qpl_str'] = '\n'.join(qpl.split(" ; "))


    history_messages = [{"role": "system", "content": "You are a helpful AI Data Engineer"}, {"role": "user", "content": get_prompt(example)}]
    response_message = get_response(history_messages)
    history_messages.append({"role": "assistant", "content": response_message})

    json_res = {
        'messages': history_messages.copy(),
        'id': example['id'],
        'question': example['question'],
        'qpl': example['qpl']
    }

    json_object = json.dumps(json_res, indent=4)

    with open(f"{EXPERIMENT}/{SPLIT}_{example['id']}.json", "w") as outfile:
        outfile.write(json_object)


flag = False

while not flag:
    try:
        with ThreadPool(4) as p:
            r = list(tqdm(p.imap(gpt_predict_qd, range(len(data))), total=len(data)))
        flag = True
    except:
        time.sleep(5)
        pass

data_with_qd = []

for example in data:
    with open(f"{EXPERIMENT}/{SPLIT}_{example['id']}.json", "r") as f:
        qd_json = json.load(f)
        qd = " ; ".join(qd_json["messages"][2]["content"].split("\n"))
        example["qd"] = qd
        data_with_qd.append(example)


with open(f"{SPLIT}.json", "w") as f:
    json.dump(data_with_qd, f, indent=4)



