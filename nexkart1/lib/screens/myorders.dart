import 'package:flutter/material.dart';
import 'package:nexkart1/screens/cart.dart';
import 'package:nexkart1/screens/categories1.dart';
import 'package:nexkart1/screens/homepage.dart';
import 'package:nexkart1/screens/profile.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Myorders()));
}

class Myorders extends StatelessWidget {
  final List<Map<String, dynamic>> orders = [
    {
      'image': 'assets/images/bag1.png',
      'status': 'Cancelled Today , Apr 17',
      'statusColor': Colors.red,
      'title': 'Tote Bag For women\'s qality ba..',
      'delivered': false,
    },
    {
      'image': 'assets/images/bag2.png',
      'status': 'Delivered on Dec 12, 2024',
      'statusColor': Colors.black,
      'title': 'Cross Body Bag For women\'s ..',
      'delivered': true,
    },
    {
      'image': 'assets/images/flowerpot.png',
      'status': 'Cancelled Today , Apr 17',
      'statusColor': Colors.red,
      'title': 'NAUTICA Analog Watch -For Men..',
      'delivered': false,
    },
    {
      'image': 'assets/images/watch1.png',
      'status': 'Cancelled Today , Apr 17',
      'statusColor': Colors.red,
      'title': 'Watch For Men',
      'delivered': false,
    },
    {
      'image': 'assets/images/watch1.png',
      'status': 'Cancelled Today , Apr 17',
      'statusColor': Colors.red,
      'title': 'Watch For Men',
      'delivered': false,
    },
    {
      'image': 'assets/images/bag1.png',
      'status': 'Cancelled Today , Apr 17',
      'statusColor': Colors.red,
      'title': 'Tote Bag For women\'s qality ba..',
      'delivered': false,
    },
    {
      'image': 'assets/images/bag2.png',
      'status': 'Delivered on Dec 12, 2024',
      'statusColor': Colors.black,
      'title': 'Cross Body Bag For women\'s ..',
      'delivered': true,
    },
    {
      'image': 'assets/images/flowerpot.png',
      'status': 'Cancelled Today , Apr 17',
      'statusColor': Colors.red,
      'title': 'NAUTICA Analog Watch -For Men..',
      'delivered': false,
    },
    {
      'image': 'assets/images/watch1.png',
      'status': 'Cancelled Today , Apr 17',
      'statusColor': Colors.red,
      'title': 'Watch For Men',
      'delivered': false,
    },
    {
      'image': 'assets/images/watch1.png',
      'status': 'Cancelled Today , Apr 17',
      'statusColor': Colors.red,
      'title': 'Watch For Men',
      'delivered': false,
    },
  ];

  Myorders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset(0, 1), // Shadow appears above the bar
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.black,
          currentIndex: 3,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                icon: Icon(Icons.home),
              ),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Categories1()),
                  );
                },
                icon: const Icon(Icons.grid_view),
              ),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add_box_outlined),
              ),
              label: 'Sell',
            ),

            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Myorders()),
                  );
                },
                icon: const Icon(Icons.receipt_long),
              ),
              label: 'My Orders',
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },
                icon: const Icon(Icons.person_outline_outlined),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // This will pop the current screen
          },
        ),
        title: Text('My Orders', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.black),
          ),

          SizedBox(width: 10),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cart()),
              );
            },
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.black),
          ),

          SizedBox(width: 10),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [const Color(0xFF9B87F5), const Color(0xFF5A4F8F)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by Product or Order ID',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            color: Colors.grey[300],
            width: double.infinity,
            padding: EdgeInsets.all(12),
            child: Text('Are you looking for these orders?'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return ListTile(
                  leading: Image.asset(order['image'], width: 60, height: 60),
                  title: Text(
                    order['status'],
                    style: TextStyle(
                      color: order['statusColor'],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(order['title']),
                      if (order['delivered'])
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5),
                            Row(
                              children: List.generate(5, (star) {
                                return Icon(Icons.star_border, size: 16);
                              }),
                            ),
                            Text(
                              "Rate this product now",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
