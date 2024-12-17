import 'package:fit_master/src/core/models/enum.dart';

import 'exercise.dart';

class WorkoutDay {
  final int workoutDayId;
  final String workoutDayName;
  final DayOfWeek dayOfWeek;
  final List<Exercise> exercises;

  WorkoutDay({
    required this.workoutDayId,
    required this.workoutDayName,
    required this.dayOfWeek,
    required this.exercises,
  });

  factory WorkoutDay.fromJson(Map<String, dynamic> json) {
    // var list = json['exercises'] as List;
    // List<Exercise> exercises =
    // list.map((i) => Exercise.fromJson(i)).toList();

    return WorkoutDay(
      workoutDayId: json['wd_workout_day_id'] ?? "",
      workoutDayName: json['wd_workout_day_name'] ?? "",
      dayOfWeek: DayOfWeek.values[json['wd_day_of_week']],
      exercises: (json['exercises'] as List)
          .map((exercise) => Exercise.fromJson(exercise))
          .toList(),
    );
  }

  @override
  String toString() {
    return 'WorkoutDay{workoutDayId: $workoutDayId, workoutDayName: $workoutDayName, dayOfWeek: $dayOfWeek, exercises: $exercises}';
  }
}
