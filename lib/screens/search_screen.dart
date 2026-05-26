import 'package:flutter/material.dart';

import '../data/cart.dart';
import '../data/products.dart';
import '../models/product.dart';
import 'navigation_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController =
      TextEditingController();

  String selectedCategory = "All";

  final List<String> categories = [
    "All",
    "Dairy",
    "Bakery",
    "Groceries",
    "Snacks",
    "Beverages",
    "Fruits",
    "Vegetables",
    "Frozen",
  ];

  List<Product> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    filteredProducts = products;
  }

  void filterProducts() {
    final query =
        searchController.text.toLowerCase();

    setState(() {
      filteredProducts = products.where((product) {
        final matchesSearch =
            product.name
                .toLowerCase()
                .contains(query);

        final matchesCategory =
            selectedCategory == "All" ||
                product.category ==
                    selectedCategory;

        return matchesSearch &&
            matchesCategory;
      }).toList();
    });
  }

  Widget buildCategoryChip(String category) {
    final bool isSelected =
        selectedCategory == category;

    return Padding(
      padding:
          const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(category),

        selected: isSelected,

        selectedColor: Colors.green,

        labelStyle: TextStyle(
          color: isSelected
              ? Colors.white
              : Colors.black,
          fontWeight: FontWeight.bold,
        ),

        onSelected: (_) {
          setState(() {
            selectedCategory = category;
          });

          filterProducts();
        },
      ),
    );
  }

  Widget buildProductCard(Product product) {
    return Card(
      elevation: 4,

      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),

      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(18),
      ),

      child: Padding(
        padding: const EdgeInsets.all(12),

        child: Row(
          children: [

            // PRODUCT ICON
            Container(
              padding:
                  const EdgeInsets.all(12),

              decoration: BoxDecoration(
                color: Colors.green.shade100,

                borderRadius:
                    BorderRadius.circular(
                        16),
              ),

              child: const Icon(
                Icons.shopping_bag,
                color: Colors.green,
                size: 32,
              ),
            ),

            const SizedBox(width: 14),

            // PRODUCT DETAILS
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .start,

                children: [

                  Text(
                    product.name,

                    style:
                        const TextStyle(
                      fontSize: 18,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                      height: 6),

                  Text(
                    "Category: ${product.category}",

                    style:
                        const TextStyle(
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(
                      height: 4),

                  Text(
                    "Aisle: ${product.aisle}",

                    style:
                        const TextStyle(
                      color: Colors.blue,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                      height: 4),

                  Text(
                    "₹${product.price}",

                    style:
                        const TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // BUTTONS
            SizedBox(
              width: 60,

              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment
                        .center,

                children: [

                  // ADD TO CART
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        cart.add(product);
                      });

                      ScaffoldMessenger
                              .of(context)
                          .showSnackBar(
                        SnackBar(
                          backgroundColor:
                              Colors.green,

                          behavior:
                              SnackBarBehavior
                                  .floating,

                          shape:
                              RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius
                                    .circular(
                                        12),
                          ),

                          content: Text(
                            "${product.name} added to cart",
                          ),
                        ),
                      );
                    },

                    child: Container(
                      padding:
                          const EdgeInsets
                              .all(8),

                      decoration:
                          BoxDecoration(
                        color: Colors
                            .green.shade100,

                        borderRadius:
                            BorderRadius
                                .circular(
                                    12),
                      ),

                      child: const Icon(
                        Icons
                            .add_shopping_cart,
                        color:
                            Colors.green,
                        size: 22,
                      ),
                    ),
                  ),

                  const SizedBox(
                      height: 12),

                  // NAVIGATION BUTTON
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (_) =>
                              NavigationScreen(
                            product:
                                product,
                          ),
                        ),
                      );
                    },

                    child: Container(
                      padding:
                          const EdgeInsets
                              .all(8),

                      decoration:
                          BoxDecoration(
                        color: Colors
                            .blue.shade100,

                        borderRadius:
                            BorderRadius
                                .circular(
                                    12),
                      ),

                      child: const Icon(
                        Icons.location_on,
                        color: Colors.blue,
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.grey.shade100,

      appBar: AppBar(
        elevation: 0,

        backgroundColor: Colors.green,

        centerTitle: true,

        title: const Text(
          "🛒 Smart Shopping Cart",

          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: [

          // SEARCH BAR
          Padding(
            padding:
                const EdgeInsets.all(14),

            child: TextField(
              controller:
                  searchController,

              onChanged: (value) {
                filterProducts();
              },

              decoration: InputDecoration(
                hintText:
                    "Search products...",

                prefixIcon:
                    const Icon(Icons.search),

                filled: true,

                fillColor: Colors.white,

                border:
                    OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(
                          18),

                  borderSide:
                      BorderSide.none,
                ),
              ),
            ),
          ),

          // CATEGORY TITLE
          const Padding(
            padding:
                EdgeInsets.symmetric(
              horizontal: 14,
            ),

            child: Align(
              alignment:
                  Alignment.centerLeft,

              child: Text(
                "Product Categories",

                style: TextStyle(
                  fontSize: 20,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // CATEGORY CHIPS
          SizedBox(
            height: 50,

            child: ListView(
              scrollDirection:
                  Axis.horizontal,

              padding:
                  const EdgeInsets.symmetric(
                horizontal: 12,
              ),

              children: categories
                  .map(
                    (category) =>
                        buildCategoryChip(
                            category),
                  )
                  .toList(),
            ),
          ),

          const SizedBox(height: 10),

          // PRODUCT COUNT
          Padding(
            padding:
                const EdgeInsets.symmetric(
              horizontal: 16,
            ),

            child: Align(
              alignment:
                  Alignment.centerLeft,

              child: Text(
                "${filteredProducts.length} products found",

                style: TextStyle(
                  color:
                      Colors.grey.shade700,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // PRODUCT LIST
          Expanded(
            child: filteredProducts
                    .isEmpty
                ? const Center(
                    child: Text(
                      "No products found",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount:
                        filteredProducts
                            .length,

                    itemBuilder:
                        (context, index) {
                      return buildProductCard(
                        filteredProducts[
                            index],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}