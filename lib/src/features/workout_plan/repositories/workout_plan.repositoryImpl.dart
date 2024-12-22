import 'package:fit_master/src/config/logger/logger.dart';
import 'package:fit_master/src/core/constants/app_info.dart';
import 'package:fit_master/src/core/network/BaseApiService.dart';
import 'package:fit_master/src/core/network/NetworkApiService.dart';
import 'package:fit_master/src/features/plan/model/my_plan.dart';
import 'package:fit_master/src/features/plan/model/workout_plan.dart';
import 'package:fit_master/src/features/workout_plan/models/workout_card.dart';
import 'package:fit_master/src/features/workout_plan/repositories/workout_plan.repository.dart';

class WorkoutPlanRepositoryImpl extends WorkoutPlanRepository {
  final BaseApisService _networkApiService = NetworkApiService();

  @override
  Future<List<WorkoutPlan>> fetchListWorkoutPlan(
      String token, int fitnessGoal) async {
    try {
      final response = await _networkApiService.getApiResponse(
        '${AppInfo.baseUrl}/workouts/$fitnessGoal',
        null,
        params: {'fitness_goal': fitnessGoal.toString()},
      );
      logger.d("At fetchWorkoutPlanById: $response");

      if (response != null && response is List) {
        logger.d("At fetchWorkoutPlanById: $response");
        return response.map((plan) => WorkoutPlan.fromJsonList(plan)).toList();
      } else {
        return [];
      }
    } catch (e) {
      logger.e("Error in fetchWorkoutPlanById: $e");
      return [];
    }
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
        AppInfo.getRecommendedWorkoutPlan,
        {"gender": gender, "fitness_goal": fitnessGoal, "age": age, "bmi": bmi},
        null,
      );
      logger.d("At fetchRecommendedWorkoutPlan__: $response");
      if (response is Map<String, dynamic>) {
        logger.e("response: $response");
        int recommendedWorkoutPlanId = response['predicted_plan_id'] ?? 0;
        logger.d("At fetchRecommendedWorkoutPlan: $recommendedWorkoutPlanId");
        return await fetchWorkoutPlanDetail(
            "", recommendedWorkoutPlanId.toString());
      }
    } catch (e) {
      logger.e("Error in fetchRecommendedWorkoutPlan: $e");
    }
    return null;
  }

  @override
  Future<bool> checkHavePlan(String token, int userID) async {
    try {
      logger.d("At checkHavePlan userID: $userID");
      logger.d("At checkHavePlan token: $token");
      final response = await _networkApiService.postApiResponse(
        '${AppInfo.baseUrl}/workouts/check_my_plan_exist',
        {
          'user_id': userID,
        },
        token,
      );
      // if (response != null && response is Map<String, dynamic>) {
      //   return response['status'] == 200;
      // }
      return true;
    } catch (e) {
      logger.e("Error in checkHavePlan: $e");
      return false;
    }
  }

  @override
  Future<MyPlan?> setNewPlan(String token, int planID) async {
    try {
      final response = await _networkApiService.postApiResponse(
        '${AppInfo.baseUrl}/workouts/choose_plan',
        {
          'plan_id': planID,
        },
        token,
      );
      if (response != null && response is Map<String, dynamic>) {
        return MyPlan.fromJson(response);
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
