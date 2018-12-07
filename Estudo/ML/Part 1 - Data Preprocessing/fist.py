# -*- coding: utf-8 -*-
"""
Created on Mon Dec  3 09:28:19 2018

@author: Desenvolvimento   01
"""
import numpy as py
import matplotlib.pyplot as mpy
import pandas as pd
data = pd.read_csv("Data.csv")
yy=data.iloc[:, :-1].values
y=data.iloc[: , 3].values
from sklearn.preprocessing import Imputer
inputt = Imputer(missing_values = "NaN",strategy ="mean",axis=0)
inputt=inputt.fit(yy[:,1:3])
yy[:,1:3] = inputt.transform(yy[: ,1:3])