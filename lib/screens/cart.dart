import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../data/cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {

    double total = 0;

    for (var item in cart) {
      total += item.price;
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: Colors.green,

        title: const Text(
          "🛒 My Cart",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: cart.isEmpty
          ? const Center(
              child: Text(
                "Cart is Empty",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )

          : Column(
              children: [

                Expanded(
                  child: ListView.builder(
                    itemCount: cart.length,

                    itemBuilder:
                        (context, index) {

                      final item = cart[index];

                      return Card(
                        margin:
                            const EdgeInsets.all(
                                10),

                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius
                                  .circular(
                                      16),
                        ),

                        child: ListTile(

                          leading: CircleAvatar(
                            backgroundColor:
                                Colors.green
                                    .shade100,

                            child: const Icon(
                              Icons
                                  .shopping_bag,
                              color:
                                  Colors.green,
                            ),
                          ),

                          title: Text(
                            item.name,
                          ),

                          subtitle: Text(
                            "₹${item.price}",
                          ),

                          trailing: IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),

                            onPressed: () {
                              cart.removeAt(
                                  index);

                              (context as Element)
                                  .markNeedsBuild();
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // TOTAL SECTION
                Container(
                  padding:
                      const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius:
                        const BorderRadius.only(
                      topLeft:
                          Radius.circular(25),
                      topRight:
                          Radius.circular(25),
                    ),

                    boxShadow: [
                      BoxShadow(
                        color:
                            Colors.grey.shade300,
                        blurRadius: 10,
                      ),
                    ],
                  ),

                  child: Column(
                    children: [

                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,

                        children: [

                          const Text(
                            "Total Amount",

                            style: TextStyle(
                              fontSize: 22,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          Text(
                            "₹${total.toStringAsFixed(0)}",

                            style: const TextStyle(
                              fontSize: 24,
                              color: Colors.green,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 25),

                      const Text(
                        "📱 Scan QR to Pay",

                        style: TextStyle(
                          fontSize: 20,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 20),

                      QrImageView(
                        data:
                            "upi://pay?pa=smartcart@upi&pn=SmartShoppingCart&am=$total",

                        size: 220,
                      ),

                      const SizedBox(height: 20),

                      ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.green,

                          padding:
                              const EdgeInsets
                                  .symmetric(
                            horizontal: 40,
                            vertical: 14,
                          ),
                        ),

                        onPressed: () {
                          ScaffoldMessenger.of(
                                  context)
                              .showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Payment Successful",
                              ),
                            ),
                          );
                        },

                        child: const Text(
                          "Complete Payment",

                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}