from vertexai.preview.language_models import TextGenerationModel

def analyze_logs(log_text):
    model = TextGenerationModel.from_pretrained("text-bison@001")

    prompt = f"""
    Analyze the following logs and provide:
    - Root cause
    - Severity
    - Suggested remediation
    Logs:
    {log_text}
    """

    response = model.predict(prompt, temperature=0.2)
    return response.text
