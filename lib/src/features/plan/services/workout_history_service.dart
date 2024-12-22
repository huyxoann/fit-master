import 'package:fit_master/src/config/logger/logger.dart';
import 'package:collection/collection.dart';
import 'package:fit_master/src/features/plan/model/workout_history.dart';
import 'package:hive/hive.dart';

class WorkoutHistoryService {
  final String _boxName = 'workout_history';

  Future<Box<WorkoutHistory>> get _box async =>
      await Hive.openBox<WorkoutHistory>(_boxName);

  Future<void> addWorkoutHistory(WorkoutHistory workoutHistory) async {
    final box = await _box;
    final existingHistory = box.values.firstWhereOrNull(
      (element) =>
          element.date.day == workoutHistory.date.day &&
          element.date.month == workoutHistory.date.month &&
          element.date.year == workoutHistory.date.year,
    );

    if (existingHistory != null) {
      final key = box.keyAt(box.values.toList().indexOf(existingHistory));
      await box.put(key, workoutHistory);
      logger.i('Workout history updated');
    } else {
      await box.add(workoutHistory);
      logger.i('Workout history added');
    }
  }

  Future<List<WorkoutHistory>> getWorkoutHistory() async {
    final box = await _box;
    logger.d("Size of workout history: ${box.values.length}");
    logger.d("List of workout history: ${box.values.toList().toString()}");
    return box.values.toList();
  }

  Future<void> updateWorkoutHistory(
      int key, WorkoutHistory workoutHistory) async {
    final box = await _box;
    await box.putAt(key, workoutHistory);
  }

  Future<void> deleteWorkoutHistory(int key) async {
    final box = await _box;
    await box.deleteAt(key);
  }

  Future<void> deleteAllWorkoutHistory() async {
    final box = await _box;
    await box.clear();
  }
}
