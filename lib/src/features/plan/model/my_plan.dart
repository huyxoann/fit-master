import 'package:fit_master/src/features/plan/model/workout_plan.dart';

class MyPlan {
  final int userId;
  final WorkoutPlan workoutPlan;
  final DateTime startDate;
  final int completedSession;

  MyPlan({
    required this.userId,
    required this.workoutPlan,
    required this.startDate,
    this.completedSession = 0,
  });

  factory MyPlan.fromJson(Map<String, dynamic> json) {
    return MyPlan(
      userId: json['user_id'],
      workoutPlan: WorkoutPlan.fromJson(json['workout_plan']),
      startDate: DateTime.parse(json['start_date']),
      completedSession: json['completed_session'],
    );
  }
}
