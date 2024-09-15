import spacy

custom_spacy_config = { 
    "gliner_model": "urchade/gliner_multi", # "numind/NuNerZero", 
    "style": "ent",
    "threshold": 0.5,
    "map_location": "cuda",
}

nlp = spacy.blank("en")
nlp.add_pipe("gliner_spacy", config=custom_spacy_config)

text = "This is a text about Bill Gates and Microsoft."
# text = "What is the highest eligible free rate for K-12 students in the schools in Alameda County?"
# text = "Please list the lowest three eligible free rates for students aged 5-17 in continuation schools."

doc = nlp(text)

for ent in doc.ents:
    print(ent.text, ent.label_, ent._.score)
