import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# object creation
s = pd.Series([1,3,5,np.nan,6,8]) # series, what is series? 
# create dataframe
dates = pd.date_range('20130101', periods=6)
df = pd.DataFrame(np.random.randn(6,4), index=dates, columns=list('ABCD'))

