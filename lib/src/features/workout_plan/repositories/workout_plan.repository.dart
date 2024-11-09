import 'package:fit_master/src/features/workout_plan/models/workout_plan.dart';

abstract class WorkoutPlanRepository {
  Future<List<WorkoutPlan>> fetchListWorkoutPlan(String token);
  Future<WorkoutPlan> fetchWorkoutPlanDetail(String token, String id);
}
