// lib/providers/user_provider.dart
import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  String _name = 'John Doe';
  String _email = 'john.doe@example.com';
  String _phone = '9876543210';

  String get name => _name;
  String get email => _email;
  String get phone => _phone;

  void updateUser({String? name, String? email, String? phone}) {
    if (name != null) _name = name;
    if (email != null) _email = email;
    if (phone != null) _phone = phone;
    notifyListeners();
  }
}
