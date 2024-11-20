import 'package:fit_master/src/config/logger/logger.dart';
import 'package:fit_master/src/features/plan/model/workout_day.dart';

class WorkoutPlan {
  final int planId;
  final String planName;
  final List<WorkoutDay> workoutDay;
  final String coverImage;

  WorkoutPlan({
    required this.planId,
    required this.planName,
    required this.workoutDay,
    this.coverImage = "",
  });

  factory WorkoutPlan.fromJson(Map<String, dynamic> json) {
    return WorkoutPlan(
      planId: json['wp_plan_id'],
      planName: json['wp_plan_name'],
      workoutDay: (json['workout_day'] as List)
          .map((i) => WorkoutDay.fromJson(i))
          .toList(),
    );
  }
}
