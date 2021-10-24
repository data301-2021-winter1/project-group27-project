import pandas as pd
import numpy as np
def load_and_process(url1, url2):
    rec1data = (   
        pd.read_csv("../data/processed/rec1data.csv")
        .drop(labels = ["Unnamed: 0", "rid"], axis = 1)
    )

    rec1data = (
        pd.DataFrame(rec1data)
        .assign(crime_num = (rec1data.iloc[:,12:25] != 0).sum(axis=1))
        .loc[lambda x: x['crime_num']>0]
    )
    
    psych_data = (
        pd.read_csv("../data/processed/psychdata.csv")
        .loc[:,["id", "diagnosis", "service", "reason_term", "date_contact", "date_term"]]
    )

    psych_data = (
        pd.DataFrame(psych_data)
        .assign(contact = psych_data["date_contact"] + 19000000)
        .assign(term = psych_data["date_term"] + 19000000)
    )

    psych_data = (
        pd.DataFrame(psych_data)
        .assign(contact = pd.to_datetime(psych_data["contact"], format='%Y%m%d', errors = "coerce"))
        .assign(term = pd.to_datetime(psych_data["term"], format='%Y%m%d', errors = "coerce"))
        .loc[:,["id", "diagnosis", "service", "reason_term", "contact", "term"]]
    )
    
    psych_data = (
        pd.DataFrame(psych_data)
        .assign(length = (psych_data["term"] - psych_data["contact"]).dt.days)
    )
    
    merged_data = (rec1data.merge(psych_data, on = "id", how = "outer"))
            
    data = pd.DataFrame(merged_data[merged_data["length"] >= 0])
    

    
    return data