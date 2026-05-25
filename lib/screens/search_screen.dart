import 'package:flutter/material.dart';
import '../data/products.dart';
import '../data/cart_data.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String query = "";

  @override
  Widget build(BuildContext context) {
    var filtered = products
        .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text("Search Products")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search products...",
                border: OutlineInputBorder(),
              ),
              onChanged: (val) {
                setState(() {
                  query = val;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (context, i) {
                final product = filtered[i];

                return Card(
                  child: ListTile(
                    title: Text(product.name),
                    subtitle: Text("${product.aisle} - ₹${product.price}"),
                    trailing: ElevatedButton(
                      child: Text("Add"),
                      onPressed: () {
                        cart.add(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("${product.name} added")),
                        );
                        setState(() {});
                      },
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}