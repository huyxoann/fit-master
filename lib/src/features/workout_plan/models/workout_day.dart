import 'package:fit_master/src/core/models/enum.dart';
import 'package:fit_master/src/features/exercise/data/models/exercise.model.dart';

class WorkoutDay {
  final String name;
  final DayOfWeek dayOfWeek;
  final Exercise exercise;
  final int sets;
  final List<int> reps;

  WorkoutDay({
    required this.name,
    required this.dayOfWeek,
    required this.exercise,
    required this.sets,
    required this.reps,
  });
}
