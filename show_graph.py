#! /usr/bin/env python
import matplotlib.pyplot as plt
import pandas as pd
import argparse
import os

def getLogs():
    result = os.system("bash logfinder.sh")
    if(result != 0):
        print("Failed to run logfinder! Check console output")
        exit(1)

def showGraph():
    dataset = pd.read_csv("testdata.csv")
    dataset.plot("Count", ["LeftSpeedSetPoint", "LeftSpeed", "RightSpeedSetPoint", "RightSpeed"], subplots=False, color=["red", "orange", "green", "blue"])
    plt.show()


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-g", "--no_graph", help="Don't show the graph", action="store_true")
    parser.add_argument("-c", "--use_cache", help="Don't collect data from the robot and use pre-existing data to view graph", action="store_true")
    args = parser.parse_args()

    if not args.use_cache:
        getLogs()

    if not args.no_graph:
        showGraph()