import 'package:fit_master/src/features/login/repository/auth_repository_impl.dart';
import 'package:hive/hive.dart';

class AuthService {
  AuthRepositoryImpl _authRepository = AuthRepositoryImpl();
  Future<bool> checkLoginState() async {
    var box = Hive.box('userDataBox');
    if (box.get('isLoggedIn') == null) {
      return await _authRepository.login(
          box.get('username'), box.get('password'));
    }
    return true;
  }

  Future<void> saveUserData(
      String username, String password, String? token) async {
    var box = Hive.box('userDataBox');
    await box.put('isLoggedIn', true);
    await box.put('token', token);
    await box.put('username', username);
    await box.put('password', password);
  }
}
