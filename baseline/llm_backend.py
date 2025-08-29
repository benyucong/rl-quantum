from openai import OpenAI
import os
import re

# Load system prompt once and reuse
with open("Prompt/system.txt", "r") as f:
    SYSTEM_PROMPT = f.read().strip()

import os
import httpx
from openai import OpenAI

'''
The code requires AALTO_OPENAI_API_KEY environment variable to be set

Tested with OpenAI v1.13.0 python library
'''

# Change the `path` variable to the endpoint listed at https://www.aalto.fi/en/services/aalto-ai-apis
aalto_openai_endpoint_url = "/v1/openai/deployments/gpt-4o-mini-2024-07-18"

assert (
    "AALTO_OPENAI_API_KEY" in os.environ and os.environ.get("AALTO_OPENAI_API_KEY") != ""
), "you must set the `AALTO_OPENAI_API_KEY` environment variable."

'''
Rewrite the base path with Aalto mappings
For all endpoints see https://www.aalto.fi/en/services/azure-openai#6-available-api-s
'''
def update_base_url(request: httpx.Request) -> None:
    if request.url.path == "/chat/completions":
        new_path = f"{aalto_openai_endpoint_url}/chat/completions"
        request.url = request.url.copy_with(path=new_path)
    else:
        request.url.path = f"{aalto_openai_endpoint_url}"

def call_gpt_self_debug(message, model: str = "gpt-4o", temperature: float = 0.0):
    client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))
    response = client.chat.completions.create(
        model=model,
        messages=message,
        temperature=temperature
    )
    return response.choices[0].message.content


def call_deepseek_self_debug(message):
    client = OpenAI(api_key=os.getenv("DEEPSEEK_API_KEY"), base_url="https://api.deepseek.com")
    response = client.chat.completions.create(
    model="deepseek-chat",
    temperature=0.0,
    messages=message,
    stream=False
    )

    return response.choices[0].message.content

def call_llm_self_debug(message, model: str = "deepseek") -> str:
    if model == "gpt":
        response = call_gpt_self_debug(message)
    elif model == "deepseek":
        response = call_deepseek_self_debug(message)
        
    return response

def call_gpt(prompt: str, model: str = "gpt-4o", temperature: float = 0.0):
    client = OpenAI(
        base_url="https://aalto-openai-apigw.azure-api.net",
        api_key=False, # API key not used, and rather set below
        default_headers = {
            "Ocp-Apim-Subscription-Key": os.environ.get("AALTO_OPENAI_API_KEY"),
        },
        http_client=httpx.Client(
            event_hooks={ "request": [update_base_url] }
        ),
    )
    
    print("Calling GPT model...")
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


def call_llm(prompt: str, model: str = "gpt") -> str:
    if model == "gpt":
        response = call_gpt(prompt)
    elif model == "deepseek":
        response = call_deepseek(prompt)
        
    return response