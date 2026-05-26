import 'package:flutter/material.dart';
import '../models/product.dart';

class NavigationScreen extends StatelessWidget {
  final Product product;

  const NavigationScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Store Navigation",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // PRODUCT INFO
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [

                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.green.shade100,
                      child: const Icon(
                        Icons.shopping_bag,
                        color: Colors.green,
                        size: 30,
                      ),
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [

                          Text(
                            product.name,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 6),

                          Text(
                            "Category: ${product.category}",
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),

                          Text(
                            "Aisle: ${product.aisle}",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "🗺 Smart Store Map",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // STORE MAP
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 10,
                    ),
                  ],
                ),

                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
                  children: [

                    buildAisleRow(
                      "A1",
                      "A2",
                      "A3",
                    ),

                    buildAisleRow(
                      "B1",
                      "B2",
                      "B3",
                    ),

                    buildAisleRow(
                      "C1",
                      "C2",
                      "C3",
                    ),

                    buildAisleRow(
                      "D1",
                      "D2",
                      "D3",
                    ),

                    const SizedBox(height: 20),

                    // CUSTOMER PATH
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius:
                        BorderRadius.circular(20),
                      ),

                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: const [

                          Icon(
                            Icons.directions_walk,
                            color: Colors.green,
                          ),

                          SizedBox(width: 10),

                          Text(
                            "Follow highlighted aisle",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAisleRow(
      String aisle1,
      String aisle2,
      String aisle3,
      ) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceEvenly,
      children: [

        buildAisleBox(aisle1),

        buildAisleBox(aisle2),

        buildAisleBox(aisle3),
      ],
    );
  }

  Widget buildAisleBox(String aisle) {
    bool isTarget = aisle == product.aisle;

    return Container(
      width: 80,
      height: 80,

      decoration: BoxDecoration(
        color: isTarget
            ? Colors.green
            : Colors.grey.shade300,

        borderRadius: BorderRadius.circular(18),

        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 6,
          )
        ],
      ),

      child: Center(
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [

            Icon(
              isTarget
                  ? Icons.location_on
                  : Icons.store,
              color: isTarget
                  ? Colors.white
                  : Colors.black54,
            ),

            const SizedBox(height: 6),

            Text(
              aisle,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isTarget
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}