import pandas as pd
import numpy as np
def load_and_process(ur1_or_path_to_csv):
    Data1 = (
        pd.read_csv('../data/processed/rec1data.csv')
        .drop(labels = ["Unnamed: 0","sex","birth", "race", "educ", "marital", "children", "occupat", "arrests", "jail","rid"], axis=1)
    )
    Data2 = (
        pd.read_csv('../data/processed/rec2data.csv')
        .drop(columns=['rid', 'pub_intox', 'pet_larc', 'misc', 'assault', 'arson', 'rape', 'forgery',
                       'consp', 'mvv', 'narc', 'viol_prob', 'viol_parole', 'gambling', 'grand_larc'])
        .rename(columns={"robbery": "crime15", "burglary": "crime16", "sex_off": "crime17", "crim_poss_weap": "crime18",
                         "crim_poss_instr": "crime19", "obst_gov": "crime20", "res_arrest": "crime21", "escape": "crime22", 
                         "crim_poss_stolen": "crime23", "reck_endanger": "crime24", "crim_neg_hom": "crime25", "youth_off": "crime26", 
                         "crim_tresspasss": "crime27"})
    )
    
    merge1 = pd.merge(Data1, Data2, on=["id"], how='inner')
    
    pdata = (
        pd.read_csv("../data/processed/psychdata.csv")
        .drop(labels=["Unnamed: 0","contact","date_contact", "facility", "address", "service", "date_term", "reason_term"], axis=1)
        .drop(pdata[pdata.diagnosis != '444'].index)
        .assign(crime_num = (pdata.iloc[:,1:28] != 0).sum(axis=1))
    )
    
    merge2 = pd.merge(merge1, pdata, how='right')

    return merge2