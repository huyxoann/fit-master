import 'package:fit_master/src/core/models/enum.dart';

class WorkoutDay {
  final String name;
  final DayOfWeek dayOfWeek;
  final Exercise exercise;
  final int sets;
  final List<int> reps;
}
