import 'package:fit_master/src/features/login/repository/auth_repository.dart';
import 'package:fit_master/src/features/login/services/auth.service.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;
  final AuthService _authService;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isLoggedIn = false;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  AuthViewModel(
      {required AuthRepository authRepository,
      required AuthService authService})
      : _authRepository = authRepository,
        _authService = authService;
  bool get isLoggedIn => _isLoggedIn;

  Future<void> login(String username, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      _isLoggedIn = await _authRepository.login(username, password);
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _isLoggedIn = false;
    notifyListeners();
  }
}
