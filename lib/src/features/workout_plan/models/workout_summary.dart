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

  factory WorkoutSummary.fromJson(Map<String, dynamic> json) {
    return WorkoutSummary(
      fitnessGoal: FitnessGoal.values[json['ws_main_goal']],
      programDuration: json['ws_program_duration'],
      workoutType: WorkoutType.values[json['ws_workout_type']],
      trainingLevel: ExperienceLevel.values[json['ws_training_level']],
      daysPerWeek: json['ws_day_per_week'],
      timePerWorkout: json['ws_time_per_workout'],
      targetGender: Gender.values[json['ws_target']],
    );
  }
}
