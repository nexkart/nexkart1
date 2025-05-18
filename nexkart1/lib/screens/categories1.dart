import 'package:flutter/material.dart';
import 'package:nexkart1/screens/cart.dart';
import 'package:nexkart1/screens/homepage.dart';
import 'package:nexkart1/screens/myorders.dart';
import 'package:nexkart1/screens/profile.dart';

class Categories1 extends StatefulWidget {
  const Categories1({super.key});

  @override
  State<Categories1> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<Categories1> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> tabs = [
    {'label': 'Popular', 'icon': 'assets/images/pricetag.png'},
    {'label': 'Electronics', 'icon': 'assets/images/iphone_13_pro.png'},
    {'label': 'Shoes', 'icon': 'assets/images/NikeAirMax.png'},
    {'label': 'Bags', 'icon': 'assets/images/bag2.png'},
    {'label': 'Men', 'icon': 'assets/images/tshirt_red_collar.png'},
    {'label': 'Women', 'icon': 'assets/images/girldress.png'},
    {'label': 'Kids', 'icon': 'assets/images/shirt1.png'},
    {'label': 'Kitchen', 'icon': 'assets/images/kitchen_counter.png'},
    {'label': 'Bedroom', 'icon': 'assets/images/bedroom_bed.png'},
  ];

  final List<Map<String, String>> popularItems = [
    {'icon': 'assets/images/iphone_13_pro.png', 'label': 'iPhone 13 Pro'},
    {'icon': 'assets/images/NikeAirMax.png', 'label': 'Nike Air Max'},
    {'icon': 'assets/images/bag2.png', 'label': 'Leather Bag'},
    {'icon': 'assets/images/tshirt_red_collar.png', 'label': 'Men T-Shirt'},
    {'icon': 'assets/images/girldress.png', 'label': 'Women Dress'},
    {'icon': 'assets/images/shirt1.png', 'label': 'Kids Shirt'},
    {'icon': 'assets/images/kitchen_counter.png', 'label': 'Kitchen Shelf'},
    {'icon': 'assets/images/tennis_racket.png', 'label': 'Sports'},
    {'icon': 'assets/images/Group.png', 'label': 'Accessories'},
    {'icon': 'assets/images/lotionbottle.png', 'label': 'Skincare Bottle'},
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
          currentIndex: 1,
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
      appBar: _buildAppBar(context),
      body: Row(
        children: [
          _buildLeftTabPanel(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: GridView.builder(
                itemCount: popularItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  final item = popularItems[index];
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Image.asset(item['icon']!, height: 40),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        item['label']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 12),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeftTabPanel() {
    return Container(
      width: 90,
      color: Colors.grey.shade100,
      child: ListView.builder(
        itemCount: tabs.length,
        itemBuilder: (context, index) {
          final tab = tabs[index];
          final isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () => setState(() => selectedIndex = index),
            child: Container(
              color: isSelected ? Colors.white : Colors.transparent,
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                children: [
                  Image.asset(tab['icon'], height: 28),
                  const SizedBox(height: 4),
                  Text(
                    tab['label'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected ? Colors.purple : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed:
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => HomeScreen()),
            ),
        icon: const Icon(Icons.arrow_back),
      ),
      title: const Text('Categories', style: TextStyle(color: Colors.black)),
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
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.black),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => Cart()));
          },
        ),
      ],
    );
  }
}
