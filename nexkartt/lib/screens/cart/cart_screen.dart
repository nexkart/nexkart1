import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexkartt/screens/home/home_screen.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';
import '../product_details_screen.dart'; // Adjust path as needed

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    final cart = context.watch<CartProvider>();

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
            'Your Cart',
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
            cart.items.isEmpty
                ? _EmptyCart()
                : Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.all(12.w),
                        itemCount: cart.items.length,
                        separatorBuilder: (_, __) => SizedBox(height: 12.h),
                        itemBuilder: (context, index) {
                          final item = cart.items[index];
                          return AnimatedOpacity(
                            opacity: 1.0,
                            duration: Duration(milliseconds: 300 + index * 100),
                            child: _CartItem(item: item),
                          );
                        },
                      ),
                    ),
                    _TotalSection(cart: cart),
                  ],
                ),
      ),
    );
  }
}

// -------------------- Empty Cart Widget --------------------
class _EmptyCart extends StatelessWidget {
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
              Icons.shopping_cart_outlined,
              size: 100.sp,
              color: Colors.grey.shade400,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'Your cart is empty 🛒',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade600,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Add some products to your cart!',
            style: TextStyle(fontSize: 16.sp, color: Colors.grey.shade500),
          ),
          SizedBox(height: 24.h),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => HomeScreen(
                        onSearchPressed: () {
                          // Provide your search logic here or leave empty if not needed
                        },
                      ), // Adjust path as needed
                ),
              ); // Navigate back to home or products
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

// -------------------- Cart Item Widget --------------------
class _CartItem extends StatelessWidget {
  final Map<String, dynamic> item;

  const _CartItem({required this.item});

  @override
  Widget build(BuildContext context) {
    final cart = context.read<CartProvider>();

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(product: item),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child:
                    item['image'].startsWith('assets/')
                        ? Image.asset(
                          item['image'],
                          width: 80.w,
                          height: 80.h,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            print(
                              'Asset load error for ${item['image']}: $error',
                            );
                            return _imageErrorWidget();
                          },
                        )
                        : CachedNetworkImage(
                          imageUrl: item['image'],
                          width: 80.w,
                          height: 80.h,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => _imagePlaceholder(),
                          errorWidget: (context, url, error) {
                            print('Network image load error for $url: $error');
                            return _imageErrorWidget();
                          },
                        ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['name'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '₹${item['price']}',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF4A00E0),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      _QuantityButton(
                        icon: Icons.remove,
                        onPressed: () => cart.decreaseQuantity(item['name']),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          child: Text(
                            '${item['quantity']}',
                            key: ValueKey<int>(item['quantity']),
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      _QuantityButton(
                        icon: Icons.add,
                        onPressed: () => cart.increaseQuantity(item['name']),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 24,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder:
                                (context) => AlertDialog(
                                  title: Text(
                                    'Remove Item',
                                    style: TextStyle(fontSize: 18.sp),
                                  ),
                                  content: Text(
                                    'Are you sure you want to remove ${item['name']} from your cart?',
                                    style: TextStyle(fontSize: 14.sp),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text(
                                        'Cancel',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        cart.removeItem(item['name']);
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Row(
                                              children: [
                                                Icon(
                                                  Icons.delete,
                                                  color: Colors.white,
                                                  size: 20.sp,
                                                ),
                                                SizedBox(width: 8.w),
                                                Text(
                                                  '${item['name']} removed from cart',
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            duration: const Duration(
                                              seconds: 2,
                                            ),
                                            backgroundColor: const Color(
                                              0xFF4A00E0,
                                            ),
                                            behavior: SnackBarBehavior.floating,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.r),
                                            ),
                                            margin: EdgeInsets.all(16.w),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Remove',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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

// -------------------- Quantity Button Widget --------------------
class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _QuantityButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFF4A00E0).withOpacity(0.1),
        ),
        child: Icon(icon, size: 20.sp, color: const Color(0xFF4A00E0)),
      ),
    );
  }
}

// -------------------- Total Section Widget --------------------
class _TotalSection extends StatelessWidget {
  final CartProvider cart;

  const _TotalSection({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, -2),
          ),
        ],
        gradient: LinearGradient(
          colors: [const Color(0xFF4A00E0).withOpacity(0.05), Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Total:',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade800,
                ),
              ),
              const Spacer(),
              Text(
                '₹${cart.totalPrice.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF4A00E0),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          GestureDetector(
            onTapDown: (_) => Feedback.forTap(context),
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.white,
                          size: 20.sp,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'Proceeding to checkout',
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
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: 2,
                minimumSize: Size(double.infinity, 50.h),
              ),
              child: Text(
                'Proceed to Checkout',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
