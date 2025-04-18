import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  String _username = '';
  String _password = '';

  String get username => _username;
  String get password => _password;

  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  bool login() {
    return _username == 'user' && _password == '123';
  }
}
