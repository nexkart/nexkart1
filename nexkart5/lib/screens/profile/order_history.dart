// your_orders_screen.dart
import 'package:flutter/material.dart';
import 'package:nexkart5/data/orders_data.dart'; // update import path

class YourOrdersScreen extends StatelessWidget {
  const YourOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Orders')),
      body:
          orderList.isEmpty
              ? const Center(child: Text('No orders placed yet.'))
              : ListView.builder(
                itemCount: orderList.length,
                itemBuilder: (context, index) {
                  final order = orderList[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: ListTile(
                      leading: Image.asset(
                        order['image'],
                        width: 60,
                        height: 60,
                      ),
                      title: Text(order['name']),
                      subtitle: Text('₹${order['price']} - ${order['status']}'),
                      trailing: Text(order['date']),
                    ),
                  );
                },
              ),
    );
  }
}
