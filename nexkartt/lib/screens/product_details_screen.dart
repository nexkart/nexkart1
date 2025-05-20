import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexkartt/screens/wishlist/ordersummery.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../providers/cart_provider.dart';
import '../providers/wishlist_provider.dart';

// Helper function to check if an image is a local asset
bool isAssetImage(String path) {
  return path.startsWith('assets/');
}

// FullScreenImageViewer
class FullScreenImageViewer extends StatelessWidget {
  final List<String> images;
  final int initialPage;

  const FullScreenImageViewer({
    Key? key,
    required this.images,
    required this.initialPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: initialPage);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: PageView.builder(
        controller: controller,
        itemCount: images.length,
        itemBuilder: (context, index) {
          final image = images[index];
          return Center(
            child: Hero(
              tag: image,
              child:
                  isAssetImage(image)
                      ? Image.asset(
                        image,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          print('Asset load error for $image: $error');
                          return const Icon(
                            Icons.broken_image,
                            color: Colors.white54,
                            size: 50,
                          );
                        },
                      )
                      : CachedNetworkImage(
                        imageUrl: image,
                        fit: BoxFit.contain,
                        placeholder:
                            (context, url) => const SpinKitFadingCircle(
                              color: Colors.white54,
                              size: 50.0,
                            ),
                        errorWidget: (context, url, error) {
                          print('Network image load error for $url: $error');
                          return const Icon(
                            Icons.broken_image,
                            color: Colors.white54,
                            size: 50,
                          );
                        },
                      ),
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final PageController _pageController = PageController();
  String? _selectedSize;

  void _openFullScreenImage(int initialPage, List<String> images) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder:
            (context, animation, secondaryAnimation) =>
                FullScreenImageViewer(images: images, initialPage: initialPage),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));

    final List<String> images = [];
    if (widget.product.containsKey('images') &&
        widget.product['images'] is List &&
        (widget.product['images'] as List).isNotEmpty) {
      images.addAll(List<String>.from(widget.product['images']));
    } else if (widget.product.containsKey('image') &&
        widget.product['image'] != null) {
      images.add(widget.product['image'] as String);
    } else {
      images.add('assets/images/placeholder.png');
    }

    // Debug image list
    print('Images: $images');

    final wishlist = context.watch<WishlistProvider>();
    final isInWishlist = wishlist.isInWishlist(widget.product['name']);

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
          iconTheme: const IconThemeData(color: Color(0xFF4A00E0)),
          title: Text(
            widget.product['name'],
            style: TextStyle(
              color: const Color(0xFF4A00E0),
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
            ),
          ),
          actions: [
            IconButton(
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Icon(
                  isInWishlist ? Icons.favorite : Icons.favorite_border,
                  key: ValueKey<bool>(isInWishlist),
                  color: isInWishlist ? Colors.redAccent : Colors.grey,
                  size: 28.sp,
                ),
              ),
              onPressed: () {
                wishlist.toggleWishlist(widget.product);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Row(
                      children: [
                        Icon(
                          isInWishlist ? Icons.remove_circle : Icons.favorite,
                          color: Colors.white,
                          size: 20.sp,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          '${widget.product['name']} ${isInWishlist ? 'removed from' : 'added to'} wishlist',
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
              // Image carousel
              Container(
                height: 360.h,
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
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    PageView.builder(
                      controller: _pageController,
                      itemCount: images.length,
                      onPageChanged: (index) => setState(() {}),
                      itemBuilder: (context, index) {
                        final image = images[index];
                        return GestureDetector(
                          onTap: () => _openFullScreenImage(index, images),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 20.h,
                            ),
                            child: Hero(
                              tag: image,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.r),
                                  child:
                                      isAssetImage(image)
                                          ? Image.asset(
                                            image,
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            errorBuilder: (
                                              context,
                                              error,
                                              stackTrace,
                                            ) {
                                              print(
                                                'Asset load error for $image: $error',
                                              );
                                              return const Icon(
                                                Icons.broken_image,
                                                color: Colors.grey,
                                                size: 50,
                                              );
                                            },
                                          )
                                          : CachedNetworkImage(
                                            imageUrl: image,
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            placeholder:
                                                (context, url) =>
                                                    const SpinKitFadingCircle(
                                                      color: Color(0xFF4A00E0),
                                                      size: 50.0,
                                                    ),
                                            errorWidget: (context, url, error) {
                                              print(
                                                'Network image load error for $url: $error',
                                              );
                                              return const Icon(
                                                Icons.broken_image,
                                                color: Colors.grey,
                                                size: 50,
                                              );
                                            },
                                          ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Positioned(
                      bottom: 20.h,
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: images.length,
                        effect: ExpandingDotsEffect(
                          activeDotColor: const Color(0xFF4A00E0),
                          dotColor: Colors.grey.shade300,
                          dotHeight: 8.h,
                          dotWidth: 8.w,
                          expansionFactor: 3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Product details
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product['name'],
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF4A00E0),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      '₹${widget.product['price']}',
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF4A00E0).withOpacity(0.9),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter pincode',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 16.sp,
                        ),
                        prefixIcon: const Icon(
                          Icons.location_pin,
                          color: Color(0xFF4A00E0),
                        ),
                        filled: true,
                        fillColor: const Color(0xFF4A00E0).withOpacity(0.05),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 14.h,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(
                            color: const Color(0xFF4A00E0).withOpacity(0.2),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: const BorderSide(
                            color: Color(0xFF4A00E0),
                            width: 1.5,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      'Select Size',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF4A00E0),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Wrap(
                      spacing: 10.w,
                      children:
                          ['S', 'M', 'L', 'XL', 'XXL'].map((size) {
                            final bool isSelected = _selectedSize == size;
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              child: ChoiceChip(
                                label: Text(
                                  size,
                                  style: TextStyle(
                                    color:
                                        isSelected
                                            ? Colors.white
                                            : const Color(0xFF4A00E0),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                selected: isSelected,
                                onSelected: (selected) {
                                  setState(() {
                                    _selectedSize = selected ? size : null;
                                  });
                                },
                                selectedColor: const Color(0xFF4A00E0),
                                backgroundColor: const Color(
                                  0xFF4A00E0,
                                ).withOpacity(0.1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.r),
                                ),
                                labelPadding: EdgeInsets.symmetric(
                                  horizontal: 11.w,
                                  vertical: 4.h,
                                ),
                                elevation: isSelected ? 4 : 0,
                                shadowColor: const Color(
                                  0xFF4A00E0,
                                ).withOpacity(0.3),
                              ),
                            );
                          }).toList(),
                    ),
                    SizedBox(height: 30.h),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Highlights',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF4A00E0),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          _buildHighlightRow(
                            icon: Icons.check_circle,
                            text: '100% original products',
                          ),
                          SizedBox(height: 8.h),
                          _buildHighlightRow(
                            icon: Icons.local_shipping,
                            text: 'Free delivery available',
                          ),
                          SizedBox(height: 8.h),
                          _buildHighlightRow(
                            icon: Icons.refresh,
                            text: 'Easy 30-day return policy',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Text(
                      'Product Description',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF4A00E0),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      widget.product['description'] ??
                          'This is a detailed description of the product including specs, build quality, and usage.',
                      style: TextStyle(
                        fontSize: 16.sp,
                        height: 1.5,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    SizedBox(height: 80.h),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          padding: EdgeInsets.all(16.w),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTapDown: (_) => Feedback.forTap(context),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      context.read<CartProvider>().addItem(widget.product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Row(
                            children: [
                              const Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                                size: 20,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                '${widget.product['name']} added to cart',
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
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      elevation: 2,
                    ),
                    icon: Icon(Icons.add_shopping_cart, size: 20.sp),
                    label: Text(
                      'Add to Cart',
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: GestureDetector(
                  onTapDown: (_) => Feedback.forTap(context),
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
                      backgroundColor: const Color(0xFFFF8C00),
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      elevation: 2,
                    ),
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHighlightRow({required IconData icon, required String text}) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF4A00E0), size: 20.sp),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 16.sp, color: Colors.grey.shade800),
          ),
        ),
      ],
    );
  }
}
