import 'package:fit_master/src/config/auth_storage.dart';
import 'package:fit_master/src/core/utils/check_token_expiration.dart';
import 'package:fit_master/src/features/login/repository/auth_repository.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;
  final AuthStorage _authStorage = AuthStorage();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isLoggedIn = false;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  AuthViewModel({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;
  bool get isLoggedIn => _isLoggedIn;

  Future<bool> isLoggedInApp() async {
    final token = await _authStorage.getToken();
    if (token == null || token.isEmpty) return false;
    return !isTokenExpired(token);
  }

  Future<void> login(String username, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      _isLoggedIn = await _authRepository.login(username, password);
      _errorMessage = null;
      notifyListeners();
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
