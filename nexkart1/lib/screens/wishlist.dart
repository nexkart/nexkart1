import 'package:flutter/material.dart';
import 'package:nexkart1/screens/cart.dart';
import 'package:nexkart1/screens/categories1.dart';
import 'package:nexkart1/screens/homepage.dart';
import 'package:nexkart1/screens/myorders.dart';
import 'package:nexkart1/screens/profile.dart';

class Wishlist extends StatelessWidget {
  final List<Map<String, dynamic>> wishlistItems = [
    {
      'title': 'Acer Laptop 1',
      'image': 'assets/images/acer_laptop_1.png', // Acer Laptop image
      'oldPrice': 1200,
      'newPrice': 999,
      'rating': 4.5,
      'description':
          'A high-performance Acer laptop with the latest processor and 16GB RAM.',
    },
    {
      'title': 'Acer Laptop 2',
      'image': 'assets/images/acer_laptop_2.png', // Acer Laptop image
      'oldPrice': 1300,
      'newPrice': 1099,
      'rating': 4.6,
      'description':
          'Sleek and lightweight Acer laptop with 1TB SSD for fast performance.',
    },
    {
      'title': 'Adidas Football',
      'image': 'assets/images/Adidas_Football.png', // Adidas Football image
      'oldPrice': 40,
      'newPrice': 30,
      'rating': 4.7,
      'description':
          'Official Adidas football, perfect for both recreational and professional play.',
    },
    {
      'title': 'Tote Bag for Women',
      'image': 'assets/images/bag1.png', // Tote bag image
      'oldPrice': 240,
      'newPrice': 150,
      'rating': 4.4,
      'description': 'Stylish and spacious canvas tote bag for everyday use.',
    },
    {
      'title': 'Leather Bag for Women',
      'image': 'assets/images/bag2.png', // Leather bag image
      'oldPrice': 270,
      'newPrice': 140,
      'rating': 4.3,
      'description':
          'Premium leather bag designed for both fashion and functionality.',
    },
    {
      'title': 'Decorative Flower Pot',
      'image': 'assets/images/flowerpot.png', // Flower pot image
      'oldPrice': 220,
      'newPrice': 120,
      'rating': 4.9,
      'description':
          'Beautifully designed flower pot, perfect for adding a decorative touch to your home.',
    },
    {
      'title': 'Apple iPhone 12 Black',
      'image': 'assets/images/iphone_12_black.png', // iPhone 12 Black image
      'oldPrice': 999,
      'newPrice': 899,
      'rating': 4.8,
      'description':
          'Apple iPhone 12 with 5G capability, 128GB storage, and excellent camera quality.',
    },
    {
      'title': 'Nike Air Jordan Sneakers',
      'image':
          'assets/images/NikeAirJOrdonBlackRed.png', // Nike Air Jordan Black/Red Sneakers image
      'oldPrice': 150,
      'newPrice': 120,
      'rating': 4.7,
      'description':
          'Iconic Nike Air Jordan sneakers, known for their comfort and style.',
    },
    {
      'title': 'Men’s Stylish Watch',
      'image': 'assets/images/watch1.png', // Watch image
      'oldPrice': 240,
      'newPrice': 100,
      'rating': 4.2,
      'description':
          'A sleek titanium watch with a modern design, perfect for everyday wear.',
    },
    {
      'title': 'Leather Jacket for Men',
      'image': 'assets/images/leather_jacket_1.png', // Leather jacket image
      'oldPrice': 500,
      'newPrice': 350,
      'rating': 4.6,
      'description':
          'A premium leather jacket that combines style with durability.',
    },
    {
      'title': 'Baseball Bat',
      'image': 'assets/images/baseball_bat.png', // Baseball Bat image
      'oldPrice': 40,
      'newPrice': 30,
      'rating': 4.3,
      'description':
          'High-quality baseball bat for professional use or recreational play.',
    },
  ];

  Wishlist({super.key});

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
        elevation: 2,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF9B87F5), Color(0xFF5A4F8F)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text("My Wishlist", style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cart()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "All items • 6 items",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                itemCount: wishlistItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 330, // Increase box height
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  final item = wishlistItems[index];
                  return Card(
                    color: Colors.white,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              child: Image.asset(
                                item['image'],
                                height: 140,
                                width: double.maxFinite,

                                fit: BoxFit.cover,
                              ),
                            ),
                            const Positioned(
                              right: 8,
                              top: 8,
                              child: Icon(Icons.favorite, color: Colors.red),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            item['title'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Text(
                                "\$${item['oldPrice']}",
                                style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "\$${item['newPrice']}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 4,
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 14,
                                color: Colors.blue,
                              ),
                              const SizedBox(width: 4),
                              Text(item['rating'].toString()),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Added to cart"),
                                  ),
                                );
                              },
                              child: const Text(
                                "Add to Cart",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'ink',
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
