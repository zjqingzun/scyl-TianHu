import sys
import os
import argparse

# Add the project root to sys.path
ROOTDIR = os.path.abspath(os.path.join(os.path.dirname(__file__), "../../"))
sys.path.insert(0, ROOTDIR)

from request.module.searchgg import core

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Google search and cache URLs")
    parser.add_argument("-a", "--amount", type=int, default=10, help="Number of URLs to retrieve (default: 10)")

    args = parser.parse_args()

    query = input("Ask Anything: ")
    urls = core.searchGoogle__(query, _amout=args.amount)

    print("\n[+] Search Results:")
    for url in urls:
        print(url)
