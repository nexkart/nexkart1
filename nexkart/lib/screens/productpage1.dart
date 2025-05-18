// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:nexkart/models/product_model.dart';
import 'package:nexkart/screens/account_screen.dart';
import 'package:nexkart/screens/comming_soon.dart';
import 'package:nexkart/screens/homepage.dart';

void main() => runApp(
  MaterialApp(debugShowCheckedModeBanner: false, home: ProductPageWithNav1()),
);

class ProductPageWithNav1 extends StatefulWidget {
  const ProductPageWithNav1({super.key});

  @override
  // ignore: library\_private\_types\_in\_public\_api
  _ProductPageWithNavState createState() => _ProductPageWithNavState();
}

class _ProductPageWithNavState extends State<ProductPageWithNav1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class ProductPage12 extends StatelessWidget {
  final ProductModel product;
  final List<ProductModel> products;

  ProductPage12({super.key, required this.product})
    : products =
          ProductPage12.exploreMore
              .map(
                (m) => ProductModel(
                  id: 'id', // Placeholder, replace with actual ID if available
                  description:
                      m['highlightText'] ??
                      '', // Use highlightText or provide a default
                  image: m['image'],
                  name: m['title'],
                  price:
                      double.tryParse(m['newPrice']?.toString() ?? '0') ?? 0.0,
                  imageUrl: m['image'],
                  oldPrice: m['oldPrice'],

                  newPrice: m['newPrice'],
                  highlightImage: m['image'], // reuse for demo
                  highlightText: m['highlightText'], // demo text
                  discount: m['discount'],
                  delivery: m['delivery'],
                  brand: m['brand'],
                  title: m['title'],
                  buttonText: m['buttonText'],
                ),
              )
              .toList();

  // Dummy data for similar products
  static final List<Map<String, dynamic>> exploreMore = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            color: Colors.white,
            child: Row(
              children: [
                SizedBox(width: 0.5),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Buy now
                    },
                    icon: Icon(Icons.flash_on),
                    label: Text("Buy Now"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(60),
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomNavigationBar(
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
                            (context) =>
                                ComingSoonScreen(category: 'Categories'),
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
        ],
      ),

      backgroundColor: Colors.white,

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(height: 300, color: Colors.white),
                  Positioned(
                    top: 10,
                    right: 100,
                    bottom: 10,
                    child: Image.asset(
                      product.image,
                      width: 200,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // Wishlist Icon (top-right)
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 4.0,
                ),
                child: Row(
                  children: [
                    Text(
                      product.oldPrice ?? '',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      product.newPrice ?? '',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Icon(Icons.bolt_outlined, color: Colors.amber),
                    Text(
                      "Order Now And Get One Day Delivery",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),

              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "Delivery Address:\n42-09-395, Mangaldas nagar, 2nd line, Guntur...",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.black, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),
                      child: Text(
                        "Change",
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Divider(),
              ListTile(
                title: Text(
                  "Sizes",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Wrap(
                  spacing: 20,
                  children:
                      ['S', 'M', 'L', 'XL', 'XXL'].map((size) {
                        return Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 1.5),
                          ),
                          child: Center(
                            child: Text(
                              size,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ),
              Divider(),
              ListTile(
                title: Text(
                  "Product Highlights",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                subtitle: Text(
                  'About the Brand',
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      // or use Image.network() for online images
                      product.highlightImage ?? '',
                      width: 500, // update this path as needed
                      height: 150, // adjust height as needed
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 8), // space between image and text
                    Text(
                      product.highlightText ?? '',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),

              Divider(),
              ListTile(
                title: Text(
                  "Product Details",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 5.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 10.0,
                ),
                child: Row(
                  children: [
                    Text(
                      "Popcorn",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(width: 20), // Adjust this value to control spacing
                    Text(
                      "Fit/Shape",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 10.0,
                ),
                child: Row(
                  children: [
                    Text(
                      "Fabric",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(width: 20), // Adjust this value to control spacing
                    Text(
                      "Pure Cotton",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 10.0,
                ),
                child: Row(
                  children: [
                    Text(
                      "Sleeve",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(width: 20), // Adjust this value to control spacing
                    Text(
                      "Full Sleeve",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 10.0,
                ),
                child: Row(
                  children: [
                    Text(
                      "Pattern",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(width: 20), // Adjust this value to control spacing
                    Text(
                      "Solid",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 10.0,
                ),
                child: Row(
                  children: [
                    Text(
                      "Color",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(width: 20), // Adjust this value to control spacing
                    Text(
                      "Orange",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Low Price Store",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),

              SizedBox(
                height: 500,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final item = products[index];
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.brand ?? '',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 216, 147, 147),
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
                                              (_) => ProductPage12(
                                                product: products[index],
                                              ),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      item.buttonText ?? '',
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
