from flask import Flask, request, jsonify
import numpy as np
import onnxruntime as ort
from flask_cors import CORS
from PIL import Image
import io

app = Flask(__name__)
CORS(app)  # Allow Flutter to communicate with Flask

# Load ONNX model
session = ort.InferenceSession(r"C:\Users\admin\Downloads\models\action.h5")

# Define label mappings
LABELS = ["hello", "see you later", "thanks"]

@app.route("/predict", methods=["POST"])
def predict():
    try:
        # Read the frame from Flutter request
        file = request.files["frame"]
        img = Image.open(io.BytesIO(file.read())).convert("RGB")

        # Preprocess the frame
        img = img.resize((224, 224))
        img_array = np.array(img).astype(np.float32) / 255.0  # Normalize
        img_array = np.expand_dims(img_array, axis=0).transpose(0, 3, 1, 2)  # ONNX format

        # Predict the sign
        inputs = {session.get_inputs()[0].name: img_array}
        predictions = session.run(None, inputs)[0]
        predicted_class = np.argmax(predictions, axis=1)[0]
        predicted_sign = LABELS[predicted_class]

        return jsonify({"predicted_sign": predicted_sign})

    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
