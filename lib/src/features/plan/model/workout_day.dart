import 'exercise.dart';

class WorkoutDay {
  final int workoutDayId;
  final String workoutDayName;
  final String typeWorkout;
  final String duration;
  final List<Exercise> exercises;

  WorkoutDay({
    required this.workoutDayId,
    required this.workoutDayName,
    required this.typeWorkout,
    required this.duration,
    required this.exercises,
  });

  factory WorkoutDay.fromJson(Map<String, dynamic> json) {
    var list = json['exercises'] as List;
    List<Exercise> exercises =
    list.map((i) => Exercise.fromJson(i)).toList();

    return WorkoutDay(
      workoutDayId: json['workout_day_id'],
      workoutDayName: json['workout_day_name'],
      typeWorkout: json['type_workout'],
      duration: json['duration'],
      exercises: exercises,
    );
  }
}
