import matplotlib.pyplot as plt
import pandas as pd

dataset = pd.read_csv("testdata.csv")
dataset.plot("Count", ["LeftSpeedSetPoint", "LeftSpeed", "RightSpeedSetPoint", "RightSpeed"], subplots=False)
plt.show()
    
