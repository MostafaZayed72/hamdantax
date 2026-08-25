import urllib.request
import json

blog_urls = [
    "https://hamdantax.com/how-to-build-your-personal-credit/",
    "https://hamdantax.com/this-is-a-subtitle-for-your-new-post/",
    "https://hamdantax.com/setting-up-your-business/",
    "https://hamdantax.com/what-to-do-with-dividends/"
]

headers = {'User-Agent': 'Mozilla/5.0'}
with open("scraped_site.json", "r", encoding="utf-8") as f:
    site_data = json.load(f)

for u in blog_urls:
    try:
        req = urllib.request.Request(u, headers=headers)
        with urllib.request.urlopen(req, timeout=10) as resp:
            html_text = resp.read().decode('utf-8', errors='ignore')
            site_data[u] = html_text
            print(f"Fetched blog {u} length: {len(html_text)}")
    except Exception as e:
        print(f"Error fetching {u}: {e}")

with open("scraped_site.json", "w", encoding="utf-8") as f:
    json.dump(site_data, f, ensure_ascii=False, indent=2)

print("Updated scraped_site.json with blog posts")
