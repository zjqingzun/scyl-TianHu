import os
import sys
import argparse

# Add the project root to sys.path
ROOTDIR = os.path.abspath(os.path.join(os.path.dirname(__file__), "../../"))
sys.path.insert(0, ROOTDIR)

from request.module.countrymap import core

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Plot a country map using Plotly Express")
    parser.add_argument("-t", "--title", type=str, default="Japan", help="Title of the plot")
    parser.add_argument("-c", "--color", type=str, default="value", help="Column name for color scale")
    parser.add_argument("-w", "--width", type=int, default=800, help="Width of the plot")
    parser.add_argument("-ht", "--height", type=int, default=600, help="Height of the plot")

    args = parser.parse_args()
    country = ""

    if input("Do you want to use the default country? (y/n): ").strip().lower() == 'n':
        country = input("Enter the country name (default is Japan): ").strip() or "Japan"
        args.title = country
    else:
        country = args.title

    # Example data
    data = {
        "country": [country],
        "value": [100]
    }

    fig = core.plotCountryMap(data, _title=args.title, _color=args.color, _width=args.width, _height=args.height)
    fig.show()  # Display the plot
