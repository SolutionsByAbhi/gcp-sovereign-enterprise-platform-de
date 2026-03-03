def suggest_fix(root_cause):
    fixes = {
        "OOMKilled": "Increase memory limits or optimize memory usage.",
        "CrashLoopBackOff": "Check container entrypoint and health probes."
    }
    return fixes.get(root_cause, "Manual investigation required.")
