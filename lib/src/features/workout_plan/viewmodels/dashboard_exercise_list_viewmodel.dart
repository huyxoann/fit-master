import 'package:fit_master/src/core/exception/response/api_response.dart';
import 'package:fit_master/src/features/exercise/data/res/res.exercise.dart';
import 'package:fit_master/src/features/exercise/repositories/exercise.repo.dart';
import 'package:flutter/material.dart';

class DashboardExerciseListViewmodel extends ChangeNotifier {
  final ExerciseRepository _exerciseRepository;

  DashboardExerciseListViewmodel(
      {required ExerciseRepository exerciseRepository})
      : _exerciseRepository = exerciseRepository;

  ApiResponse<GetListExerciseResponse> _exercises = ApiResponse.loading();
  ApiResponse<GetListExerciseResponse> get exercises => _exercises;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> fetchExerciseWithLevel(int experienceLevel) async {
    _isLoading = true;
    notifyListeners();

    try {
      GetListExerciseResponse response =
          await _exerciseRepository.fetchExercisesWithLevel(
              experienceLevel: experienceLevel, offset: 0, limit: 8);
      _exercises = ApiResponse.completed(response);
    } catch (e) {
      _exercises = ApiResponse.error(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
