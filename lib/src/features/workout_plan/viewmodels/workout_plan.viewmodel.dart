import 'package:fit_master/src/config/logger/logger.dart';
import 'package:fit_master/src/features/plan/model/my_plan.dart';
import 'package:fit_master/src/features/plan/model/workout_plan.dart';
import 'package:fit_master/src/features/plan/repository/my_plan.repository.dart';
import 'package:fit_master/src/features/workout_plan/models/workout_card.dart';
import 'package:flutter/material.dart';
import 'package:fit_master/src/features/workout_plan/repositories/workout_plan.repository.dart';
import 'package:hive/hive.dart';

class WorkoutPlanViewModel extends ChangeNotifier {
  final WorkoutPlanRepository _repository;
  final MyPlanRepository _myPlanRepository;

  List<WorkoutPlan>? _workoutPlans;
  WorkoutPlan? _workoutPlanDetail;
  WorkoutCard? _workoutCard;
  bool _isLoading = false;
  MyPlan? _myPlan;

  WorkoutPlanViewModel(
      {required WorkoutPlanRepository repository,
      required MyPlanRepository myPlanRepository})
      : _repository = repository,
        _myPlanRepository = myPlanRepository;

  List<WorkoutPlan>? get workoutPlans => _workoutPlans;
  WorkoutCard? get workoutCard => _workoutCard;
  WorkoutPlan? get workoutPlanDetail => _workoutPlanDetail;
  bool get isLoading => _isLoading;
  MyPlan? get myPlan => _myPlan;

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

  Future<void> fetchWorkoutCard() async {
    _isLoading = true;
    notifyListeners();
    Hive.openBox('userDataBox');
    final token = Hive.box('userDataBox').get('token');

    try {
      _workoutCard = await _repository.fetchWorkoutCard(token, '2');
      logger.d(_workoutCard);
    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

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

  Future<void> fetchMyPlan() async {
    _isLoading = true;
    notifyListeners();
    Hive.openBox('userDataBox');
    final userId = Hive.box('userDataBox').get('userId');
    final token = Hive.box('userDataBox').get('token');
    try {
      _myPlan =
          await _myPlanRepository.fetchMyPlan(userId: userId, token: token);

      logger.d("At my plan: ${_myPlan?.workoutPlan.planId}");
      // _workoutPlanDetail = _repository.f;
    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
