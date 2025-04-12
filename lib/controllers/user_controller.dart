import 'package:flutter/material.dart';

class UserController extends ChangeNotifier {
  final Map<String, String> _users = {};

  void registerUser(String name, String email, String password) {
    _users[email] = password;
    notifyListeners();
  }

  bool validateUser(String email, String password) {
    return _users[email] == password;
  }
}
