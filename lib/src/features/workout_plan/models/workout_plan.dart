import 'package:fit_master/src/core/models/enum.dart';
import 'package:fit_master/src/features/workout_plan/models/workout_day.dart';
import 'package:fit_master/src/features/workout_plan/models/workout_summary.dart';

class WorkoutPlan {
  final int planID;
  final String planName;
  final String planDescription;
  final List<WorkoutCategory> workoutCategories;
  final List<WorkoutDay> workoutDays;
  final String coverImage;
  final WorkoutSummary workoutSummary;
  final DateTime createdAt;

  WorkoutPlan({
    required this.planID,
    required this.planName,
    required this.planDescription,
    required this.workoutCategories,
    required this.workoutDays,
    required this.coverImage,
    required this.workoutSummary,
    required this.createdAt,
  });

  factory WorkoutPlan.fromJson(Map<String, dynamic> json) {
    return WorkoutPlan(
      planID: json['planID'],
      planName: json['planName'],
      planDescription: json['planDescription'],
      workoutCategories: (json['workoutCategories'] as List)
          .map((e) => WorkoutCategory.values
              .firstWhere((element) => element.toString() == e))
          .toList(),
      workoutDays: (json['workoutDays'] as List)
          .map((e) => WorkoutDay.fromJson(e))
          .toList(),
      coverImage: json['coverImage'],
      workoutSummary: WorkoutSummary.fromJson(json['workoutSummary']),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
