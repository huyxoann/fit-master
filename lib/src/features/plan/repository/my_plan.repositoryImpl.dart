import 'package:fit_master/src/config/logger/logger.dart';
import 'package:fit_master/src/core/constants/app_info.dart';
import 'package:fit_master/src/core/network/BaseApiService.dart';
import 'package:fit_master/src/core/network/NetworkApiService.dart';
import 'package:fit_master/src/features/plan/model/my_plan.dart';
import 'package:fit_master/src/features/plan/repository/my_plan.repository.dart';

class MyPlanRepositoryIpml extends MyPlanRepository {
  final BaseApisService _networkApiService = NetworkApiService();

  @override
  Future<MyPlan> fetchMyPlan({
    required int userId,
    required String token,
  }) async {
    try {
      final response = await _networkApiService.getApiResponse(
        '${AppInfo.baseUrl}/workouts/my_plan/$userId',
        token,
        params: {
          'id': userId.toString(),
        },
      );

      if (response != null && response is Map<String, dynamic>) {
        print("API call successful, response: $response");
        logger.d(response);
        return MyPlan.fromJson(response);
      } else {
        throw Exception("API response is null or not a valid JSON");
      }
    } catch (e) {
      print("Error during API call: $e");
      rethrow;
    }
  }
}
