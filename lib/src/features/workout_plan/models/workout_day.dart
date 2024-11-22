import 'package:fit_master/src/core/models/enum.dart';
import 'package:fit_master/src/features/exercise/data/models/exercise.model.dart';

class WorkoutDay {
  final String name;
  final DayOfWeek dayOfWeek;
  final List<Exercise> exercise;
  final int sets;
  final List<int> reps;

  WorkoutDay({
    required this.name,
    required this.dayOfWeek,
    required this.exercise,
    required this.sets,
    required this.reps,
  });

  factory WorkoutDay.fromJson(Map<String, dynamic> json) {
    return WorkoutDay(
      name: json['name'],
      dayOfWeek: DayOfWeek.values[json['dayOfWeek']],
      exercise: (json['exercise'] as List<dynamic>)
          .map((e) => Exercise.fromJson(e as Map<String, dynamic>))
          .toList(),
      sets: json['sets'],
      reps: List<int>.from(json['reps']),
    );
  }
}
