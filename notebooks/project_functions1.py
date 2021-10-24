import pandas as pd
import numpy as np
def load_and_process(url1, url2):
    df1 = (   
        pd.read_csv(url1)
        .assign(crime_num = (rec1data.iloc[:,12:25] != 0).sum(axis=1))
        .loc[lambda x: x['crime_num']>0]
        .drop(labels = ["Unnamed: 0", "rid"], axis = 1)
    )
    
    df2 = (
        pd.read_csv(url2)
        .assign(contact = psychdata["date_contact"] + 19000000)
        .assign(term = psychdata["date_term"] + 19000000)
        .loc[:,["id", "contact", "term", "diagnosis", "service", "reason_term"]]
    )
    
    return df1, df2