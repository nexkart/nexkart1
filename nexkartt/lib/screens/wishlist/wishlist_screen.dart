import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexkartt/screens/home/home_screen.dart';
import 'package:provider/provider.dart';
import '../../providers/wishlist_provider.dart';
import '../../providers/cart_provider.dart';
import '../product_details_screen.dart'; // Add this import

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    final wishlist = context.watch<WishlistProvider>();

    return Theme(
      data: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primaryColor: const Color(0xFF4A00E0),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF4A00E0),
          secondary: Color(0xFFFF8C00),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'My Wishlist',
            style: TextStyle(
              color: const Color(0xFF4A00E0),
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF4A00E0).withOpacity(0.1),
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          iconTheme: const IconThemeData(color: Color(0xFF4A00E0)),
        ),
        body:
            wishlist.items.isEmpty
                ? _EmptyWishlist()
                : Padding(
                  padding: EdgeInsets.all(12.w),
                  child: GridView.builder(
                    itemCount: wishlist.items.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 300.h,
                      crossAxisSpacing: 12.w,
                      mainAxisSpacing: 12.h,
                    ),
                    itemBuilder: (context, index) {
                      final product = wishlist.items[index];
                      return AnimatedOpacity(
                        opacity: 1.0,
                        duration: Duration(milliseconds: 300 + index * 100),
                        child: _WishlistCard(product: product),
                      );
                    },
                  ),
                ),
      ),
    );
  }
}

// -------------------- Empty Wishlist Widget --------------------
class _EmptyWishlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedScale(
            scale: 1.0,
            duration: const Duration(milliseconds: 500),
            child: Icon(
              Icons.favorite_border,
              size: 100.sp,
              color: Colors.grey.shade400,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'Your wishlist is empty 💔',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade600,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Add some products to your wishlist!',
            style: TextStyle(fontSize: 16.sp, color: Colors.grey.shade500),
          ),
          SizedBox(height: 24.h),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(onSearchPressed: () {}),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4A00E0),
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              elevation: 2,
            ),
            child: Text(
              'Explore Products',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// -------------------- Wishlist Card Widget --------------------
class _WishlistCard extends StatelessWidget {
  final Map<String, dynamic> product;

  const _WishlistCard({required this.product});

  @override
  Widget build(BuildContext context) {
    final wishlist = context.watch<WishlistProvider>();
    final isInWishlist = wishlist.isInWishlist(product['name']);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      elevation: 3,
      shadowColor: Colors.black.withOpacity(0.1),
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
                      builder:
                          (context) => ProductDetailsScreen(product: product),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16.r),
                  ),
                  child:
                      product['image'].startsWith('assets/')
                          ? Image.asset(
                            product['image'],
                            height: 150.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              print(
                                'Asset load error for ${product['image']}: $error',
                              );
                              return _imageErrorWidget();
                            },
                          )
                          : CachedNetworkImage(
                            imageUrl: product['image'],
                            height: 150.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => _imagePlaceholder(),
                            errorWidget: (context, url, error) {
                              print(
                                'Network image load error for $url: $error',
                              );
                              return _imageErrorWidget();
                            },
                          ),
                ),
              ),
              Positioned(
                top: 8.h,
                right: 8.w,
                child: IconButton(
                  icon: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Icon(
                      isInWishlist ? Icons.favorite : Icons.favorite_border,
                      key: ValueKey<bool>(isInWishlist),
                      color: isInWishlist ? Colors.red : Colors.grey,
                      size: 24.sp,
                    ),
                  ),
                  onPressed: () {
                    wishlist.toggleWishlist(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: [
                            Icon(
                              Icons.remove_circle,
                              color: Colors.white,
                              size: 20.sp,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              '${product['name']} removed from wishlist',
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ],
                        ),
                        duration: const Duration(seconds: 2),
                        backgroundColor: const Color(0xFF4A00E0),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        margin: EdgeInsets.all(16.w),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Text(
              product['name'],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15.sp,
                color: Colors.grey.shade800,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              '₹${product['price']}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: const Color(0xFF4A00E0),
                fontSize: 16.sp,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: GestureDetector(
              onTapDown: (_) => Feedback.forTap(context),
              child: ElevatedButton(
                onPressed: () {
                  final cart = context.read<CartProvider>();
                  cart.addItem(product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Row(
                        children: [
                          Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            '${product['name']} added to cart',
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ],
                      ),
                      duration: const Duration(seconds: 2),
                      backgroundColor: const Color(0xFF4A00E0),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      margin: EdgeInsets.all(16.w),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4A00E0),
                  minimumSize: Size.fromHeight(36.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  elevation: 2,
                ),
                child: Text(
                  'Add to Cart',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _imagePlaceholder() => const Center(
    child: SpinKitFadingCircle(color: Color(0xFF4A00E0), size: 40),
  );

  Widget _imageErrorWidget() => const Center(
    child: Icon(Icons.broken_image, color: Colors.grey, size: 40),
  );
}
