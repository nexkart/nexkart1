import 'package:flutter/material.dart';
import 'package:nexkart1/screens/categories1.dart';
import 'package:nexkart1/screens/homepage.dart';
import 'package:nexkart1/screens/myorders.dart';
import 'package:nexkart1/screens/profile.dart';

class Cart extends StatelessWidget {
  final List<CartItem> cartItems = [
    CartItem(
      image: 'assets/images/bag1.png',
      title: "Stylish Tote Bag for Women",
      oldPrice: 240,
      newPrice: 150,
      rating: 4.2,
    ),
    CartItem(
      image: 'assets/images/bag2.png',
      title: "Premium Leather Handbag",
      oldPrice: 260,
      newPrice: 170,
      rating: 4.5,
    ),
    CartItem(
      image: 'assets/images/flowerpot.png',
      title: "Decorative Flower Pot",
      oldPrice: 180,
      newPrice: 120,
      rating: 4.1,
    ),
    CartItem(
      image: 'assets/images/iphone_13_pro.png',
      title: "iPhone 13 Pro - 128GB",
      oldPrice: 89000,
      newPrice: 79999,
      rating: 4.8,
    ),
    CartItem(
      image: 'assets/images/NikeAirMax.png',
      title: "Nike Air Max Sneakers",
      oldPrice: 5400,
      newPrice: 4799,
      rating: 4.6,
    ),
    CartItem(
      image: 'assets/images/tshirt_red_collar.png',
      title: "Casual Kid's Shirt",
      oldPrice: 400,
      newPrice: 299,
      rating: 4.3,
    ),
  ];

  Cart({super.key});

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
          currentIndex: 0,
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF9B87F5), Color(0xFF5A4F8F)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Text('My Cart', style: TextStyle(color: Colors.black)),
        actions: [
          const Icon(Icons.search, color: Colors.black),
          const SizedBox(width: 10),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'My Products',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: 'L-Bold',
                color: Colors.deepPurple,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(item.image, height: 80, width: 80),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      ...List.generate(
                                        4,
                                        (_) => const Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                          size: 16,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.star_border,
                                        color: Colors.orange,
                                        size: 16,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(item.rating.toString()),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Text(
                                        '\$${item.oldPrice}',
                                        style: const TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        '\$${item.newPrice}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    'Order it Now and Get one Day Delivery',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(color: Colors.black),
                                ),
                                child: const Text(
                                  'Remove',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  side: const BorderSide(
                                    color: Colors.deepPurple,
                                  ),
                                  elevation: 0,
                                ),
                                icon: const Icon(
                                  Icons.flash_on,
                                  color: Colors.deepPurple,
                                ),
                                label: const Text(
                                  'Get it now',
                                  style: TextStyle(color: Colors.deepPurple),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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

class CartItem {
  final String image;
  final String title;
  final double rating;
  final double oldPrice;
  final double newPrice;

  CartItem({
    required this.image,
    required this.title,
    required this.oldPrice,
    required this.newPrice,
    required this.rating,
  });
}
