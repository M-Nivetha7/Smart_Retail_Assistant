import 'package:flutter/material.dart';
import '../data/products.dart';
import '../data/cart.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = "";

  @override
  Widget build(BuildContext context) {
    final filtered = products
        .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Search Products")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Search...",
                border: OutlineInputBorder(),
              ),
              onChanged: (v) => setState(() => query = v),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (context, i) {
                final p = filtered[i];
                return Card(
                  child: ListTile(
                    title: Text(p.name),
                    subtitle: Text("₹${p.price} | ${p.aisle}"),
                    trailing: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        cart.add(p);
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