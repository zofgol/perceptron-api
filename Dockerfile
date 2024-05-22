
FROM python:3.8-slim

WORKDIR /app

COPY perceptron_model.pkl .
COPY app.py .

RUN pip install Flask scikit-learn gunicorn

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
