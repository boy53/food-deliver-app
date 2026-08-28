import 'package:flutter/material.dart';

void main() {
  runApp(const CustomerApp());
}

class CustomerApp extends StatelessWidget {
  const CustomerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Customer App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        useMaterial3: true,
      ),
      home: const CustomerHomePage(),
    );
  }
}

class CustomerHomePage extends StatelessWidget {
  const CustomerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Food Delivery Customer App')),
      body: const Center(
        child: Text('Welcome to Customer App'),
      ),
    );
  }
}
