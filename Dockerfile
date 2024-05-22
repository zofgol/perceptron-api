
# U¿yj obrazu bazowego z Pythona
FROM python:3.8-slim

# Ustaw katalog roboczy
WORKDIR /app

# Skopiuj pliki do obrazu
COPY perceptron_model.pkl .
COPY app.py .

# Zainstaluj wymagane pakiety
RUN pip install Flask scikit-learn gunicorn

# Uruchom aplikacjê za pomoc¹ Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
