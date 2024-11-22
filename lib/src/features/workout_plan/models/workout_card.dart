class WorkoutCard {
  final int id;
  final String planName;
  final String coverImage;
  final int programDuration;

  WorkoutCard(
      {required this.id,
      required this.planName,
      required this.coverImage,
      required this.programDuration});

  factory WorkoutCard.fromJson(Map<String, dynamic> json) {
    return WorkoutCard(
      id: json['wp_plan_id'],
      planName: json['wp_plan_name'],
      coverImage: json['wp_cover_image'],
      programDuration: json['ws_program_duration'],
    );
  }
}
