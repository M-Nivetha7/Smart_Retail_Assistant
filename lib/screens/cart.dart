import 'package:flutter/material.dart';
import '../data/cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  double get total => cart.fold(0, (sum, e) => sum + e.price);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cart")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, i) {
                final item = cart[i];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.aisle),
                  trailing: Text("₹${item.price}"),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Total: ₹$total",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}