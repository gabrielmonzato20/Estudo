# -*- coding: utf-8 -*-
"""
Created on Wed Jan  2 12:34:53 2019

@author: Desenvolvimento   01
"""
import numpy as np
import matplotlib.pyplot as mp
import pandas as pp
file = pp.read_csv("Data.csv")
idepe_cal =file.iloc[:,:-1].values
depe_val = file.iloc[: , -1].values

# missing data
from sklearn.preprocessing import Imputer
missing_data = Imputer(missing_values = 'NaN',strategy ='mean',axis =0)
missing_data =missing_data.fit(idepe_cal[:,1:3])
idepe_cal[:,1:3] = missing_data.transform(idepe_cal[:,1:3])
#encoding variaveis categorias sim nao pais letras
from sklearn.preprocessing import LabelEncoder,OneHotEncoder
labe =LabelEncoder()
idepe_cal[:,0] = labe.fit_transform(idepe_cal[:,0])
put_binary = OneHotEncoder(categorical_features = [0])
idepe_cal = put_binary.fit_transform(idepe_cal).toarray()
labe1 =LabelEncoder()
depe_val = labe1.fit_transform(depe_val)
#split data
from sklearn.model_selection import train_test_split
train,test,train2,test2=train_test_split(idepe_cal,depe_val,test_size=0.2,random_state=0)