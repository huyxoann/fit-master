import 'package:fit_master/src/features/plan/model/workout_plan.dart';
import 'package:fit_master/src/features/workout_plan/models/workout_card.dart';

abstract class WorkoutPlanRepository {
  Future<List<WorkoutPlan>> fetchListWorkoutPlan(String token);
  Future<WorkoutPlan?> fetchWorkoutPlanDetail(String token, String id);

  Future<WorkoutCard?> fetchWorkoutCard(String token, String id);
}
