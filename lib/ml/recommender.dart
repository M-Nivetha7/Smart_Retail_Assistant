import '../models/product.dart';

class Recommender {

  // Simple ML-style association rules (market basket analysis idea)
  static Map<String, List<String>> rules = {
    "Milk": ["Bread", "Butter"],
    "Bread": ["Butter", "Jam"],
    "Rice": ["Sugar"],
  };

  static List<String> recommend(List<Product> cart) {
    List<String> recommendations = [];

    for (var item in cart) {
      if (rules.containsKey(item.name)) {
        recommendations.addAll(rules[item.name]!);
      }
    }

    return recommendations.toSet().toList();
  }
}