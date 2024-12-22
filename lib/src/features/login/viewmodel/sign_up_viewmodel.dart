import 'package:fit_master/src/config/logger/logger.dart';
import 'package:fit_master/src/features/login/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpViewmodel extends ChangeNotifier {
  final AuthRepository _authRepository;

  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  String get email => _email;
  String get password => _password;
  String get confirmPassword => _confirmPassword;

  bool _isLoading = false;

  SignUpViewmodel({required AuthRepository authRepository})
      : _authRepository = authRepository;
  bool get isLoading => _isLoading;

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  void setConfirmPassword(String confirmPassword) {
    _confirmPassword = confirmPassword;
    notifyListeners();
  }

  void signUp(String username, String password, BuildContext context) async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await _authRepository.register(username, password);
      if (response) {
        logger.d("API register successful, response: $response");
      }
      context.pushReplacementNamed('home');
    } catch (e) {
      logger.e(e.toString());
    }
    _isLoading = false;
    notifyListeners();
  }
}
