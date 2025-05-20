import 'package:flutter/material.dart';

class WishlistProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _wishlistItems = [];

  List<Map<String, dynamic>> get items => _wishlistItems;

  void toggleWishlist(Map<String, dynamic> product) {
    final index = _wishlistItems.indexWhere(
      (item) => item['name'] == product['name'],
    );
    if (index >= 0) {
      _wishlistItems.removeAt(index);
    } else {
      _wishlistItems.add({...product});
    }
    notifyListeners();
  }

  bool isInWishlist(String productName) {
    return _wishlistItems.any((item) => item['name'] == productName);
  }
}
