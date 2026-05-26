import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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

  bool paymentDone = false;

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
            color: Colors.white,
          ),
        ),
      ),

      body: paymentDone

          // PAYMENT SUCCESS SCREEN
          ? Center(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,

                children: [

                  Lottie.asset(
                    'assets/animations/success.json',
                    height: 250,
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Payment Successful!",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Thank you for shopping",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            )

          : cart.isEmpty

              // EMPTY CART UI
              ? Center(
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center,

                    children: [

                      Lottie.asset(
                        'assets/animations/empty_cart.json',
                        height: 220,
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        "Your Cart is Empty",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "Your shopping buddy is sad 😢",
                        style: TextStyle(
                          fontSize: 18,
                          color:
                              Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                )

              // FULL CART UI
              : Column(
                  children: [

                    // HAPPY MASCOT
                    Container(
                      padding:
                          const EdgeInsets.only(
                              top: 10),

                      child: Column(
                        children: [

                          Lottie.asset(
                            'assets/animations/happy_cart.json',
                            height: 170,
                          ),

                          const Text(
                            "Awesome Deals Added!",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: ListView.builder(
                        itemCount: cart.length,

                        itemBuilder:
                            (context, index) {

                          final item = cart[index];

                          return Card(
                            margin:
                                const EdgeInsets
                                    .all(10),

                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius
                                      .circular(
                                          20),
                            ),

                            child: ListTile(

                              leading:
                                  CircleAvatar(
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
                                style:
                                    const TextStyle(
                                  fontWeight:
                                      FontWeight
                                          .bold,
                                ),
                              ),

                              subtitle: Text(
                                "₹${item.price}",
                              ),

                              trailing:
                                  IconButton(
                                icon:
                                    const Icon(
                                  Icons.delete,
                                  color:
                                      Colors.red,
                                ),

                                onPressed: () {

                                  if (cart
                                          .isNotEmpty &&
                                      index <
                                          cart
                                              .length) {

                                    setState(() {
                                      cart.removeAt(
                                          index);
                                    });
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
                      padding:
                          const EdgeInsets.all(20),

                      decoration:
                          const BoxDecoration(
                        color: Colors.white,

                        borderRadius:
                            BorderRadius.only(
                          topLeft:
                              Radius.circular(
                                  30),

                          topRight:
                              Radius.circular(
                                  30),
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
                                      FontWeight
                                          .bold,
                                ),
                              ),

                              Text(
                                "₹${total.toStringAsFixed(0)}",

                                style:
                                    const TextStyle(
                                  fontSize: 28,
                                  color:
                                      Colors.green,
                                  fontWeight:
                                      FontWeight
                                          .bold,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(
                              height: 20),

                          const Text(
                            "📱 Scan QR to Pay",

                            style: TextStyle(
                              fontSize: 20,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          const SizedBox(
                              height: 20),

                          QrImageView(
                            data:
                                "upi://pay?pa=smartcart@upi&pn=SmartShoppingCart&am=$total",

                            size: 220,
                          ),

                          const SizedBox(
                              height: 20),

                          SizedBox(
                            width:
                                double.infinity,
                            height: 55,

                            child:
                                ElevatedButton(

                              style:
                                  ElevatedButton
                                      .styleFrom(
                                backgroundColor:
                                    Colors.green,

                                shape:
                                    RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius
                                          .circular(
                                              16),
                                ),
                              ),

                              onPressed: () {

                                setState(() {
                                  paymentDone =
                                      true;
                                });
                              },

                              child: const Text(
                                "Complete Payment",

                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight:
                                      FontWeight
                                          .bold,
                                  color:
                                      Colors.white,
                                ),
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