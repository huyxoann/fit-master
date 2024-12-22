import 'package:fit_master/src/core/models/enum.dart';

class StepExercise {
  final String title;
  final String? coverImage;
  final int reps;
  final StepType type;
  final String? description;

  StepExercise({
    required this.title,
    required this.reps,
    required this.type,
    this.coverImage,
    this.description,
  });
}
