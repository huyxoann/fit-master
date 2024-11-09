import 'package:fit_master/src/core/models/enum.dart';

class WorkoutSummary {
  final FitnessGoal fitnessGoal;
  final int programDuration;
  final WorkoutType workoutType;
  final ExperienceLevel trainingLevel;
  final int daysPerWeek;
  final int timePerWorkout;
  final Gender targetGender;

  WorkoutSummary(
      {required this.fitnessGoal,
      required this.programDuration,
      required this.workoutType,
      required this.trainingLevel,
      required this.daysPerWeek,
      required this.timePerWorkout,
      required this.targetGender});
}
