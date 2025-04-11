import os
import sys
import frontmatter
from datetime import date
import pandas as pd


CHANGE_TABLE = []


def get_todays_changes(path: str):
    """crawls dir tree and gets changes from current date"""
    for root, dirs, files in os.walk(path):
        for file in files:
            if os.path.splitext(file)[1] == ".md":
                try:
                    abs_path = os.path.join(root, file)
                    data = frontmatter.load(abs_path)
                    if not data.keys():
                        pass
                    else:
                        if data['date'] == date.today():
                            CHANGE_TABLE.append(list(data.values()))
                        else:
                            continue
                except Exception:
                    pass 
            else: 
                continue


if __name__=="__main__":
    
    get_todays_changes(sys.argv[1])
   
    KEYS = ['author', 'description', 'uuid', 'date']
    df = pd.DataFrame(CHANGE_TABLE, columns=KEYS)
    df.set_index('author')
    
    print(df.to_markdown())    
