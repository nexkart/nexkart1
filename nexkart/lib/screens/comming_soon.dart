import 'package:flutter/material.dart';

class ComingSoonScreen extends StatelessWidget {
  final String category;
  const ComingSoonScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category)),
      body: Center(
        child: Text(
          '$category\nComing Soon',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
