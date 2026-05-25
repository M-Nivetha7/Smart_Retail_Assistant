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
      appBar: AppBar(title: Text("Smart Search")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search products...",
                border: OutlineInputBorder(),
              ),
              onChanged: (v) => setState(() => query = v),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (_, i) {
                final item = filtered[i];
                return Card(
                  child: ListTile(
                    title: Text(item.name),
                    subtitle: Text("Aisle: ${item.aisle}"),
                    trailing: ElevatedButton(
                      child: Text("Add"),
                      onPressed: () {
                        cart.add(item);
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