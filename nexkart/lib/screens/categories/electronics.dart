import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';
import '../../providers/wishlist_provider.dart';

class Electronics extends StatefulWidget {
  final VoidCallback? onSearchPressed; // Add the optional callback

  const Electronics({super.key, this.onSearchPressed}); // Single constructor

  @override
  State<Electronics> createState() => _ElectronicsState();
}

class _ElectronicsState extends State<Electronics> {
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = '';

  // Sample men's wear products (replace with your real data)
  final List<Map<String, dynamic>> products = [
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
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts =
        products.where((product) {
          final nameLower = product['name'].toString().toLowerCase();
          final queryLower = searchQuery.toLowerCase();
          return nameLower.contains(queryLower);
        }).toList();

    return Scaffold(
      appBar: AppBar(
        title: _buildSearchBar(),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child:
            filteredProducts.isEmpty
                ? const Center(child: Text('No products found'))
                : GridView.builder(
                  itemCount: filteredProducts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 300,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    final product = filteredProducts[index];
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/product_details',
                          arguments: product,
                        );
                      },
                      child: _ProductCard(product: product),
                    );
                  },
                ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: 'Search Electronic\'s...',
        hintStyle: const TextStyle(color: Colors.white70),
        prefixIcon: const Icon(Icons.search, color: Colors.white),
        filled: true,
        fillColor: Colors.deepPurple.shade700,
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: Colors.white),
      onChanged: (val) {
        setState(() {
          searchQuery = val;
        });
      },
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 1, // Assuming 1 is the index for MenWear screen
      selectedItemColor: Colors.deepPurple,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        // Add your navigation logic here
        // Example:
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/home');
            break;
          case 1:
            // Already on MenWear screen
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/cart');
            break;
          case 3:
            Navigator.pushReplacementNamed(context, '/profile');
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'Electronics'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
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
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
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
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
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
