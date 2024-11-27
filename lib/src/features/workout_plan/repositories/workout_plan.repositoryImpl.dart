import 'package:fit_master/src/config/logger/logger.dart';
import 'package:fit_master/src/core/constants/app_info.dart';
import 'package:fit_master/src/core/network/BaseApiService.dart';
import 'package:fit_master/src/core/network/NetworkApiService.dart';
import 'package:fit_master/src/features/plan/model/workout_plan.dart';
import 'package:fit_master/src/features/workout_plan/models/workout_card.dart';
import 'package:fit_master/src/features/workout_plan/repositories/workout_plan.repository.dart';

class WorkoutPlanRepositoryImpl extends WorkoutPlanRepository {
  final BaseApisService _networkApiService = NetworkApiService();

  @override
  Future<List<WorkoutPlan>> fetchListWorkoutPlan(String token) {
    throw UnimplementedError();
  }

  @override
  Future<WorkoutCard?> fetchWorkoutCard(String token, String id) async {
    try {
      final response = await _networkApiService.getApiResponse(
          '${AppInfo.getWorkoutPlanInfoForCard}/$id', null);

      if (response != null && response is Map<String, dynamic>) {
        // logger.d("At fetchWorkoutCard: $response");
        return WorkoutCard.fromJson(response);
      } else {
        return null;
      }
    } catch (e) {
      // Handle error
    } finally {}
    return null;
  }

  @override
  Future<WorkoutPlan?> fetchWorkoutPlanDetail(String token, String id) async {
    try {
      final response = await _networkApiService.getApiResponse(
        '${AppInfo.baseUrl}/workouts/get/$id',
        null,
        params: {'id': id},
      );

      logger.d("At fetchWorkoutPlanDetail: $response");
      logger
          .i("At fetchWorkoutPlanDetail: ${AppInfo.baseUrl}/workouts/get/$id'");
      if (response != null && response is Map<String, dynamic>) {
        logger.d("At fetchWorkoutPlanDetail: $response");
        return WorkoutPlan.fromJson(response);
      } else {
        return null;
      }
    } catch (e) {}
    return null;
  }

  @override
  Future<WorkoutPlan?> fetchRecommendedWorkoutPlan(
      int gender, int fitnessGoal, int age, double bmi) async {
    try {
      final response = await _networkApiService.postApiResponse(
        AppInfo.pythonUrl,
        {"gender": gender, "fitnessGoal": fitnessGoal, "age": age, "bmi": bmi},
        null,
      );
      logger.d("At fetchRecommendedWorkoutPlan: $response");
      if (response is Map<String, dynamic>) {
        int recommendedWorkoutPlanId = response['predictions'];
        logger.d("At fetchRecommendedWorkoutPlan: $recommendedWorkoutPlanId");
        return await fetchWorkoutPlanDetail(
            "", recommendedWorkoutPlanId.toString());
      }
    } catch (e) {
      logger.e("Error in fetchRecommendedWorkoutPlan: $e");
    }
    return null;
  }
}
