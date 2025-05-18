import 'package:flutter/material.dart';
import 'package:nexkart1/screens/addaddress.dart';
import 'package:nexkart1/screens/categories1.dart';
import 'package:nexkart1/screens/homepage.dart';
import 'package:nexkart1/screens/myorders.dart';
import 'package:nexkart1/screens/profile.dart';

class Adress extends StatefulWidget {
  const Adress({super.key});

  @override
  State<Adress> createState() => _MyAddressesScreenState();
}

class _MyAddressesScreenState extends State<Adress> {
  List<Map<String, String>> addresses = [
    {
      'name': 'SIVA',
      'address':
          '42-02-546, Mangaldas nagar. 2nd line,\nopposite line of ayyapa temple,\nGUNTUR, Andhra Pradesh -522001',
      'phone': '8074277408',
    },
    {
      'name': 'Mani',
      'address':
          '42-02-546, Mangaldas nagar. 2nd line,\nopposite line of ayyapa temple,\nGUNTUR, Andhra Pradesh -522001',
      'phone': '8074277408',
    },
  ];

  void _navigateToAddAddress() async {
    final newAddress = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const Addaddress()),
    );

    if (newAddress != null) {
      setState(() {
        addresses.add(newAddress);
      });
    }
  }

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
      appBar: _buildGradientAppBar(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          GestureDetector(
            onTap: _navigateToAddAddress,
            child: Row(
              children: const [
                Icon(Icons.add, color: Colors.deepPurple),
                SizedBox(width: 8),
                Text(
                  "Add a new address",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "SAVED ADDRESSES",
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          ...addresses.map(
            (data) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _addressCard(
                name: data['name']!,
                address: data['address']!,
                phone: data['phone']!,
              ),
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildGradientAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF7B47F4), Color(0xFFBF60EF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
                const Text(
                  "My Addresses",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}

Widget _addressCard({
  required String name,
  required String address,
  required String phone,
}) {
  return Container(
    padding: const EdgeInsets.all(12),
    color: Colors.grey[200],
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Text(address, style: const TextStyle(fontSize: 14)),
        const SizedBox(height: 5),
        Text(phone, style: const TextStyle(fontSize: 14)),
      ],
    ),
  );
}
