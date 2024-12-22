class Exercise {
  final String name;
  final int sets;
  final List<dynamic> reps;
  final String? image;

  Exercise({
    required this.name,
    required this.sets,
    required this.reps,
    this.image,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      name: json['e_title'] ?? "",
      sets: json['ed_set'] ?? 0,
      reps: json['ed_reps'] ?? [0, 0],
      image: json['e_cover_image'],
    );
  }

  @override
  String toString() {
    return 'Exercise{name: $name, sets: $sets, reps: $reps}';
  }
}
