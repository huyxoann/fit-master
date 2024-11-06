import 'exercise_profile.model.dart';

class Exercise {
  final int exerciseId;
  final String title;
  final int exerProfileId;
  final List<String> instruction;
  final List<String> tip;
  final String? coverImage;
  final bool isDelete;
  final ExerciseProfile exerciseProfile;

  Exercise({
    required this.exerciseId,
    required this.title,
    required this.exerProfileId,
    required this.instruction,
    required this.tip,
    this.coverImage,
    required this.isDelete,
    required this.exerciseProfile,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      exerciseId: json['exercise_id'],
      title: json['title'],
      exerProfileId: json['exer_profile_id'],
      instruction: List<String>.from(json['instruction']),
      tip: List<String>.from(json['tip']),
      coverImage: json['cover_image'],
      isDelete: json['is_delete'],
      exerciseProfile: ExerciseProfile.fromJson(json['exercise_profile']),
    );
  }
}
