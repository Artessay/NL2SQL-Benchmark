import os, re


def remove_think_content(input_string):
    # using regular expression to remove <think>...</think>
    return re.sub(r'<think>.*?</think>', '', input_string, flags=re.DOTALL)


path = "output/bird/Base/DeepSeek/DeepSeek-R1-32B/VanillaLinker/dev_pred.sql"


# 读取文件内容
with open(path, 'r', encoding='utf-8') as f:
    original_content = f.read()

# 处理内容
modified_content = remove_think_content(original_content)

# 写回文件（建议先备份原始文件）
with open(path, 'w', encoding='utf-8') as f:
    f.write(modified_content)