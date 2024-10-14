import logging

logging.basicConfig(level=logging.INFO) 
logger = logging.getLogger(__name__)

if __name__ == '__main__':
    import os, sys
    sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

import language_model

class Base():
    def __init__(self, args, **kwargs):
        self.model = language_model.load_language_model(args.language_model, **kwargs)

    def __call__(self, schema:str, question:str, evidence:str = None) -> str:
        try:
            try:
                return self.inference(schema, question, evidence)
            except KeyboardInterrupt:
                raise
            except Exception as e:
                logger.error(e)
                return Base.inference(self, schema, question, evidence)
        except KeyboardInterrupt:
            raise
        except Exception as e:
            logger.error(e)
            return ";"

    def inference(self, schema:str, question:str, evidence:str = None) -> str:
        query = self.get_prompt(schema, question, evidence)
        response = self.model.generate(query)
        return self.fetch_code(response, code_type="sql", default=";")

    def get_prompt(self, schema:str, question:str, evidence:str = None) -> str:
        schema = "\n".join(schema) if isinstance(schema, list) else schema
        
        # base prompt for the question
        base_prompt = "The databse schema is as follows:\n" + schema + "\nWrite Sql for the following question: " + question
        
        # if extra knowledge is provided, add it to the prompt
        if evidence is not None:
            knowledge_prompt = "\n " + "Consider the extra knowledge, it is very useful to help you understand the question and the corresponding sql: " + evidence
        else:
            knowledge_prompt = ""
        
        base_ans_prompt = "\n" + "And lastly, only write sql with no comments." 

        return base_prompt + knowledge_prompt + base_ans_prompt

    def fetch_code(self, response: str, code_type: str, default: str = "") -> str:
        # fetch code block
        if "```" in response:
            code = response.split("```")[1]
        else:
            code = response

        # remove code type from the beginning of the code block
        length = len(code_type) + 1
        if f'{code_type}\n' in code[:length]:
            code = code[length:]

        # if code is empty, return default value
        if code == "":
            code = default

        return code
    
if __name__ == "__main__":
    import utils
    args = utils.get_args()
    model = Base(args)
    print(model("", "Hello", ""))