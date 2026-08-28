import 'package:flutter/material.dart';

void main() {
  runApp(const RiderApp());
}

class RiderApp extends StatelessWidget {
  const RiderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rider App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: const RiderHomePage(),
    );
  }
}

class RiderHomePage extends StatelessWidget {
  const RiderHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Food Delivery Rider App')),
      body: const Center(
        child: Text('Welcome to Rider App'),
      ),
    );
  }
}
