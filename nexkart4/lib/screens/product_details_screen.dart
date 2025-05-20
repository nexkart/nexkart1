import 'package:flutter/material.dart';
import 'package:nexkart4/screens/wishlist/ordersummery.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../providers/wishlist_provider.dart';

// Import your OrderSummaryScreen below (create it) // Adjust the import path accordingly

class ProductDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final images =
        widget.product['images'] as List<String>? ?? [widget.product['image']];
    final wishlist = context.watch<WishlistProvider>();
    final isInWishlist = wishlist.isInWishlist(widget.product['name']);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product['name']),
        actions: [
          IconButton(
            icon: Icon(
              isInWishlist ? Icons.favorite : Icons.favorite_border,
              color: isInWishlist ? Colors.red : Colors.grey,
            ),
            onPressed: () {
              wishlist.toggleWishlist(widget.product);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    '${widget.product['name']} ${isInWishlist ? 'removed from' : 'added to'} wishlist',
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  PageView.builder(
                    itemCount: images.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentImageIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Image.asset(images[index], fit: BoxFit.cover);
                    },
                  ),
                  Positioned(
                    bottom: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(images.length, (index) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: _currentImageIndex == index ? 12 : 8,
                          height: _currentImageIndex == index ? 12 : 8,
                          decoration: BoxDecoration(
                            color:
                                _currentImageIndex == index
                                    ? Colors.deepPurple
                                    : Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product['name'],
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '₹${widget.product['price']}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // The rest of your UI code remains unchanged
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter pincode to check delivery',
                      prefixIcon: const Icon(Icons.location_pin),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    children:
                        ['S', 'M', 'L', 'XL', 'XXL'].map((size) {
                          return ChoiceChip(
                            label: Text(size),
                            selected: false,
                            onSelected: (selected) {},
                          );
                        }).toList(),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Highlights',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    '\u2022 100% original products\n\u2022 Free delivery available\n\u2022 Easy 30-day return policy',
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Product Description',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'This is a detailed description of the product including specs, build quality, and usage.',
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  context.read<CartProvider>().addItem(widget.product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${widget.product['name']} added to cart'),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              OrderSummaryScreen(product: widget.product),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  'Buy Now',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
