import 'package:flutter/material.dart';

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
  int _currentIndex = 0;

  final List<Widget> _pages = [
    ProductPage(),
    Center(child: Text("Categories")),
    Center(child: Text("Sell")),
    Center(child: Text("My Orders")),
    Center(child: Text("Profile")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart_outlined, color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.favorite_border, color: Colors.black),
              onPressed: () {},
            ),
            SizedBox(width: 8),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),

      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: Color(0xFF5A4F8F),
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Sell',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'My Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class ProductPage extends StatelessWidget {
  final double averageRating = 4.0;
  final int totalRatings = 532;
  final Map<int, int> ratingsCount = {5: 320, 4: 120, 3: 50, 2: 25, 1: 17};

  // Place this function **before** the Widget build method or where you use it
  Widget questionAnswerTile({
    required String question,
    required String answer,
    required String user,
    int helpfulCount = 0,
    int commentCount = 0,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Q: $question", style: TextStyle(fontWeight: FontWeight.w600)),
        SizedBox(height: 4),
        Text("A: $answer"),
        SizedBox(height: 6),
        Row(
          children: [
            Text(user, style: TextStyle(fontWeight: FontWeight.w500)),
            SizedBox(width: 8),
            Icon(Icons.check_circle, size: 16, color: Colors.blue),
            Text(" Certified Buyer", style: TextStyle(color: Colors.grey[600])),
          ],
        ),
        SizedBox(height: 6),
        Row(
          children: [
            Icon(Icons.thumb_up_alt_outlined, size: 16, color: Colors.grey),
            SizedBox(width: 4),
            Text(helpfulCount > 0 ? "Helpful for $helpfulCount" : "Helpful"),
            SizedBox(width: 16),
            Icon(Icons.chat_bubble_outline, size: 16, color: Colors.grey),
            SizedBox(width: 4),
            Text("$commentCount"),
          ],
        ),
        SizedBox(height: 12),
        Divider(),
      ],
    );
  }

  final List<Map<String, dynamic>> exploreMore = [
    {
      'image': 'assets/images/leather_jacket_2.png',
      'title': 'Men Leather Jacket',
      'brand': 'JACKBELLA',
      'price': '₹339',
      'oldPrice': '₹1599',
      'discount': '78%',
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
  ];

  ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                    'assets/images/tshirt_red_collar.png',
                    width: 200,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Feel High men Regular Fit Solid Casual Shirt",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.amberAccent),
                  Icon(Icons.star, color: Colors.amberAccent),
                  Icon(Icons.star, color: Colors.amberAccent),
                  Icon(Icons.star, color: Colors.amberAccent),
                  Text("4.0 (240 reviews)", style: TextStyle(fontSize: 16)),
                ],
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
                    "₹1299",
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "₹299",
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
                      style: TextStyle(color: Colors.deepPurple, fontSize: 14),
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
                    'assets/images/image.png',
                    width: 500, // update this path as needed
                    height: 150, // adjust height as needed
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 8), // space between image and text
                  Text(
                    "This casual shirt is made from premium fabric that ensures comfort and durability. The Indian Sleeves Garage Co is daring, bold, and just what the modern Indian man needs. The fashion-forward Indian Garage brings down this...",
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
            Divider(),
            ListTile(
              title: Text(
                "Similar Products",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 350, // Total height for each card
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:
                      exploreMore.map((item) {
                        return Container(
                          width: 160, // Width of each horizontal card
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
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
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                        ),
                                      ),
                                      Text(
                                        item['title'] ?? '',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      SizedBox(height: 4),
                                      Row(
                                        children: [
                                          Text(
                                            item['discount'] ?? '',
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            "₹${item['oldPrice'] ?? ''}",
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              color: Colors.grey,
                                              fontSize: 11,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        "₹${item['newPrice'] ?? ''}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
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
                                            style: TextStyle(
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

            Divider(),
            ListTile(
              title: Text(
                "Ratings & Reviews",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            // Average Rating + Star Display
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8,
              ),
              child: Row(
                children: [
                  Text(
                    averageRating.toStringAsFixed(1),
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            index < averageRating.round()
                                ? Icons.star
                                : Icons.star_border,
                            color: Colors.orange,
                          );
                        }),
                      ),
                      Text(
                        "$totalRatings Ratings",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Star Rating Breakdown
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children:
                    ratingsCount.entries.map((entry) {
                      double percent = entry.value / totalRatings;
                      return Row(
                        children: [
                          Text("${entry.key} ★"),
                          SizedBox(width: 8),
                          Expanded(
                            child: LinearProgressIndicator(
                              value: percent,
                              color: Colors.orange,
                              backgroundColor: Colors.grey[300],
                            ),
                          ),
                          SizedBox(width: 8),
                          Text("${entry.value}"),
                        ],
                      );
                    }).toList(),
              ),
            ),

            SizedBox(height: 20),
            Divider(),
            ListTile(
              title: Text("User123"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: List.generate(
                      5,
                      (index) =>
                          Icon(Icons.star, size: 16, color: Colors.orange),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text("Good quality product."),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      Image.asset(
                        "assets/images/orange.png",
                        width: 150,
                        height: 170,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        "assets/images/orange.png",
                        width: 150,
                        height: 170,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        "assets/images/orange.png",
                        width: 150,
                        height: 170,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        "assets/images/orange.png",
                        width: 150,
                        height: 170,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text("Syam123"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: List.generate(
                      5,
                      (index) =>
                          Icon(Icons.star, size: 16, color: Colors.orange),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text("Good quality product."),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      Image.asset(
                        "assets/images/orange.png",
                        width: 150,
                        height: 170,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        "assets/images/orange.png",
                        width: 150,
                        height: 170,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        "assets/images/orange.png",
                        width: 150,
                        height: 170,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        "assets/images/orange.png",
                        width: 150,
                        height: 170,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text("Ramesh23"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: List.generate(
                      5,
                      (index) =>
                          Icon(Icons.star, size: 16, color: Colors.orange),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text("Awesome Product."),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      Image.asset(
                        "assets/images/orange.png",
                        width: 150,
                        height: 170,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        "assets/images/orange.png",
                        width: 150,
                        height: 170,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        "assets/images/orange.png",
                        width: 150,
                        height: 170,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        "assets/images/orange.png",
                        width: 150,
                        height: 170,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Divider(),
            ListTile(
              title: Text(
                "Questions and Answers",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  questionAnswerTile(
                    question: "If colour gone after first wash ?",
                    answer: "Yes color has gone after first wash",
                    user: "Atul Goswami",
                    helpfulCount: 15,
                    commentCount: 1,
                  ),
                  questionAnswerTile(
                    question:
                        "I generally wear XL size but XL size is not available so I have decided to order L size is it fit for me",
                    answer: "Yes it will fit for you",
                    user: "Onkar Jadhav",
                    helpfulCount: 0,
                    commentCount: 0,
                  ),
                  questionAnswerTile(
                    question: "My size of chest is 44 what size should I order",
                    answer: "Less than 1 size",
                    user: "Jajnase...",
                    helpfulCount: 1,
                    commentCount: 0,
                  ),
                  questionAnswerTile(
                    question: "If colour gone after first wash ?",
                    answer: "Yes color has gone after first wash",
                    user: "Atul Goswami",
                    helpfulCount: 15,
                    commentCount: 1,
                  ),
                  questionAnswerTile(
                    question: "If colour gone after first wash ?",
                    answer: "Yes color has gone after first wash",
                    user: "Atul Goswami",
                    helpfulCount: 15,
                    commentCount: 1,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 12.0,
                    ),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // TODO: Add your navigation or question-posting logic here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Colors.deepPurple),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 20,
                        ),
                      ),
                      icon: Icon(Icons.edit, color: Colors.deepPurple),
                      label: Text(
                        "Post your question",
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(),
                  ListTile(
                    title: Text(
                      "Explore More like This",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: exploreMore.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                                borderRadius: BorderRadius.vertical(
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
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      item['title'] ?? '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 6),
                                    Row(
                                      children: [
                                        Text(
                                          item['discount'] ?? '',
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "₹${item['oldPrice'] ?? ''}",
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "₹${item['newPrice'] ?? ''}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      item['delivery'] ?? '',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(height: 8),
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
                                          style: TextStyle(color: Colors.black),
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
          ],
        ),
      ),
    );
  }
}
