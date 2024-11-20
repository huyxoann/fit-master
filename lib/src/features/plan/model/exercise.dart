class Exercise {
  final String name;
  final int sets;
  final List<dynamic> reps;

  Exercise({
    required this.name,
    required this.sets,
    required this.reps,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      name: json['e_title'] ?? "",
      sets: json['ed_set'] ?? 0,
      reps: json['ed_reps'] ?? [0, 0],
    );
  }
}
