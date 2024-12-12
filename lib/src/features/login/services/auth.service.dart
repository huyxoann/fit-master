import 'package:fit_master/src/config/logger/logger.dart';
import 'package:fit_master/src/core/utils/check_token_expiration.dart';
import 'package:fit_master/src/features/login/repository/auth_repository_impl.dart';
import 'package:hive/hive.dart';

class AuthService {
  final AuthRepositoryImpl _authRepository = AuthRepositoryImpl();
  Future<bool> checkLoginState() async {
    var box = Hive.box('userDataBox');
    var token = box.get('token');
    if (token != null && isTokenExpired(token)) {
      await deleteUserData();
      return false;
    }
    return true;
  }

  Future<void> saveUserData(
    String username,
    String password,
    String? token,
    int userId,
  ) async {
    var box = Hive.box('userDataBox');
    await box.put('isLoggedIn', true);
    await box.put('token', token);
    await box.put('username', username);
    await box.put('password', password);
    await box.put('userId', userId);

    // Log the data to confirm it was added successfully
    logger
        .d('AuthService: saveUserData: $username, $password, $token, $userId');
  }

  Future<void> deleteUserData() async {
    var box = Hive.box('userDataBox');
    await box.delete('isLoggedIn');
    await box.delete('token');
    await box.delete('username');
    await box.delete('password');
    await box.delete('userId');

    // Log the data to confirm it was deleted successfully
    logger.d('AuthService: deleteUserData: User data deleted');
  }
}
