import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexkartt/data/orders_data.dart';
import 'package:nexkartt/providers/adress_provider.dart';
import 'package:provider/provider.dart';
import 'package:nexkartt/models/adrees.dart';

enum PaymentMethod { cod, upi, card, wallet, netBanking }

String paymentMethodToString(PaymentMethod method) {
  switch (method) {
    case PaymentMethod.cod:
      return 'Cash on Delivery';
    case PaymentMethod.upi:
      return 'UPI';
    case PaymentMethod.card:
      return 'Credit/Debit Card';
    case PaymentMethod.wallet:
      return 'Wallet';
    case PaymentMethod.netBanking:
      return 'Net Banking';
  }
}

class OrderSummaryScreen extends StatefulWidget {
  final Map<String, dynamic> product;

  const OrderSummaryScreen({super.key, required this.product});

  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  Address? selectedAddress;
  PaymentMethod? selectedPaymentMethod;

  void _selectAddress(BuildContext context) async {
    final result = await Navigator.push<Address>(
      context,
      MaterialPageRoute(builder: (_) => const _AddressSelectionScreen()),
    );

    if (result != null && mounted) {
      setState(() {
        selectedAddress = result;
      });
    }
  }

  void _selectPaymentMethod(BuildContext context) async {
    final result = await Navigator.push<PaymentMethod>(
      context,
      MaterialPageRoute(builder: (_) => const PaymentMethodSelectionScreen()),
    );

    if (result != null && mounted) {
      setState(() {
        selectedPaymentMethod = result;
      });
    }
  }

  void _confirmOrder(BuildContext context) {
    if (selectedAddress == null || selectedPaymentMethod == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.error, color: Colors.white, size: 20.sp),
              SizedBox(width: 6.w),
              Text(
                'Please select address and payment method',
                style: TextStyle(fontSize: 14.sp),
              ),
            ],
          ),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          margin: EdgeInsets.all(10.w),
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(
              'Confirm Order',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
            ),
            content: Text(
              'Are you sure you want to place this order?',
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
                  final newOrder = {
                    'image': widget.product['image'],
                    'name': widget.product['name'],
                    'price': widget.product['price'],
                    'status': 'Processing',
                    'date': DateTime.now().toString().substring(0, 10),
                    'address': selectedAddress!.toJson(),
                    'paymentMethod': paymentMethodToString(
                      selectedPaymentMethod!,
                    ),
                  };

                  orderList.add(newOrder);

                  Navigator.pop(context);
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
                            'Order confirmed!',
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

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => YourOrdersScreen(orders: orderList),
                    ),
                  );
                },
                child: Text(
                  'Confirm',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFF4A00E0),
                  ),
                ),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    final product = widget.product;

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
            'Order Summary',
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
        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: ListView(
            children: [
              Text(
                'Product Details',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade800,
                ),
              ),
              SizedBox(height: 12.h),
              AnimatedOpacity(
                opacity: 1.0,
                duration: const Duration(milliseconds: 300),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  elevation: 3,
                  shadowColor: Colors.black.withOpacity(0.1),
                  child: Padding(
                    padding: EdgeInsets.all(12.w),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child:
                              product['image'].startsWith('assets/')
                                  ? Image.asset(
                                    product['image'],
                                    width: 80.w,
                                    height: 80.h,
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
                                    width: 80.w,
                                    height: 80.h,
                                    fit: BoxFit.cover,
                                    placeholder:
                                        (context, url) => _imagePlaceholder(),
                                    errorWidget: (context, url, error) {
                                      print(
                                        'Network image load error for $url: $error',
                                      );
                                      return _imageErrorWidget();
                                    },
                                  ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product['name'],
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.shade800,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 6.h),
                              Text(
                                '₹${product['price']}',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF4A00E0),
                                ),
                              ),
                              SizedBox(height: 6.h),
                              Row(
                                children: [
                                  Icon(
                                    Icons.local_shipping,
                                    size: 16.sp,
                                    color: Colors.green,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    '1 Day Delivery',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),

              // Payment Method Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Payment Method',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  TextButton(
                    onPressed: () => _selectPaymentMethod(context),
                    child: Text(
                      selectedPaymentMethod == null ? 'Select' : 'Change',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xFF4A00E0),
                      ),
                    ),
                  ),
                ],
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Card(
                  key: ValueKey(selectedPaymentMethod),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  elevation: 3,
                  shadowColor: Colors.black.withOpacity(0.1),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF4A00E0).withOpacity(0.05),
                          Colors.white,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    padding: EdgeInsets.all(12.w),
                    child: Row(
                      children: [
                        Icon(
                          Icons.payment,
                          color: const Color(0xFF4A00E0),
                          size: 24.sp,
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Text(
                            selectedPaymentMethod == null
                                ? 'No payment method selected. Tap to choose.'
                                : paymentMethodToString(selectedPaymentMethod!),
                            style: TextStyle(
                              fontSize: 14.sp,
                              color:
                                  selectedPaymentMethod == null
                                      ? Colors.grey.shade600
                                      : Colors.grey.shade800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),

              // Address Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Shipping Address',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  TextButton(
                    onPressed: () => _selectAddress(context),
                    child: Text(
                      selectedAddress == null ? 'Select' : 'Change',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xFF4A00E0),
                      ),
                    ),
                  ),
                ],
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Card(
                  key: ValueKey(selectedAddress),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  elevation: 3,
                  shadowColor: Colors.black.withOpacity(0.1),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF4A00E0).withOpacity(0.05),
                          Colors.white,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    padding: EdgeInsets.all(12.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: const Color(0xFF4A00E0),
                          size: 24.sp,
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Text(
                            selectedAddress == null
                                ? 'No address selected. Tap to choose.'
                                : '${selectedAddress!.name}\n'
                                    '${selectedAddress!.phone}\n'
                                    '${selectedAddress!.street}, ${selectedAddress!.city}, ${selectedAddress!.state} - ${selectedAddress!.pincode}',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color:
                                  selectedAddress == null
                                      ? Colors.grey.shade600
                                      : Colors.grey.shade800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 36.h),

              GestureDetector(
                onTapDown: (_) => Feedback.forTap(context),
                child: ElevatedButton(
                  onPressed: () => _confirmOrder(context),
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
                    'Confirm Your Order',
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

// -------------------- Address Selection Screen --------------------
class _AddressSelectionScreen extends StatelessWidget {
  const _AddressSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    final addressProvider = context.watch<AddressProvider>();
    final addresses = addressProvider.addresses;

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
            'Select Address',
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
            addresses.isEmpty
                ? _EmptyAddresses()
                : ListView.builder(
                  padding: EdgeInsets.all(16.w),
                  itemCount: addresses.length,
                  itemBuilder: (context, index) {
                    final address = addresses[index];
                    return AnimatedOpacity(
                      opacity: 1.0,
                      duration: Duration(milliseconds: 300 + index * 100),
                      child: _AddressCard(address: address),
                    );
                  },
                ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF4A00E0),
          onPressed: () async {
            final newAddress = await Navigator.push<Address>(
              context,
              MaterialPageRoute(builder: (_) => const AddAddressScreen()),
            );
            if (newAddress != null && context.mounted) {
              addressProvider.addAddress(newAddress);
            }
          },
          child: AnimatedScale(
            scale: 1.0,
            duration: const Duration(milliseconds: 200),
            child: Icon(Icons.add, size: 24.sp, color: Colors.white),
          ),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
      ),
    );
  }
}

// -------------------- Empty Addresses Widget --------------------
class _EmptyAddresses extends StatelessWidget {
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
              Icons.location_on_outlined,
              size: 100.sp,
              color: Colors.grey.shade400,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'No saved addresses 📍',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade600,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Add an address to proceed with checkout!',
            style: TextStyle(fontSize: 16.sp, color: Colors.grey.shade500),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.h),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/add-address');
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
              'Add Address',
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

// -------------------- Address Card Widget --------------------
class _AddressCard extends StatelessWidget {
  final Address address;

  const _AddressCard({required this.address});

  @override
  Widget build(BuildContext context) {
    final addressProvider = context.read<AddressProvider>();

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      elevation: 3,
      shadowColor: Colors.black.withOpacity(0.1),
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: InkWell(
        borderRadius: BorderRadius.circular(12.r),
        onTap: () => Navigator.pop(context, address),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on,
                color: const Color(0xFF4A00E0),
                size: 24.sp,
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      address.name,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '${address.street}, ${address.city}, ${address.state}, ${address.pincode}',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey.shade600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Phone: ${address.phone}',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.delete, color: Colors.red, size: 24.sp),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder:
                        (context) => AlertDialog(
                          title: Text(
                            'Delete Address',
                            style: TextStyle(fontSize: 18.sp),
                          ),
                          content: Text(
                            'Are you sure you want to delete this address?',
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
                                addressProvider.removeAddress(address.id);
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
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
                                          'Address deleted',
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
                              child: Text(
                                'Delete',
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
        ),
      ),
    );
  }
}

// -------------------- Payment Method Selection Screen --------------------
class PaymentMethodSelectionScreen extends StatelessWidget {
  const PaymentMethodSelectionScreen({super.key});

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
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Select Payment Method',
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
        body: ListView(
          padding: EdgeInsets.all(16.w),
          children:
              PaymentMethod.values.map((method) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  elevation: 3,
                  shadowColor: Colors.black.withOpacity(0.1),
                  margin: EdgeInsets.symmetric(vertical: 8.h),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12.r),
                    onTap: () => Navigator.pop(context, method),
                    child: Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Row(
                        children: [
                          Icon(
                            _getPaymentIcon(method),
                            color: const Color(0xFF4A00E0),
                            size: 24.sp,
                          ),
                          SizedBox(width: 12.w),
                          Text(
                            paymentMethodToString(method),
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }

  IconData _getPaymentIcon(PaymentMethod method) {
    switch (method) {
      case PaymentMethod.cod:
        return Icons.money;
      case PaymentMethod.upi:
        return Icons.qr_code;
      case PaymentMethod.card:
        return Icons.credit_card;
      case PaymentMethod.wallet:
        return Icons.account_balance_wallet;
      case PaymentMethod.netBanking:
        return Icons.account_balance;
    }
  }
}

// -------------------- Your Orders Screen --------------------
class YourOrdersScreen extends StatelessWidget {
  final List<Map<String, dynamic>> orders;

  const YourOrdersScreen({super.key, required this.orders});

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
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Your Orders',
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
            orders.isEmpty
                ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.receipt_long_outlined,
                        size: 100.sp,
                        color: Colors.grey.shade400,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'No orders yet',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Place an order to see it here!',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                )
                : ListView.builder(
                  padding: EdgeInsets.all(16.w),
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    final order = orders[index];
                    return AnimatedOpacity(
                      opacity: 1.0,
                      duration: Duration(milliseconds: 300 + index * 100),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        elevation: 3,
                        shadowColor: Colors.black.withOpacity(0.1),
                        margin: EdgeInsets.symmetric(vertical: 8.h),
                        child: Padding(
                          padding: EdgeInsets.all(16.w),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.r),
                                child:
                                    order['image'].startsWith('assets/')
                                        ? Image.asset(
                                          order['image'],
                                          width: 60.w,
                                          height: 60.h,
                                          fit: BoxFit.cover,
                                          errorBuilder: (
                                            context,
                                            error,
                                            stackTrace,
                                          ) {
                                            return _imageErrorWidget();
                                          },
                                        )
                                        : CachedNetworkImage(
                                          imageUrl: order['image'],
                                          width: 60.w,
                                          height: 60.h,
                                          fit: BoxFit.cover,
                                          placeholder:
                                              (context, url) =>
                                                  _imagePlaceholder(),
                                          errorWidget: (context, url, error) {
                                            return _imageErrorWidget();
                                          },
                                        ),
                              ),
                              SizedBox(width: 12.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      order['name'] ?? '',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey.shade800,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      '₹${order['price']} - ${order['status']}',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      'Ordered on ${order['date']}',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
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

// -------------------- Placeholder for AddAddressScreen --------------------
class AddAddressScreen extends StatelessWidget {
  final Address? existingAddress;

  const AddAddressScreen({super.key, this.existingAddress});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(existingAddress == null ? 'Add Address' : 'Edit Address'),
      ),
      body: const Center(child: Text('Implement address form here')),
    );
  }
}
