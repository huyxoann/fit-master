import 'package:fit_master/src/config/auth_storage.dart';
import 'package:fit_master/src/config/logger/logger.dart';
import 'package:fit_master/src/features/plan/model/workout_plan.dart';
import 'package:fit_master/src/features/workout_plan/repositories/workout_plan.repository.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class WorkoutPlanDetailViewmodel extends ChangeNotifier {
  final WorkoutPlanRepository _repository;

  WorkoutPlanDetailViewmodel({required WorkoutPlanRepository repository})
      : _repository = repository;

  WorkoutPlan? _workoutPlanDetail;
  bool _isLoading = false;
  bool _isHavePlan = false;
  bool _changedPlan = false;

  WorkoutPlan? get workoutPlanDetail => _workoutPlanDetail;
  bool get isLoading => _isLoading;
  bool get isHavePlan => _isHavePlan;
  bool get changedPlan => _changedPlan;

  Future<void> fetchWorkoutDetailById(int id) async {
    _isLoading = true;
    notifyListeners();
    try {
      _workoutPlanDetail =
          await _repository.fetchWorkoutPlanDetail('', id.toString());
      logger.d("At workout detail: ${_workoutPlanDetail.toString()}");
    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> chooseThisPlan(int planID) async {
    _isLoading = true;
    notifyListeners();
    try {
      Hive.openBox('userDataBox');
      final token = Hive.box('userDataBox').get('token');
      // AuthStorage authStorage = AuthStorage();
      // final token = await authStorage.getToken();
      logger.d("At chooseThisPlan: $token");
      await _repository.setNewPlan(token, planID);
      _changedPlan = true;
      checkHavePlan();
    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> checkHavePlan() async {
    Hive.openBox('userDataBox');
    final userId = Hive.box('userDataBox').get('userId');
    final token = Hive.box('userDataBox').get('token');
    // AuthStorage authStorage = AuthStorage();
    // final token = await authStorage.getToken();
    logger.d("At checkHavePlan: $token");
    try {
      _isHavePlan = await _repository.checkHavePlan(token, userId);
      notifyListeners();
    } catch (e) {
      // Handle error
    } finally {}
  }
}
