import 'package:fit_master/src/features/login/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:fit_master/src/features/login/services/auth.service.dart';

class UserViewModel extends ChangeNotifier {
  final AuthService _authService;
  final AuthRepository _authRepository;

  bool _isLoggedIn = false;
  bool _isLoading = false;
  String? _errorMessage;

  UserViewModel(
      {required AuthService authService,
      required AuthRepository authRepository})
      : _authService = authService,
        _authRepository = authRepository;

  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<bool> checkLoginState() async {
    _isLoggedIn = await _authService.checkLoginState();
    notifyListeners();
    return _isLoggedIn;
  }
}
