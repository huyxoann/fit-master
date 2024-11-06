
class ExerciseProfile {
  final int exerProfileId;
  final int targetMuscle;
  final int exerciseType;
  final int experienceLevel;
  final int? forceType;
  final int? equipmentRequired;
  final int? mechanic;

  ExerciseProfile({
    required this.exerProfileId,
    required this.targetMuscle,
    required this.exerciseType,
    required this.experienceLevel,
    this.forceType,
    this.equipmentRequired,
    this.mechanic,
  });

  factory ExerciseProfile.fromJson(Map<String, dynamic> json) {
    return ExerciseProfile(
      exerProfileId: json['exer_profile_id'],
      targetMuscle: json['target_muscle'],
      exerciseType: json['exercise_type'],
      experienceLevel: json['experience_level'],
      forceType: json['force_type'],
      equipmentRequired: json['equipment_required'],
      mechanic: json['mechanic'],
    );
  }
}
