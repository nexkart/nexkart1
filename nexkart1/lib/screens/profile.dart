import 'package:flutter/material.dart';
import 'package:nexkart1/screens/adress.dart';
import 'package:nexkart1/screens/browse.dart';
import 'package:nexkart1/screens/categories1.dart';
import 'package:nexkart1/screens/homepage.dart';
import 'package:nexkart1/screens/myorders.dart';
import 'package:nexkart1/screens/payments.dart';
import 'package:nexkart1/screens/policypage.dart';
import 'package:nexkart1/screens/terms.dart';
import 'package:nexkart1/screens/wishlist.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
          currentIndex: 4,
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
        title: const Text(
          "Nexkart",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: const BackButton(),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF9F5CFF), Color(0xFF4B00A8)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Account Settings",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          _buildListTile(Icons.shopping_bag, "My Orders", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Myorders()),
            );
          }),

          _buildListTile(Icons.favorite_border, "Wishlist", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Wishlist()),
            );
          }),

          _buildListTile(Icons.account_balance_wallet, "Payment Methods", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Payments()),
            );
          }),

          _buildListTile(Icons.location_on_outlined, "Address", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Adress()),
            );
          }),

          _buildListTile(Icons.help_outline, "Help Center", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Policypage()),
            );
          }),

          _buildListTile(
            Icons.description_outlined,
            "Terms, Policies and licenses",
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Terms()),
              );
            },
          ),

          _buildListTile(Icons.question_answer_outlined, "Browse FAQ’S", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Browse()),
            );
          }),

          const SizedBox(height: 40),

          // Logout Gradient Button
          Center(
            child: Container(
              width: 200,
              height: 45,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFB57CF2), Color(0xFF4B00A8)],
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: TextButton(
                onPressed: () {
                  // Add your logout logic
                },
                child: const Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, VoidCallback onPressed) {
    return ListTile(
      leading: IconButton(
        icon: Icon(icon, size: 26, color: Colors.deepPurple),
        onPressed: onPressed,
      ),
      title: Text(title),
      onTap: onPressed, // Optional: tap on the tile also does same action
    );
  }
}
