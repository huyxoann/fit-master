import 'package:fit_master/src/features/plan/model/workout_day.dart';
import 'package:fit_master/src/features/workout_plan/models/workout_summary.dart';

class WorkoutPlan {
  final int planId;
  final String planName;
  final String planDescription;
  final List<WorkoutDay> workoutDay;
  final WorkoutSummary workoutSummary;
  final String coverImage;
  final int programDuration;

  WorkoutPlan({
    required this.planId,
    required this.planName,
    required this.workoutDay,
    this.coverImage = "",
    required this.programDuration,
    required this.workoutSummary,
    required this.planDescription,
  });

  factory WorkoutPlan.fromJson(Map<String, dynamic> json) {
    return WorkoutPlan(
      planId: json['workout_plan']['wp_plan_id'],
      planName: json['workout_plan']['wp_plan_name'],
      planDescription: json['workout_plan']['wp_plan_details'],
      coverImage: json['workout_plan']['wp_cover_image'],
      programDuration: json['workout_plan']['ws_program_duration'],
      workoutDay: (json['workout_plan']['workout_day'] as List)
          .map((i) => WorkoutDay.fromJson(i))
          .toList(),
      workoutSummary: WorkoutSummary.fromJson(json['workout_plan']),
    );
  }

  factory WorkoutPlan.fromJsonList(Map<String, dynamic> json) {
    return WorkoutPlan(
      planId: json['plan_id'],
      planName: json['plan_name'],
      planDescription: json['plan_details'],
      coverImage: json['cover_image'],
      programDuration: json['program_duration'],
      workoutDay: [],
      workoutSummary: WorkoutSummary.fromJson2(json),
    );
  }

  @override
  String toString() {
    return 'WorkoutPlan(planId: $planId, planName: $planName, planDescription: $planDescription, workoutDay: $workoutDay, workoutSummary: $workoutSummary, coverImage: $coverImage, programDuration: $programDuration)';
  }
}
