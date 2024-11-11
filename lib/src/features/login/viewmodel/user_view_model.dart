import 'package:fit_master/src/features/login/services/auth.service.dart';
import 'package:flutter/material.dart';

class UserViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();

  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void checkLoginState() async {
    _isLoggedIn = await _authService.checkLoginState();
    notifyListeners();
  }

  Future<void> login() async {
    _isLoggedIn = true;
    notifyListeners();
  }

  Future<void> logout() async {
    _isLoggedIn = false;
    notifyListeners();
  }
}
