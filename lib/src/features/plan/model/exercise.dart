class Exercise {
  final String name;
  final int sets;
  final dynamic reps;

  Exercise({
    required this.name,
    required this.sets,
    required this.reps,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      name: json['name'],
      sets: json['sets'],
      reps: json['reps'],
    );
  }
}