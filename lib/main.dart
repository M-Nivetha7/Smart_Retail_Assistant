import 'package:flutter/material.dart';

import 'screens/search_screen.dart';
import 'screens/cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.green,
      ),

      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() =>
      _MainScreenState();
}

class _MainScreenState
    extends State<MainScreen> {

  int currentIndex = 0;

  final List<Widget> screens = [
    const SearchScreen(),
    const CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: screens[currentIndex],

      bottomNavigationBar:
          BottomNavigationBar(

        currentIndex: currentIndex,

        selectedItemColor: Colors.green,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
        ],
      ),
    );
  }
}