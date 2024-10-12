from typing import Dict, List
from transformers import AutoTokenizer, AutoModelForCausalLM

from .LanguageModel import LanguageModel

class LocalLanguageModel(LanguageModel):
    def __init__(self, model_name, **kwargs) -> None:
        super().__init__(**kwargs)
        
        self.max_new_tokens = kwargs.pop("max_new_tokens", 512)
        self.temperature = kwargs.pop("temperature", 0.0)

        self.tokenizer = AutoTokenizer.from_pretrained(
            model_name,
            trust_remote_code=True,
        )
        self.model = AutoModelForCausalLM.from_pretrained(
            model_name,
            torch_dtype="auto",
            device_map="auto",
            trust_remote_code=True,
        ).eval()

    def chat(self, messages: List[Dict[str, str]]) -> str:
        text = self.tokenizer.apply_chat_template(
            messages,
            tokenize=False,
            add_generation_prompt=True
        )

        model_inputs = self.tokenizer(
            [text], 
            return_tensors="pt",
            return_attention_mask=True
        ).to('cuda')

        generated_ids = self.model.generate(
            **model_inputs,
            max_new_tokens=self.max_new_tokens,
            pad_token_id=self.tokenizer.eos_token_id,
            temperature=self.temperature
        )
        generated_ids = [
            output_ids[len(input_ids):] for input_ids, output_ids in zip(model_inputs.input_ids, generated_ids)
        ]

        response = self.tokenizer.batch_decode(generated_ids, skip_special_tokens=True)[0]
        return response

    def chat_batch(self, messages_batch: List[List[Dict[str, str]]]) -> List[str]:
        texts = self.tokenizer.apply_chat_template(
            messages_batch,
            tokenize=False,
            add_generation_prompt=True,
        )

        model_inputs_batch = self.tokenizer(
            texts, 
            return_tensors="pt", 
            padding=True
        ).to('cuda')

        generated_ids_batch = self.model.generate(
            **model_inputs_batch,
            max_new_tokens=self.max_new_tokens,
            pad_token_id=self.tokenizer.eos_token_id,
            temperature=self.temperature
        )
        generated_ids_batch = generated_ids_batch[:, model_inputs_batch.input_ids.shape[1]:]
        
        response_batch = self.tokenizer.batch_decode(generated_ids_batch, skip_special_tokens=True)
        return response_batch