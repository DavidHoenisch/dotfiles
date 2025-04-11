import sys
import pandas as pd

if len(sys.argv) < 2:
    print("""
          Improper use of tool.


          python3 ./csv_to_markdown_table.py input_file.csv
          """)
    sys.exit(1)

def create_markdown_table():
    df = pd.read_csv(sys.argv[1])
    df = df.fillna('')
    markdown_table = df.to_markdown(index=False)

    return markdown_table

print(create_markdown_table())
