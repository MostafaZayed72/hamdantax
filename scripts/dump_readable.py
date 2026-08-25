import json

with open("clean_extracted_site.json", "r", encoding="utf-8") as f:
    data = json.load(f)

with open("extracted_readable_content.txt", "w", encoding="utf-8") as out:
    for url, info in data.items():
        out.write(f"\n\n{'='*50}\nPAGE: {url}\n{'='*50}\n")
        out.write("--- TEXTS ---\n")
        for line in info["text"]:
            out.write(line + "\n")
        out.write("\n--- IMAGES ---\n")
        for img in info["images"]:
            out.write(img + "\n")

print("Wrote extracted_readable_content.txt")
