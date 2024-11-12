import 'package:fit_master/src/features/plan/model/workout_day.dart';

class WorkoutPlan {
  final int planId;
  final String planName;
  final List<WorkoutDay> workoutDay;

  WorkoutPlan({
    required this.planId,
    required this.planName,
    required this.workoutDay,
  });

  factory WorkoutPlan.fromJson(Map<String, dynamic> json) {
    var list = json['workout_day'] as List;
    List<WorkoutDay> workoutDays =
        list.map((i) => WorkoutDay.fromJson(i)).toList();

    return WorkoutPlan(
      planId: json['plan_id'],
      planName: json['plan_name'],
      workoutDay: workoutDays,
    );
  }
}
