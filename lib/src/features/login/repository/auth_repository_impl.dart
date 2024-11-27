import 'package:fit_master/src/config/auth_storage.dart';
import 'package:fit_master/src/config/logger/logger.dart';
import 'package:fit_master/src/core/constants/app_info.dart';
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

      if (!(response != null) || (response is! Map<String, dynamic>)) {
        // throw Exception("API response is null or not a valid JSON");
        return false;
      }
      if (response['status'] == 401) {
        // throw Exception("Login failed, invalid credentials");
        return false;
      } else {
        logger.d("API call successful, response: $response");
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
      rethrow;
    }
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> register(String username, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
