import 'package:fit_master/src/core/network/BaseApiService.dart';
import 'package:fit_master/src/features/exercise/data/req/req.exercise.dart';
import 'package:fit_master/src/features/exercise/data/res/res.exercise.dart';
import 'package:fit_master/src/features/exercise/data/res/res.exercise_detail.dart';
import 'package:flutter/foundation.dart';
import '../../../core/constants/app_info.dart';
import '../../../core/network/NetworkApiService.dart';
import 'exercise.repo.dart';

class ExerciseRepositoryImpl implements ExerciseRepository {
  final BaseApisService _networkApiService = NetworkApiService();

  // Triển khai phương thức fetchExercises từ ExerciseRepository
  @override
  Future<GetListExerciseResponse> fetchExercises({
  required int experienceLevel,
  required int targetMuscle,
  required int offset,
  String? token,
}) async {
  print("Starting API call with experienceLevel=$experienceLevel, targetMuscle=$targetMuscle, offset=$offset");
  try {
    final response = await _networkApiService.getApiResponse(
      AppInfo.getListExerEndPoint,
      token,
      params: {
        'experience_level': experienceLevel.toString(),
        'target_muscle': targetMuscle.toString(),
        'offset': offset.toString(),
      },
    );

    print("API call successful, response: $response");
    return GetListExerciseResponse.fromJson(response);

  } catch (e) {
    print("Error during API call: $e");
    rethrow;
  }
}

  @override
  Future<ExerciseDetailResponse> fetchExerciseDetail({required int exerciseId, String? token})async {
     if (kDebugMode) {
       print("Starting API call with exeID=$exerciseId");
     }
    try {
    final response = await _networkApiService.getApiResponse(
      AppInfo.getExerDetailEndPoint,
      token,
      params: {
        'exercise_id': exerciseId.toString(),
      },
    );

    print("API call successful, response: $response");
    return ExerciseDetailResponse.fromJson(response);

  } catch (e) {
    print("Error during API call: $e");
    rethrow;
  }
  }

}
