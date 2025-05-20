import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nexkartt/providers/adress_provider.dart';
import 'package:nexkartt/providers/cart_provider.dart';
import 'package:nexkartt/providers/user_provider.dart';
import 'package:nexkartt/providers/wishlist_provider.dart';
import 'package:nexkartt/screens/product_details_screen.dart';
import 'package:nexkartt/screens/profile/account_screen.dart';
import 'package:nexkartt/screens/profile/addaddress.dart';
import 'package:nexkartt/screens/profile/adress_management.dart';
import 'package:nexkartt/screens/profile/edit_profile.dart';
import 'package:nexkartt/screens/profile/order_history.dart';
import 'package:nexkartt/screens/profile/profile_screen.dart';
import 'package:nexkartt/screens/search/search_list.dart';
import 'package:nexkartt/screens/onboarding_screen.dart';
import 'package:nexkartt/screens/auth/login_screen.dart';
// import product details screen

import 'screens/home/home_screen.dart';
import 'screens/wishlist/wishlist_screen.dart';
import 'screens/cart/cart_screen.dart' as cart;

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => WishlistProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => AddressProvider()),

        // add other providers here
      ],
      child: const MyApp(),
    ),
  );
}

// Example product list for passing to SearchScreen
final List<Map<String, dynamic>> allProductsList = [
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
  // Add all your products here...
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NexKart',
      theme: ThemeData(primarySwatch: Colors.deepPurple, useMaterial3: true),
      home: OnboardingScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/account': (context) => const AccountScreen(),
        '/edit-profile': (context) => const EditProfileScreen(),
        '/addresses': (context) => const SavedAddressesScreen(),
        '/order-history': (context) => const YourOrdersScreen(),
        '/cart': (context) => const cart.CartScreen(),
        '/add-address': (_) => const AddAddressScreen(),
        '/search': (context) => SearchScreen(allProducts: allProductsList),
        '/product_details': (context) {
          final product =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, dynamic>;
          return ProductDetailsScreen(product: product);
        },
        // Add other named routes here
      },
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  // Pass the onSearchPressed callback to HomeScreen to handle navigation
  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      HomeScreen(
        onSearchPressed: () {
          Navigator.pushNamed(context, '/search');
        },
      ),
      const WishlistScreen(),
      const cart.CartScreen(),
      const ProfileSettingsScreen(),
    ];

    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            label: 'Wishlist',
          ),
          NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
