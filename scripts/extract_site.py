import urllib.request
import re
import json

urls = [
    "https://hamdantax.com/",
    "https://hamdantax.com/about-us/",
    "https://hamdantax.com/services/",
    "https://hamdantax.com/blog/",
    "https://hamdantax.com/contact-us/"
]

headers = {'User-Agent': 'Mozilla/5.0'}

data = {}

for u in urls:
    try:
        req = urllib.request.Request(u, headers=headers)
        with urllib.request.urlopen(req, timeout=10) as resp:
            html_text = resp.read().decode('utf-8', errors='ignore')
            data[u] = html_text
            print(f"Fetched {u} length: {len(html_text)}")
    except Exception as e:
        print(f"Error fetching {u}: {e}")

with open("scraped_site.json", "w", encoding="utf-8") as f:
    json.dump(data, f, ensure_ascii=False, indent=2)
print("Saved to scraped_site.json")
