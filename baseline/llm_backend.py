from openai import OpenAI
import os
import re

# Load system prompt once and reuse
with open("Prompt/system.txt", "r") as f:
    SYSTEM_PROMPT = f.read().strip()

def call_gpt(prompt: str, model: str = "gpt-4o", temperature: float = 0.0):
    client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))
    response = client.chat.completions.create(
        model=model,
        messages=[{"role": "system", "content": SYSTEM_PROMPT},
            {"role": "user", "content": prompt}],
        temperature=temperature
    )
    return response.choices[0].message.content


def call_deepseek(prompt: str):
    client = OpenAI(api_key=os.getenv("DEEPSEEK_API_KEY"), base_url="https://api.deepseek.com")
    response = client.chat.completions.create(
    model="deepseek-chat",
    temperature=0.0,
    messages=[
            {"role": "system", "content": SYSTEM_PROMPT},
            {"role": "user", "content": prompt},
        ],
        stream=False
    )

    return response.choices[0].message.content


def call_llm(prompt: str, model: str = "deepseek") -> str:
    if model == "gpt":
        response = call_gpt(prompt)
    elif model == "deepseek":
        response = call_deepseek(prompt)
        
    return response