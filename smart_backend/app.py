from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route("/recommend", methods=["POST"])
def recommend():
    data = request.json
    cart = data["cart"]

    # simple mock ML logic
    recommendations = []
    if "milk" in cart:
        recommendations.append("bread")
    if "bread" in cart:
        recommendations.append("butter")

    return jsonify({"recommendations": recommendations})


@app.route("/route", methods=["POST"])
def route():
    return jsonify({"path": ["entrance", "A1", "A3", "checkout"]})


if __name__ == "__main__":
    app.run(debug=True)