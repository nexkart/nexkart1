import 'package:flutter/material.dart';
import 'package:nexkart/screens/account_screen.dart';
import 'package:nexkart/screens/comming_soon.dart';

import 'package:nexkart/screens/homepage.dart';

import 'package:nexkart/screens/productpage1.dart';
import 'package:nexkart/models/product_model.dart';

void main() {
  runApp(WomenswareApp());
}

class WomenswareApp extends StatelessWidget {
  // Removed late final fields and moved logic to build method or use global lists

  const WomenswareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Womensware());
  }
}

// Move these lists outside of the class so they are accessible globally.
final List<Map<String, dynamic>> exploreMore = [
  {
    'image': 'assets/images/leather_jacket_1.png',
    'brand': 'JACKBELLA',
    'title': 'Men’s Leather Jacket',
    'discount': '↓78%',
    'oldPrice': '1,599',
    'newPrice': '339',
    'delivery': 'Delivery by Wednesday',
    'buttonText': 'Buy now',
    'highlightText':
        'Genuine leather, premium quality', // <-- custom desc for this product
  },
  // ...
  {
    // 10th product (index 9)
    'image': 'assets/images/product-slippers.png',
    'brand': 'Sparx',
    'title': 'Comfortable Slippers',
    'discount': '↓68%',
    'oldPrice': '499',
    'newPrice': '159',
    'delivery': 'Delivery by Wednesday',
    'buttonText': 'Buy now',
    'highlightText':
        'Special edition slippers with extra comfort and sole support', // custom desc for product 10
  },
  {
    'image': 'assets/images/leather_jacket_3.png',
    'brand': 'Highlander',
    'title': 'Slim-Fit Blue Jeans',
    'discount': '↓65%',
    'oldPrice': '1,199',
    'newPrice': '419',
    'delivery': 'Delivery by Tuesday',
    'buttonText': 'Buy now',
    'highlightText':
        'Perfect fit for all body types', // custom desc for product 3
  },
  {
    'image': 'assets/images/leather_jacket_3.png',
    'brand': 'Highlander',
    'title': 'Slim-Fit Blue Jeans',
    'discount': '↓65%',
    'oldPrice': '1,199',
    'newPrice': '419',
    'delivery': 'Delivery by Tuesday',
    'buttonText': 'Buy now',
    'highlightText':
        'Perfect fit for all body types', // custom desc for product 3
  },
  // Other products...
];

// Convert exploreMore to a list of ProductModel objects for use in the widget tree.
final List<ProductModel> exploreMoreProductModels =
    exploreMore
        .map(
          (m) => ProductModel(
            id: 'id', // Placeholder, replace with actual ID if available
            description:
                m['highlightText'] ??
                '', // Use highlightText or provide a default
            image: m['image'],
            name: m['title'],
            price: double.tryParse(m['newPrice']?.toString() ?? '0') ?? 0.0,
            imageUrl: m['image'],
            oldPrice: m['oldPrice'],

            newPrice: m['newPrice'],
            highlightImage: m['image'],
            highlightText: m['highlightText'],
            discount: m['discount'],
            delivery: m['delivery'],
            brand: m['brand'],
            title: m['title'],
            buttonText: m['buttonText'],
          ),
        )
        .toList();

final List<Map<String, dynamic>> lowPriceProducts = [
  {
    'image': 'assets/images/leather_jacket_1.png',
    'brand': 'JACKBELLA',
    'title': 'Men’s Leather Jacket',
    'discount': '↓78%',
    'oldPrice': '1,599',
    'newPrice': '339',
    'delivery': 'Delivery by Wednesday',
    'buttonText': 'Buy now',
    'highlightText':
        'Genuine leather, premium quality superduper', // <-- custom desc for this product
  },

  {
    'image': 'assets/images/leather_jacket_3.png',
    'brand': 'Highlander',
    'title': 'Slim-Fit Blue Jeans',
    'discount': '↓65%',
    'oldPrice': '1,199',
    'newPrice': '419',
    'delivery': 'Delivery by Tuesday',
    'buttonText': 'Buy now',
    'highlightText':
        'Perfect fit for all body types', // custom desc for product 3
  },
  {
    'image': 'assets/images/tshirt_red_collar.png',
    'brand': 'Dennis Lingo',
    'title': 'Stylish Cotton Shirt',
    'discount': '↓72%',
    'oldPrice': '1,499',
    'newPrice': '419',
    'delivery': 'Delivery by Thursday',
    'buttonText': 'Buy now',
    'highlightText':
        'Breathable fabric for summer', // custom desc for product 4
  },
  {
    'image': 'assets/images/tshirt_yellow_collar.png',
    'brand': 'SneakPeak',
    'title': 'Classic White Sneakers',
    'discount': '↓54%',
    'oldPrice': '2,199',
    'newPrice': '999',
    'delivery': 'Delivery by Friday',
    'buttonText': 'Buy now',
    'highlightText':
        'Trendy and comfortable for daily wear', // custom desc for product 5
    // 7th product (index 6)
  },
];

class Womensware extends StatelessWidget {
  const Womensware({super.key});

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
                    MaterialPageRoute(
                      builder:
                          (context) => ComingSoonScreen(category: 'Categories'),
                    ),
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
                    MaterialPageRoute(builder: (context) => AccountScreen()),
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
          actions: [],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Text(
            "Women's Wear",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 8),

          SizedBox(
            height: 400,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: lowPriceProducts.length,
              itemBuilder: (context, index) {
                final itemMap = lowPriceProducts[index];
                final item = ProductModel(
                  imageUrl: itemMap['image'],
                  price:
                      double.tryParse(itemMap['newPrice']?.toString() ?? '0') ??
                      0.0,
                  description: itemMap['highlightText'] ?? '',
                  id: 'lowprice_$index',
                  image: itemMap['image'],
                  name: itemMap['title'],
                  oldPrice: itemMap['oldPrice'],
                  newPrice: itemMap['newPrice'],
                  highlightImage: itemMap['image'],
                  highlightText: itemMap['highlightText'],
                  discount: itemMap['discount'],
                  delivery: itemMap['delivery'],
                  brand: itemMap['brand'],
                  title: itemMap['title'],
                  buttonText: itemMap['buttonText'],
                );
                return Container(
                  width: 160,
                  margin: const EdgeInsets.only(right: 12),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              item.image,
                              height: 220,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),

                          // Wishlist Icon (top-right)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.brand ?? '',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              item.title ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                Text(
                                  item.discount ?? '',
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "₹${item.oldPrice}",
                                  style: const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "₹${item.newPrice}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item.delivery ?? '',
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
                                      (item.buttonText == 'Buy now')
                                          ? const Color(0xFF9B87F5)
                                          : Colors.grey[300],
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (_) => ProductPage12(product: item),
                                    ),
                                  );
                                },
                                child: Text(
                                  item.buttonText ?? '',
                                  style: const TextStyle(color: Colors.black),
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

          Divider(),
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
                mainAxisExtent: 450,

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

                      // Wishlist Icon (top-right)
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
                            Text(item['delivery'] ?? ''),
                            const SizedBox(height: 8),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      (item['buttonText'] == 'Buy now')
                                          ? const Color(0xFF9B87F5)
                                          : Colors.grey[300],
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (_) => ProductPage12(
                                            product:
                                                exploreMoreProductModels[index],
                                          ),
                                    ),
                                  );
                                },
                                child: Text(
                                  item['buttonText'] ?? '',
                                  style: const TextStyle(color: Colors.black),
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
    );
  }
}
