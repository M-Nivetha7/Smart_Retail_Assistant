import 'package:flutter/material.dart';
import '../data/cart_data.dart';
import '../ml/recommender.dart';

class CartPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final recommendations = Recommender.recommend(cart);

    return Scaffold(
      appBar: AppBar(title: Text("Cart + AI Suggestions")),
      body: Column(
        children: [

          Expanded(
            child: ListView(
              children: cart
                  .map((e) => ListTile(title: Text(e.name)))
                  .toList(),
            ),
          ),

          Divider(),

          Text(
            "🔥 Recommended for you",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          ...recommendations.map((e) => ListTile(
            leading: Icon(Icons.recommend),
            title: Text(e),
          )),

        ],
      ),
    );
  }
}