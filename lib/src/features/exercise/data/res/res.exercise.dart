class Exercise {
  final int exerciseId;
  final String title;
  final String coverImage;
  final int exerProfileId;

  Exercise({
    required this.exerciseId,
    required this.title,
    required this.coverImage,
    required this.exerProfileId,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      exerciseId: json['exercise_exercise_id'] ?? 0, // Ensure it defaults to 0 if null
      title: json['exercise_title'] ?? 'No Title', // Default title if null
      coverImage: json['exercise_cover_image'] ?? '', // Empty string for missing image
      exerProfileId: json['exercise_profile_exer_profile_id']?? 0,
    );
  }
}

class GetListExerciseResponse {
  final List<Exercise> exercises;

  GetListExerciseResponse({required this.exercises});

  factory GetListExerciseResponse.fromJson(dynamic json) {
    List<Exercise> exercises = (json as List<dynamic>)
        .map((e) => Exercise.fromJson(e))
        .toList();
    return GetListExerciseResponse(exercises: exercises);
  }
}