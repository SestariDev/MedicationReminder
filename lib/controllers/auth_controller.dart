import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  String? _loggedInUser;

  String? get loggedInUser => _loggedInUser;

  final String _mockEmail = 'user';
  final String _mockPassword = '123';

  bool login(String email, String password) {
    if (email == _mockEmail && password == _mockPassword) {
      _loggedInUser = email;
      notifyListeners();
      return true;
    }
    return false;
  }

  void logout() {
    _loggedInUser = null;
    notifyListeners();
  }
}
