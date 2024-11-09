import 'package:flutter/material.dart';
import 'package:fit_master/src/features/workout_plan/models/workout_plan.dart';
import 'package:fit_master/src/features/workout_plan/repositories/workout_plan.repository.dart';

class WorkoutPlanViewModel extends ChangeNotifier {
  final WorkoutPlanRepository _repository;

  List<WorkoutPlan>? _workoutPlans;
  WorkoutPlan? _workoutPlanDetail;
  bool _isLoading = false;

  WorkoutPlanViewModel({required WorkoutPlanRepository repository})
      : _repository = repository;

  List<WorkoutPlan>? get workoutPlans => _workoutPlans;
  WorkoutPlan? get workoutPlanDetail => _workoutPlanDetail;
  bool get isLoading => _isLoading;

  Future<void> fetchListWorkoutPlan(String token) async {
    _isLoading = true;
    notifyListeners();

    try {
      _workoutPlans = await _repository.fetchListWorkoutPlan(token);
    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchWorkoutPlanDetail(String token, String id) async {
    _isLoading = true;
    notifyListeners();

    try {
      _workoutPlanDetail = await _repository.fetchWorkoutPlanDetail(token, id);
    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
