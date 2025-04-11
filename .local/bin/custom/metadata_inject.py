from datetime import date
import uuid
from dataclasses import dataclass, field



@dataclass
class Metadata:
    author: str = field(default='')
    description: str = field(default='')
    date: str = field(default=f'{date.today()}')
    uuid: str = field(default=f'{uuid.uuid4()}')


if __name__ == "__main__":
    meta = Metadata()

    meta_data = f"""---
author: {meta.author}
description: {meta.description}
uuid: {meta.uuid}
date: {meta.date}
---
"""
    print(meta_data)

