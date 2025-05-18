import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:nexkart3/models/product_model.dart';
import 'package:nexkart3/screens/productpage1.dart';

class HomeScreen extends StatelessWidget {
  // convert each map to ProductModel once:
  late final List<ProductModel> products;
  late final List<ProductModel> lowPriceProductModels;

  HomeScreen({super.key}) {
    products =
        exploreMore
            .map(
              (m) => ProductModel(
                image: m['image'],
                name: m['title'],
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

    // convert each map to ProductModel on
    lowPriceProductModels =
        lowPriceProducts
            .map(
              (m) => ProductModel(
                image: m['image'],
                name: m['title'],
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
  }

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

  final List<String> offerImages = [
    'assets/images/promo-banner-1.png',
    'assets/images/promo-banner-2.png',
    'assets/images/promo-banner-3.png',
    'assets/images/banner_3.jpg',
    'assets/images/banner_8.jpg',
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
                onPressed: () {},
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
                onPressed: () {},

                icon: const Icon(Icons.receipt_long),
              ),
              label: 'My Orders',
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {},
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
          automaticallyImplyLeading: false,
          flexibleSpace: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 30),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF9B87F5), Color(0xFF5A4F8F)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
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
                hintText: "Search For products",
                hintStyle: TextStyle(fontFamily: 'Inter'),
                prefixIcon: Icon(Icons.search, color: Colors.black),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.mic_none_outlined, color: Colors.black),
                      onPressed: () {},
                    ),
                  ],
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: Image.asset('assets/images/cart.png'),
                  onPressed: () {},
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: Icon(Icons.favorite_border, color: Colors.black),
                  onPressed: () {},
                ),
              ),
            ),
            SizedBox(width: 5),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Category Items
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    categoryItem('assets/images/shirt.png', "Mens wear", () {
                      // Navigate to women's wear
                    }),

                    categoryItem(
                      'assets/images/girldress.png',
                      "Womens wear",
                      () {
                        // Navigate to women's wear
                      },
                    ),
                    categoryItem('assets/images/tv.png', "Electronics", () {
                      // Open electronics category
                    }),
                    categoryItem(
                      'assets/images/lotionbottle.png',
                      "Beauty",
                      () {
                        // Open beauty products
                      },
                    ),
                    categoryItem('assets/images/Group.png', "Toys", () {
                      // Show toys
                    }),
                    categoryItem('assets/images/shoes.png', "Foot wear", () {
                      // Show footwear
                    }),
                    categoryItem('assets/images/more.png', "More", () {
                      // Maybe open a category dialog or show all categories
                    }),
                  ],
                ),
              ),

              SizedBox(height: 20),
              Text(
                "Offers for You",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: offerImages.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage(
                            offerImages[index],
                          ), // 👈 dynamic image
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.3),
                              Colors.transparent,
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                        alignment: Alignment.bottomLeft,
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  featureButton('assets/images/bus.png', "Free Delivery"),
                  featureButton('assets/images/pricetag.png', "Weekend Deals"),
                  featureButton('assets/images/clock.png', "Fast Delivery"),
                  featureButton('assets/images/price.png', "Low Prices"),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "Low Price Store",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),

              SizedBox(
                height: 400,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: lowPriceProductModels.length,
                  itemBuilder: (context, index) {
                    final item = lowPriceProductModels[index];
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
                                      item.discount,
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
                                  item.delivery,
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
                                                product:
                                                    lowPriceProductModels[index],
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

Widget lowPriceItem(String name, String price, String oldPrice) {
  return Container(
    width: 150,
    margin: const EdgeInsets.only(right: 12),
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
      boxShadow: [BoxShadow(color: Colors.grey.shade100, blurRadius: 5)],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Placeholder(fallbackHeight: 80),
        const SizedBox(height: 6),
        Text(name, maxLines: 1, overflow: TextOverflow.ellipsis),
        Row(
          children: [
            Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(width: 5),
            Text(
              oldPrice,
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget suggestionItem(String imagePath) {
  return Column(
    children: [
      Expanded(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
      ),
    ],
  );
}

// ✅ SINGLE categoryItem function outside the class
Widget categoryItem(String imagePath, String label, VoidCallback onPressed) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          iconSize: 50,
          onPressed: onPressed,
          icon: Image.asset(imagePath),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

Widget featureButton(String imagePath, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Image.asset(
          imagePath,
          width: 30,
          height: 30,
          fit: BoxFit.contain,
        ),
      ),
      const SizedBox(height: 5),
      Text(label, style: TextStyle(fontSize: 10, fontFamily: 'Ink')),
    ],
  );
}
