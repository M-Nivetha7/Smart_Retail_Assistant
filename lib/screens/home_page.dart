import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Smart Supermarket AI")),
      body: Center(
        child: Text(
          "AI-Powered Shopping System 🚀",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}