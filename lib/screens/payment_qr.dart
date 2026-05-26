import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PaymentQRScreen extends StatelessWidget {
  final double amount;

  const PaymentQRScreen({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    // UPI PAYMENT STRING (demo)
    final String upiLink =
        "upi://pay?pa=merchant@upi&pn=SmartCart&am=$amount&cu=INR";

    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Payment"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Scan to Pay",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          QrImageView(
            data: upiLink,
            version: QrVersions.auto,
            size: 250,
          ),

          const SizedBox(height: 20),

          Text(
            "Total Amount: ₹$amount",
            style: const TextStyle(fontSize: 20),
          ),

          const SizedBox(height: 30),

          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Payment Done"),
          )
        ],
      ),
    );
  }
}