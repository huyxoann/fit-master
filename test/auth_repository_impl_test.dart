// import 'auth_repository_impl_test.mocks.dart';

import 'package:fit_master/src/core/constants/app_info.dart';
import 'package:fit_master/src/core/network/BaseApiService.dart';
import 'package:fit_master/src/features/login/repository/auth_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'auth_repository_impl_test.mocks.dart';

@GenerateMocks([BaseApisService])
void main() {
  late MockBaseApisService mockApiService;
  late AuthRepositoryImpl authRepository;

  setUp(() {
    mockApiService = MockBaseApisService();
    authRepository = AuthRepositoryImpl();
    // authRepository.networkApiService = mockApiService;
  });

  group('register', () {
    test('should return true when registration is successful', () async {
      // Arrange
      const username = 'huyxoann';
      const password = '123456';
      final response = {
        "message": "Registered successfully",
        "status": 201,
        "metadata": {
          "user_id": 5,
          "access_token":
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjUsInV1aWQiOiJmYmZkMjdmYS0zNDEwLTQyNWQtYTM3MC01YTNkYzAxYWNlMjEiLCJpYXQiOjE3MzQ4MDA4OTQsImV4cCI6MTczNDgxMTY5NH0.ugKdVTYh2_HhNqsWXsaaGzcfcOiG833EbCeV3t73f5I"
        }
      };

      when(mockApiService.postApiResponse(AppInfo.registerEndPoint, any, null))
          .thenAnswer((_) async => response);

      // Act
      final result = await authRepository.register(username, password);

      // Assert
      expect(result, true);

      verifyNever(mockApiService.postApiResponse(
        AppInfo.registerEndPoint,
        {
          'username': username,
          'password': password,
          'fullname': 'Nguyen Van A',
          'email': 'example@gmail.com'
        },
        null,
      )).called(1);
    });

    test('should return false when registration fails', () async {
      // Arrange
      const username = 'testuser';
      const password = 'testpassword';
      final response = {
        'status': 400,
      };

      when(mockApiService.postApiResponse(
        AppInfo.registerEndPoint,
        any,
        null,
      )).thenAnswer((_) async => response);

      // Act
      final result = await authRepository.register(username, password);

      // Assert
      expect(result, false);
      verify(mockApiService.postApiResponse(
        AppInfo.registerEndPoint,
        {
          'username': username,
          'password': password,
          'fullname': 'Nguyen Van A',
          'email': 'example@gmail.com'
        },
        null,
      )).called(1);
    });

    test('should return false when an exception is thrown', () async {
      // Arrange
      const username = 'testuser';
      const password = 'testpassword';

      when(mockApiService.postApiResponse(
        AppInfo.registerEndPoint,
        any,
        null,
      )).thenThrow(Exception('Failed to register'));

      // Act
      final result = await authRepository.register(username, password);

      // Assert
      expect(result, false);
      verify(mockApiService.postApiResponse(
        AppInfo.registerEndPoint,
        {
          'username': username,
          'password': password,
          'fullname': 'Nguyen Van A',
          'email': 'example@gmail.com'
        },
        null,
      )).called(1);
    });
  });
}
