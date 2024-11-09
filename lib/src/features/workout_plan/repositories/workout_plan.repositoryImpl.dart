import 'package:fit_master/src/core/models/enum.dart';
import 'package:fit_master/src/core/services/base_api.service.dart';
import 'package:fit_master/src/core/services/network_api.service.dart';
import 'package:fit_master/src/features/workout_plan/models/workout_plan.dart';
import 'package:fit_master/src/features/workout_plan/models/workout_summary.dart';
import 'package:fit_master/src/features/workout_plan/repositories/workout_plan.repository.dart';

class WorkoutPlanRepositoryImpl extends WorkoutPlanRepository {
  final BaseApisService _apisService = NetworkApiService();

  @override
  Future<List<WorkoutPlan>> fetchListWorkoutPlan(String token) {
    throw UnimplementedError();
  }

  @override
  Future<WorkoutPlan> fetchWorkoutPlanDetail(String token, String id) async {
    WorkoutPlan workoutPlan = WorkoutPlan(
      planID: 1,
      planName: 'Dumbbell Only Workout: 5 Day Dumbbell Workout Split',
      planDescription:
          'This 5 day dumbbell only workout program only requires dumbbells and is perfect for those looking to build lean muscle mass at home or on the go!',
      workoutCategories: [
        WorkoutCategory.forMen,
        WorkoutCategory.muscleBuilding,
        WorkoutCategory.atHome
      ],
      coverImage: 'assets/images/background/wl_1.webp',
      workoutSummary: WorkoutSummary(
        daysPerWeek: 5,
        fitnessGoal: FitnessGoal.muscleBuilding,
        workoutType: WorkoutType.split,
        programDuration: 12,
        targetGender: Gender.both,
        trainingLevel: ExperienceLevel.intermediate,
        timePerWorkout: 60,
      ),
      createdAt: DateTime.now(),
    );
    return Future.value(workoutPlan);
  }
}
