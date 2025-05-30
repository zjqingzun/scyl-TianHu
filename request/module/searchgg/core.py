# request/module/search-gg/core.py
import json
import os
from googlesearch import search




def searchGoogle__(_query: str, _cache: str = "cache/hyperlink", _amout = 10):
    _results = list(search(_query, num=_amout, stop=_amout, pause=2))

    # Create cache directory if it doesn't exist
    os.makedirs(_cache, exist_ok=True)


    # Create a unique filename based on the query
    filename = _query.strip().replace(" ", "_") + ".json"
    filepath = os.path.join(_cache, filename)

    # Write results to a JSON file
    with open(filepath, "w", encoding="utf-8") as f:
        json.dump(_results, f, ensure_ascii=False, indent=2)

    print(f"[✔] Saved {len(_results)} URLs to {filepath}")
    return _results