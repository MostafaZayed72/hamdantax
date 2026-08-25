import json
import re

with open("scraped_site.json", "r", encoding="utf-8") as f:
    site_data = json.load(f)

def clean_html(html_str):
    # remove scripts, styles
    html_str = re.sub(r'<script.*?</script>', '', html_str, flags=re.DOTALL)
    html_str = re.sub(r'<style.*?</style>', '', html_str, flags=re.DOTALL)
    # find images
    imgs = re.findall(r'<img[^>]+src=["\']([^"\']+)["\']', html_str)
    # text
    txt = re.sub(r'<[^>]+>', '\n', html_str)
    lines = [re.sub(r'\s+', ' ', l).strip() for l in txt.split('\n')]
    lines = [l for l in lines if l and len(l) > 1 and not l.startswith('{') and not l.startswith('var ') and not l.startswith('window.')]
    return {
        "text": lines,
        "images": list(set(imgs))
    }

structured = {}
for u, h in site_data.items():
    structured[u] = clean_html(h)

with open("clean_extracted_site.json", "w", encoding="utf-8") as f:
    json.dump(structured, f, ensure_ascii=False, indent=2)

print("Saved clean_extracted_site.json")
