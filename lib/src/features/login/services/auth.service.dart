import 'package:hive/hive.dart';

class AuthService {
  Future<bool> checkLoginState() async {
    var box = Hive.box('userDataBox');
    if (box.get('isLoggedIn') == null) {
      return false;
    }
    return true;
  }
}
