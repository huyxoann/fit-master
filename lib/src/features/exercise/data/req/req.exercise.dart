class GetListExerciseRequest {
  final int? experienceLevel;
  final int? targetMuscle;
  final int offset;
  final int limit;

  GetListExerciseRequest({
    this.experienceLevel,
    this.targetMuscle,
    this.offset = 0,
    this.limit = 8,
  });

  Map<String, dynamic> toJson() {
    return {
      'experience_level': experienceLevel,
      'target_muscle': targetMuscle,
      'offset': offset,
      'limit': limit,
    };
  }
}
