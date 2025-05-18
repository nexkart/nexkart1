import 'package:flutter/material.dart';
import 'package:nexkart2/screens/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NexKart',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: Productpage12(),
    );
  }
}
