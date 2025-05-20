import 'package:flutter/material.dart';
import 'package:nexkart4/providers/cart_provider.dart';
import 'package:nexkart4/screens/categories/bueaty.dart';
import 'package:nexkart4/screens/categories/electronics.dart';
import 'package:nexkart4/screens/categories/mensware.dart';
import 'package:nexkart4/screens/categories/shoes.dart';
import 'package:nexkart4/screens/categories/toys.dart';
import 'package:nexkart4/screens/categories/womensware.dart';
import 'package:nexkart4/screens/product_details_screen.dart';
import 'package:provider/provider.dart';
import 'package:nexkart4/providers/wishlist_provider.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onSearchPressed;

  const HomeScreen({Key? key, required this.onSearchPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _SearchBar(onSearchPressed: onSearchPressed),
            ),
            const SliverToBoxAdapter(child: _BannerCarousel()),
            const SliverToBoxAdapter(child: _CategoryList()),
            const SliverPadding(
              padding: EdgeInsets.all(16),
              sliver: _ProductGrid(),
            ),
          ],
        ),
      ),
    );
  }
}

// -------------------- Search Bar --------------------
class _SearchBar extends StatelessWidget {
  final VoidCallback onSearchPressed;

  const _SearchBar({required this.onSearchPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSearchPressed,
      child: Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.grey),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                'Search products',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.mic)),
            IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt)),
          ],
        ),
      ),
    );
  }
}

// -------------------- Banner Carousel --------------------
class _BannerCarousel extends StatelessWidget {
  const _BannerCarousel();

  static const List<String> bannerImages = [
    'assets/images/banner_2.jpg',
    'assets/images/banner_3.jpg',
    'assets/images/banner_4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: PageView.builder(
        itemCount: bannerImages.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade200,
              image: DecorationImage(
                image: AssetImage(bannerImages[index]),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

// -------------------- Category List --------------------
class _CategoryList extends StatelessWidget {
  const _CategoryList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          children: [
            categoryItem('assets/images/shirt.png', "Mens wear", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MenWearScreen()),
              );
            }),
            categoryItem('assets/images/girldress.png', "Womens wear", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WoMenWearScreen()),
              );
            }),
            categoryItem('assets/images/tv.png', "Electronics", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Electronics()),
              );
            }),
            categoryItem('assets/images/lotionbottle.png', "Beauty", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Bueaty()),
              );
            }),
            categoryItem('assets/images/Group.png', "Toys", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ToysScreen()),
              );
            }),
            categoryItem('assets/images/shoes.png', "Foot wear", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Shoes()),
              );
            }),
            categoryItem('assets/images/more.png', "More", () {}),
          ],
        ),
      ),
    );
  }
}

// -------------------- Category Item Widget --------------------
Widget categoryItem(String imagePath, String label, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 80,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
              height: 30,
              width: 30,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}

// -------------------- Product Grid --------------------
class _ProductGrid extends StatelessWidget {
  const _ProductGrid();

  static const List<Map<String, dynamic>> products = [
    {
      'name': 'iPhone 15',
      'price': 79999,
      'image': 'assets/images/iphone_14_pro.png',
    },
    {
      'name': 'Galaxy S24',
      'price': 69999,
      'image': 'assets/images/iphone8_mobile_back.png',
    },
    {
      'name': 'MacBook Pro',
      'price': 129999,
      'image': 'assets/images/iphone_12_black.png',
    },
    {
      'name': 'Sony Headphones',
      'price': 9999,
      'image': 'assets/images/acer_laptop_var_1.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        final product = products[index];
        return _ProductCard(product: product);
      }, childCount: products.length),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 300,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    final wishlist = context.watch<WishlistProvider>();
    final isInWishlist = wishlist.isInWishlist(product['name']);

    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetailsScreen(product: product),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.asset(
                    product['image'],
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 6,
                right: 6,
                child: IconButton(
                  icon: Icon(
                    isInWishlist ? Icons.favorite : Icons.favorite_border,
                    color: isInWishlist ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    wishlist.toggleWishlist(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '${product['name']} ${isInWishlist ? 'removed from' : 'added to'} wishlist',
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              product['name'],
              maxLines: 2,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              '₹${product['price']}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                final productToAdd = {
                  'name': product['name'],
                  'price': product['price'],
                  'image': product['image'],
                };
                context.read<CartProvider>().addItem(productToAdd);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${product['name']} added to cart')),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(36),
                backgroundColor: Colors.deepPurple,
              ),
              child: const Text(
                'Add to Cart',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
