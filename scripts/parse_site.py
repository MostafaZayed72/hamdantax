import json
import re
from html.parser import HTMLParser

class ContentParser(HTMLParser):
    def __init__(self):
        super().__init__()
        self.texts = []
        self.in_script = False
        self.in_style = False

    def handle_starttag(self, tag, attrs):
        if tag in ['script', 'style', 'noscript']:
            self.in_script = True

    def handle_endtag(self, tag):
        if tag in ['script', 'style', 'noscript']:
            self.in_script = False

    def handle_data(self, data):
        if not self.in_script:
            txt = data.strip()
            if txt and len(txt) > 1:
                self.texts.append(txt)

with open("scraped_site.json", "r", encoding="utf-8") as f:
    site_data = json.load(f)

parsed_site = {}
for url, raw_html in site_data.items():
    p = ContentParser()
    p.feed(raw_html)
    # Find blog links or sub-links
    blog_links = list(set(re.findall(r'href=["\'](https?://hamdantax\.com/[^"\'#\?]+)["\']', raw_html)))
    
    # Find images
    images = list(set(re.findall(r'src=["\'](https?://[^"\'\s]+\.(?:png|jpg|jpeg|svg|webp))["\']', raw_html)))

    parsed_site[url] = {
        "texts": [t for t in p.texts if not t.startswith('var ') and not t.startswith('function ') and not t.startswith('{') and len(t) > 2],
        "links": blog_links,
        "images": images
    }

with open("site_summary.json", "w", encoding="utf-8") as f:
    json.dump(parsed_site, f, ensure_ascii=False, indent=2)

print("Saved site_summary.json")
