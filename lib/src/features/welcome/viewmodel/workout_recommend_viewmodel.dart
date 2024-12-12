import 'package:fit_master/src/config/logger/logger.dart';
import 'package:fit_master/src/features/plan/model/workout_plan.dart';
import 'package:fit_master/src/features/workout_plan/repositories/workout_plan.repository.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

class WorkoutRecommendViewmodel extends ChangeNotifier {
  final WorkoutPlanRepository workoutPlanRepository;

  WorkoutRecommendViewmodel({required this.workoutPlanRepository});

  WorkoutPlan? _recommendedWorkoutPlan;
  List<WorkoutPlan>? _otherWorkoutPlans;
  bool _isLoading = false;

  WorkoutPlan? get recommendedWorkoutPlan => _recommendedWorkoutPlan;
  List<WorkoutPlan>? get otherWorkoutPlans => _otherWorkoutPlans;
  bool get isLoading => _isLoading;

  Future<void> fetchRecommendedWorkoutPlan(
      int gender, int fitnessGoal, int age, double bmi) async {
    _isLoading = true;
    notifyListeners();

    try {
      _recommendedWorkoutPlan = await workoutPlanRepository
          .fetchRecommendedWorkoutPlan(gender, fitnessGoal, age, bmi);
    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchListWorkoutPlan(String token) async {
    final boxe = await Hive.openBox('userDataBox');
    int fitnessGoal = boxe.get('fitnessGoal') ?? 0;
    logger.e("At workout plan: $fitnessGoal");

    _isLoading = true;
    notifyListeners();

    try {
      _otherWorkoutPlans =
          await workoutPlanRepository.fetchListWorkoutPlan(token, fitnessGoal);
      logger.d("At workout plan: ${_otherWorkoutPlans.toString()}");
    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
