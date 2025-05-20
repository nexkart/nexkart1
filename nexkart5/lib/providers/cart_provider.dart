import 'package:flutter/foundation.dart';

class CartProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  void addItem(Map<String, dynamic> product) {
    final index = _items.indexWhere((item) => item['name'] == product['name']);
    if (index != -1) {
      _items[index]['quantity'] += 1;
    } else {
      _items.add({...product, 'quantity': 1});
    }
    notifyListeners();
  }

  void increaseQuantity(String productName) {
    final index = _items.indexWhere((item) => item['name'] == productName);
    if (index != -1) {
      _items[index]['quantity'] += 1;
      notifyListeners();
    }
  }

  void decreaseQuantity(String productName) {
    final index = _items.indexWhere((item) => item['name'] == productName);
    if (index != -1 && _items[index]['quantity'] > 1) {
      _items[index]['quantity'] -= 1;
    } else {
      _items.removeAt(index);
    }
    notifyListeners();
  }

  void removeItem(String productName) {
    _items.removeWhere((item) => item['name'] == productName);
    notifyListeners();
  }

  double get totalPrice {
    return _items.fold(
      0,
      (sum, item) => sum + (item['price'] * item['quantity']),
    );
  }
}
