import pandas as pd
import numpy as np
def load_and_process(url):
    
    Data1 = (
        pd.read_csv('../data/processed/rec1data.csv')
        .drop(labels = ["Unnamed: 0", "rid", "arrests", "jail"], axis=1)
    )
    
    Data1 = (
        pd.DataFrame(Data1)
        .assign(sentences = (Data1.iloc[:,8:21] != 0).sum(axis=1))
        .loc[lambda x: x['sentences']>0]
    )
    
    Data1 = (Data1.astype({"id": "object",