import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../data/cart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() =>
      _CartScreenState();
}

class _CartScreenState
    extends State<CartScreen> {

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
        elevation: 0,

        title: const Text(
          "🛒 My Cart",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),

      body: cart.isEmpty

          // EMPTY CART UI
          ? Center(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,

                children: [

                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 100,
                    color: Colors.grey.shade400,
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Your Cart is Empty",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Add products to continue shopping",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            )

          // CART ITEMS UI
          : Column(
              children: [

                Expanded(
                  child: ListView.builder(
                    padding:
                        const EdgeInsets.all(12),

                    itemCount: cart.length,

                    itemBuilder:
                        (context, index) {

                      final item = cart[index];

                      return Container(
                        margin:
                            const EdgeInsets.only(
                          bottom: 14,
                        ),

                        decoration: BoxDecoration(
                          color: Colors.white,

                          borderRadius:
                              BorderRadius.circular(
                                  20),

                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.grey.shade300,
                              blurRadius: 8,
                              offset:
                                  const Offset(0, 4),
                            ),
                          ],
                        ),

                        child: ListTile(

                          contentPadding:
                              const EdgeInsets.all(
                                  14),

                          leading: CircleAvatar(
                            radius: 28,
                            backgroundColor:
                                Colors.green.shade100,

                            child: const Icon(
                              Icons.shopping_bag,
                              color: Colors.green,
                              size: 28,
                            ),
                          ),

                          title: Text(
                            item.name,

                            style: const TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),

                          subtitle: Padding(
                            padding:
                                const EdgeInsets.only(
                                    top: 6),

                            child: Text(
                              "₹${item.price}",

                              style: TextStyle(
                                color: Colors.grey
                                    .shade700,

                                fontSize: 16,
                              ),
                            ),
                          ),

                          trailing: IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 28,
                            ),

                            onPressed: () {

                              if (cart.isNotEmpty &&
                                  index <
                                      cart.length) {

                                setState(() {
                                  cart.removeAt(index);
                                });

                                ScaffoldMessenger.of(
                                        context)
                                    .showSnackBar(
                                  SnackBar(
                                    backgroundColor:
                                        Colors.red,

                                    content: Text(
                                      "${item.name} removed",
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // PAYMENT SECTION
                Container(
                  width: double.infinity,

                  padding:
                      const EdgeInsets.all(22),

                  decoration: const BoxDecoration(
                    color: Colors.white,

                    borderRadius:
                        BorderRadius.only(
                      topLeft:
                          Radius.circular(30),
                      topRight:
                          Radius.circular(30),
                    ),
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
                              fontSize: 24,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          Text(
                            "₹${total.toStringAsFixed(0)}",

                            style: const TextStyle(
                              fontSize: 28,
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

                      Container(
                        padding:
                            const EdgeInsets.all(12),

                        decoration: BoxDecoration(
                          color: Colors.white,

                          borderRadius:
                              BorderRadius.circular(
                                  20),

                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.grey.shade300,
                              blurRadius: 8,
                            ),
                          ],
                        ),

                        child: QrImageView(
                          data:
                              "upi://pay?pa=smartcart@upi&pn=SmartShoppingCart&am=$total",

                          version:
                              QrVersions.auto,

                          size: 220,
                        ),
                      ),

                      const SizedBox(height: 25),

                      SizedBox(
                        width: double.infinity,
                        height: 55,

                        child: ElevatedButton(

                          style:
                              ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.green,

                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius
                                      .circular(
                                          18),
                            ),
                          ),

                          onPressed: () {

                            ScaffoldMessenger.of(
                                    context)
                                .showSnackBar(
                              const SnackBar(
                                backgroundColor:
                                    Colors.green,

                                content: Text(
                                  "Payment Successful",
                                ),
                              ),
                            );
                          },

                          child: const Text(
                            "Complete Payment",

                            style: TextStyle(
                              fontSize: 18,
                              fontWeight:
                                  FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}