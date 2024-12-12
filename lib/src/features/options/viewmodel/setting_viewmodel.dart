import 'package:fit_master/src/features/login/services/auth.service.dart';
import 'package:flutter/material.dart';

class SettingViewmodel extends ChangeNotifier {
  final AuthService _authService;

  SettingViewmodel({required AuthService authService})
      : _authService = authService;

  void logout() {
    _authService.deleteUserData();
    notifyListeners();
  }
}
