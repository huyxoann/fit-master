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
      exerciseId:
          json['exercise_id'] ?? 0, // Ensure it defaults to 0 if null
      title: json['title'] ?? 'No Title', // Default title if null
      coverImage:
          json['cover_image'] ?? '', // Empty string for missing image
      exerProfileId: json['exer_profile_id'] ?? 0,
    );
  }

  @override
  String toString() {
    return 'Exercise{exerciseId: $exerciseId, title: $title, coverImage: $coverImage, exerProfileId: $exerProfileId}';
  }
}

class GetListExerciseResponse {
  final List<Exercise> exercises;

  GetListExerciseResponse({required this.exercises});

  factory GetListExerciseResponse.fromJson(dynamic json) {
    List<Exercise> exercises =
        (json as List<dynamic>).map((e) => Exercise.fromJson(e)).toList();
    return GetListExerciseResponse(exercises: exercises);
  }

  @override
  String toString() {
    return 'GetListExerciseResponse{exercises: $exercises}';
  }
}
