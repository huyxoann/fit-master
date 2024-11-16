class ExerciseDetailResponse {
  final List<String> instruction;
  final List<String> tip;
  final ExerciseProfile exerciseProfile;

  ExerciseDetailResponse({
    required this.instruction,
    required this.tip,
    required this.exerciseProfile,
  });

  // Hàm factory để khởi tạo model từ JSON
  factory ExerciseDetailResponse.fromJson(Map<String, dynamic> json) {
    return ExerciseDetailResponse(
      instruction: List<String>.from(json['instruction']),
      tip: List<String>.from(json['tip']),
      exerciseProfile: ExerciseProfile.fromJson(json['exercise_profile']),
    );
  }
}

class ExerciseProfile {
  final int exerProfileId;
  final int exerciseType;
  final int forceType;
  final int equipmentRequired;
  final int mechanic;

  ExerciseProfile({
    required this.exerProfileId,
    required this.exerciseType,
    required this.forceType,
    required this.equipmentRequired,
    required this.mechanic,
  });

  // Hàm factory để khởi tạo ExerciseProfile từ JSON
  factory ExerciseProfile.fromJson(Map<String, dynamic> json) {
    return ExerciseProfile(
      exerciseType: json['exercise_type'],
      forceType: json['force_type'],
      equipmentRequired: json['equipment_required'],
      mechanic: json['mechanic'],
      exerProfileId: json['exer_profile_id'],
    );
  }
}
