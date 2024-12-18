import 'package:fit_master/src/core/models/enum.dart';

class StepExercise {
  final String title;
  final int reps;
  final StepType type;

  StepExercise({required this.title, required this.reps, required this.type});
}
