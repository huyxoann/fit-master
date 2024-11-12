

import 'package:fit_master/src/features/plan/model/workout_plan.dart';

class User {
  final int id;
  final String username;
  final int gender;
  final double weight;
  final double height;
  final List<WorkoutPlan> workoutPlan;

  User({
    required this.id,
    required this.username,
    required this.gender,
    required this.weight,
    required this.height,
    required this.workoutPlan,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    var list = json['workout_plan'] as List;
    List<WorkoutPlan> workoutPlans =
    list.map((i) => WorkoutPlan.fromJson(i)).toList();

    return User(
      id: json['id'],
      username: json['username'],
      gender: json['gender'],
      weight: json['weight'].toDouble(),
      height: json['height'].toDouble(),
      workoutPlan: workoutPlans,
    );
  }
}