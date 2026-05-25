from itertools import combinations

# Sample dataset (replace with real supermarket dataset later)
transactions = [
    ["milk", "bread"],
    ["milk", "butter"],
    ["bread", "butter"],
    ["milk", "bread", "butter"],
    ["rice", "sugar"],
    ["rice", "dal"]
]

def get_recommendations(cart):
    recommendations = set()

    for transaction in transactions:
        if any(item in transaction for item in cart):
            for item in transaction:
                if item not in cart:
                    recommendations.add(item)

    return list(recommendations)