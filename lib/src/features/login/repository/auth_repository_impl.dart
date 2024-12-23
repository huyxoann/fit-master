import 'package:fit_master/src/config/auth_storage.dart';
import 'package:fit_master/src/config/logger/logger.dart';
import 'package:fit_master/src/core/constants/app_info.dart';
import 'package:fit_master/src/core/exception/app_exception.dart';
import 'package:fit_master/src/core/network/BaseApiService.dart';
import 'package:fit_master/src/core/network/NetworkApiService.dart';
import 'package:fit_master/src/features/login/repository/auth_repository.dart';
import 'package:fit_master/src/features/login/services/auth.service.dart';

class AuthRepositoryImpl extends AuthRepository {
  final BaseApisService _networkApiService = NetworkApiService();
  @override
  Future<bool> login(String username, String password) async {
    try {
      final response = await _networkApiService.postApiResponse(
        AppInfo.loginEndPoint,
        {
          'username': username,
          'password': password,
        },
        null,
      );
      logger.d("API response: $response");
      if (response is AppException) {
        return false;
      }else{
        logger.d("API login successful, response: $response");
        await AuthService().saveUserData(
          username,
          password,
          response['access_token'],
          response['user_id'],
        );
        await AuthStorage().saveToken(response['access_token']);
        return true;
      }

    } catch (e) {
      logger.e("Error during API call: $e");
      return false;
    }
  }

  @override
  Future<bool> register(String username, String password) async {
    try {
      final response = await _networkApiService.postApiResponse(
        AppInfo.registerEndPoint,
        {
          'username': username,
          'password': password,
          'fullname': 'Nguyen Van A',
          'email': 'example@gmail.com'
        },
        null,
      );

      logger.d("API response: $response");

      if (response is AppException) {
        return false;
      } else {}
      logger.d("API registration successful, response: $response");
      await login(username, password);
      return true;
    } catch (e) {
      logger.e(e.toString());
      return false;
    }
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
