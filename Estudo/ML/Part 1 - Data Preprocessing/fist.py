<<<<<<< HEAD
# -*- coding: utf-8 -*-
"""
Created on Mon Dec  3 09:28:19 2018

@author: Desenvolvimento   01
"""
import numpy as py
import matplotlib.pyplot as mpy
import pandas as pd
data = pd.read_csv("Data.csv")
yy=data.iloc[:, :2].values
y=data.iloc[: , 3].values
#15
from sklearn.preprocessing import Imputer
inputt = Imputer(missing_values = "NaN",strategy ="mean",axis=0)
inputt=inputt.fit(yy[:,1:3])
yy[:,1:3] = inputt.transform(yy[: ,1:3])
#16
from sklearn.preprocessing import LabelEncoder,OneHotEncoder
label = LabelEncoder()
label.fit_transform(yy[:,0])
yy[:,0] = label.fit_transform(yy[:,0])
change = OneHotEncoder(categorical_features=[0])
yy = change.fit_transform(yy).toarray()
label_y = LabelEncoder()
y = label_y.fit_transform(y)
=======
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
>>>>>>> e8441a1131d3495fd3b78c46edb66da8fc15841a
