// ignore: file_names
import 'package:flutter/material.dart';
import 'package:nexkart1/screens/cart.dart';
import 'package:nexkart1/screens/categories1.dart';
import 'package:nexkart1/screens/homepage.dart';
import 'package:nexkart1/screens/myorders.dart';
import 'package:nexkart1/screens/profile.dart';
import 'package:nexkart1/screens/wishlist.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: bueaty());
  }
}

// ignore: camel_case_types
class bueaty extends StatelessWidget {
  bueaty({super.key});

  final List<Map<String, dynamic>> exploreMore = [
    {
      'image': 'assets/images/orange.png',
      'brand': 'JACKBELLA',
      'title': 'Men Self Design Shirt',
      'discount': '↓78%',
      'oldPrice': '1599',
      'newPrice': '339',
      'delivery': 'Delivery by Wednesday',
      'buttonText': 'Buy now',
    },
    {
      'image': 'assets/images/orange.png',
      'brand': 'VeBNoR',
      'title': 'Solid Casual Shirt',
      'discount': '↓70%',
      'oldPrice': '999',
      'newPrice': '299',
      'delivery': 'Delivery by Monday',
      'buttonText': 'Buy now',
    },
    {
      'image': 'assets/images/orange.png',
      'brand': 'Highlander',
      'title': 'Men Casual Wear',
      'discount': '↓65%',
      'oldPrice': '899',
      'newPrice': '319',
      'delivery': 'Delivery by Tuesday',
      'buttonText': 'Buy now',
    },
    {
      'image': 'assets/images/orange.png',
      'brand': 'Dennis Lingo',
      'title': 'Stylish Cotton Shirt',
      'discount': '↓72%',
      'oldPrice': '1499',
      'newPrice': '419',
      'delivery': 'Delivery by Thursday',
      'buttonText': 'Buy now',
    },
    {
      'image': 'assets/images/orange.png',
      'brand': 'JACKBELLA',
      'title': 'Men Self Design Shirt',
      'discount': '↓78%',
      'oldPrice': '1599',
      'newPrice': '339',
      'delivery': 'Delivery by Wednesday',
      'buttonText': 'Buy now',
    },
    {
      'image': 'assets/images/orange.png',
      'brand': 'VeBNoR',
      'title': 'Solid Casual Shirt',
      'discount': '↓70%',
      'oldPrice': '999',
      'newPrice': '299',
      'delivery': 'Delivery by Monday',
      'buttonText': 'Buy now',
    },
    {
      'image': 'assets/images/orange.png',
      'brand': 'Highlander',
      'title': 'Men Casual Wear',
      'discount': '↓65%',
      'oldPrice': '899',
      'newPrice': '319',
      'delivery': 'Delivery by Tuesday',
      'buttonText': 'Buy now',
    },
    {
      'image': 'assets/images/orange.png',
      'brand': 'Dennis Lingo',
      'title': 'Stylish Cotton Shirt',
      'discount': '↓72%',
      'oldPrice': '1499',
      'newPrice': '419',
      'delivery': 'Delivery by Thursday',
      'buttonText': 'Buy now',
    },
    // ... Add more as needed
  ];

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF9B87F5), Color(0xFF5A4F8F)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: Container(
            height: 40,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart_outlined, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Cart()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.favorite_border, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Wishlist()),
                );
              },
            ),
            SizedBox(width: 8),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(),
              const ListTile(
                title: Text(
                  "Bueaty Products",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 350,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:
                        exploreMore.map((item) {
                          return Container(
                            width: 160,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      item['image'] ?? '',
                                      height: 180,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item['brand'] ?? '',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                          ),
                                        ),
                                        Text(
                                          item['title'] ?? '',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            Text(
                                              item['discount'] ?? '',
                                              style: const TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                              ),
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              "₹${item['oldPrice'] ?? ''}",
                                              style: const TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                color: Colors.grey,
                                                fontSize: 11,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          "₹${item['newPrice'] ?? ''}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        SizedBox(
                                          width: double.infinity,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    vertical: 6,
                                                  ),
                                              backgroundColor:
                                                  (item['buttonText'] ==
                                                          'Buy now')
                                                      ? Colors.yellow[700]
                                                      : Colors.grey[300],
                                            ),
                                            onPressed: () {},
                                            child: Text(
                                              item['buttonText'] ?? '',
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                ),
              ),
              const Divider(),
              const ListTile(
                title: Text(
                  "Explore More like This",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: exploreMore.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 400,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    final item = exploreMore[index];

                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: Image.asset(
                              item['image'] ?? '',
                              height: 220,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['brand'] ?? '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  item['title'] ?? '',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    Text(
                                      item['discount'] ?? '',
                                      style: const TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      "₹${item['oldPrice'] ?? ''}",
                                      style: const TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      "₹${item['newPrice'] ?? ''}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  item['delivery'] ?? '',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          (item['buttonText'] == 'Buy now')
                                              ? Colors.yellow[700]
                                              : Colors.grey[300],
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      item['buttonText'] ?? '',
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
