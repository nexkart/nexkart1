import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexkartt/providers/cart_provider.dart';
import 'package:nexkartt/screens/categories/bueaty.dart';
import 'package:nexkartt/screens/categories/electronics.dart';
import 'package:nexkartt/screens/categories/mensware.dart';
import 'package:nexkartt/screens/categories/shoes.dart';
import 'package:nexkartt/screens/categories/toys.dart';
import 'package:nexkartt/screens/categories/womensware.dart';
import 'package:nexkartt/screens/product_details_screen.dart';
import 'package:provider/provider.dart';
import 'package:nexkartt/providers/wishlist_provider.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onSearchPressed;

  const HomeScreen({Key? key, required this.onSearchPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
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
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: _SearchBar(onSearchPressed: onSearchPressed),
              ),

              SliverToBoxAdapter(child: _CategoryList()),
              SliverPadding(
                padding: EdgeInsets.all(16.w),
                sliver: _ProductGrid(),
              ),
            ],
          ),
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: EdgeInsets.all(16.w),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26, width: 1),
          color: Colors.black,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 246, 245, 248).withOpacity(0.1),
              Colors.white,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.grey.shade600, size: 22.sp),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                'Search products',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 16.sp),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.mic, color: Colors.grey.shade600, size: 22.sp),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.camera_alt,
                color: Colors.grey.shade600,
                size: 22.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// -------------------- Banner Carousel --------------------

// -------------------- Category List --------------------
class _CategoryList extends StatelessWidget {
  _CategoryList();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            categoryItem('assets/images/shirt.png', "Mens", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MenWearScreen()),
              );
            }),
            categoryItem('assets/images/girldress.png', "Womens", () {
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
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 80.w,
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF4A00E0).withOpacity(0.1),
                  Colors.white,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(8.w),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                errorBuilder:
                    (context, error, stackTrace) => const Icon(
                      Icons.broken_image,
                      color: Colors.grey,
                      size: 30,
                    ),
              ),
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF4A00E0),
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}

// -------------------- Product Grid --------------------
class _ProductGrid extends StatelessWidget {
  _ProductGrid();

  static const List<Map<String, dynamic>> products = [
    {
      'name': 'iPhone 15',
      'price': 79999,
      'image':
          'assets/images/iphone_14_pro.png', // Replace with your image URLs
      // 'image': 'assets/images/iphone_14_pro.png',
    },
    {
      'name': 'Galaxy S24',
      'price': 69999,
      'image': 'assets/images/iphone8_mobile_dual_side.png',
      // 'image': 'assets/images/iphone8_mobile_back.png',
    },
    {
      'name': 'MacBook Pro',
      'price': 129999,
      'image': 'assets/images/leather_jacket_4.png',
      // 'image': 'assets/images/iphone_12_black.png',
    },
    {
      'name': 'Sony Headphones',
      'price': 9999,
      'image': 'assets/images/acer_laptop_var_4.png',
      // 'image': 'assets/images/acer_laptop_var_1.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        final product = products[index];
        return AnimatedOpacity(
          opacity: 1.0,
          duration: Duration(milliseconds: 300 + index * 100),
          child: _ProductCard(product: product),
        );
      }, childCount: products.length),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 350.h,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    final wishlist = context.watch<WishlistProvider>();
    final isInWishlist = wishlist.isInWishlist(product['name']);

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
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
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(12.r),
                  ),
                  child:
                      product['image'].startsWith('assets/')
                          ? Image.asset(
                            product['image'],
                            height: 160.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder:
                                (context, error, stackTrace) =>
                                    _imageErrorWidget(),
                          )
                          : CachedNetworkImage(
                            imageUrl: product['image'],
                            height: 160.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => _imagePlaceholder(),
                            errorWidget:
                                (context, url, error) => _imageErrorWidget(),
                          ),
                ),
              ),
              Positioned(
                top: 6.h,
                right: 6.w,
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
                              isInWishlist
                                  ? Icons.remove_circle
                                  : Icons.favorite,
                              color: Colors.white,
                              size: 20.sp,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              '${product['name']} ${isInWishlist ? 'removed from' : 'added to'} wishlist',
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
                fontSize: 16.sp,
                color: Colors.grey.shade800,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              '₹${product['price']}',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF4A00E0),
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
                  final productToAdd = {
                    'name': product['name'],
                    'price': product['price'],
                    'image': product['image'],
                  };
                  context.read<CartProvider>().addItem(productToAdd);
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
                  minimumSize: Size.fromHeight(36.h),
                  backgroundColor: const Color(0xFF4A00E0),
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
