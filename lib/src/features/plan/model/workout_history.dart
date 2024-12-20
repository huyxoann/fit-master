import 'package:hive/hive.dart';

part 'workout_history.g.dart';

@HiveType(typeId: 1)
class WorkoutHistory {
  @HiveField(0)
  DateTime date;

  @HiveField(1, defaultValue: WorkoutStatusEnum.notCompleted)
  WorkoutStatusEnum status;

  WorkoutHistory({
    required this.date,
    this.status = WorkoutStatusEnum.notCompleted,
  });

  @override
  String toString() {
    return 'WorkoutHistory(date: $date, status: $status)';
  }
}

@HiveType(typeId: 2)
enum WorkoutStatusEnum {
  @HiveField(0)
  completed,
  @HiveField(1)
  notCompleted,
}
