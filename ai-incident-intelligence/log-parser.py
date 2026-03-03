import json

def extract_errors(log_file):
    with open(log_file) as f:
        logs = json.load(f)

    return [entry for entry in logs if entry.get("severity") == "ERROR"]
