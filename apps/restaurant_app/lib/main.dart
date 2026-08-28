import 'package:flutter/material.dart';

void main() {
  runApp(const RestaurantApp());
}

class RestaurantApp extends StatelessWidget {
  const RestaurantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const RestaurantHomePage(),
    );
  }
}

class RestaurantHomePage extends StatelessWidget {
  const RestaurantHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Food Delivery Restaurant App')),
      body: const Center(
        child: Text('Welcome to Restaurant App'),
      ),
    );
  }
}
