
from flask import Flask, request, jsonify
import pickle
import numpy as np

# Za³aduj wytrenowany model
with open('perceptron_model.pkl', 'rb') as file:
    model = pickle.load(file)

app = Flask(__name__)

@app.route('/predict', methods=['POST'])
def predict():
    data = request.json
    prediction = model.predict(np.array([data['features']]))
    return jsonify({'prediction': prediction.tolist()})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
