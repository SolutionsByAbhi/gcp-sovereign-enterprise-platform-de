import pandas as pd

def detect_spike(cost_data):
    mean = cost_data["cost"].mean()
    return cost_data[cost_data["cost"] > mean * 1.5]
