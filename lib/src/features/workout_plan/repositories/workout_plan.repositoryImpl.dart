import 'package:fit_master/src/config/logger/logger.dart';
import 'package:fit_master/src/core/constants/app_info.dart';
import 'package:fit_master/src/core/network/BaseApiService.dart';
import 'package:fit_master/src/core/network/NetworkApiService.dart';
import 'package:fit_master/src/features/plan/model/workout_plan.dart';
import 'package:fit_master/src/features/workout_plan/models/workout_card.dart';
import 'package:fit_master/src/features/workout_plan/repositories/workout_plan.repository.dart';

class WorkoutPlanRepositoryImpl extends WorkoutPlanRepository {
  final BaseApisService _networkApiService = NetworkApiService();

  @override
  Future<List<WorkoutPlan>> fetchListWorkoutPlan(String token) {
    throw UnimplementedError();
  }

  @override
  Future<WorkoutCard?> fetchWorkoutCard(String token, String id) async {
    try {
      final response = await _networkApiService.getApiResponse(
          '${AppInfo.getWorkoutPlanInfoForCard}/$id', null);

      if (response != null && response is Map<String, dynamic>) {
        // logger.d("At fetchWorkoutCard: $response");
        return WorkoutCard.fromJson(response);
      } else {
        return null;
      }
    } catch (e) {
      // Handle error
    } finally {}
    return null;
  }

  @override
  Future<WorkoutPlan?> fetchWorkoutPlanDetail(String token, String id) async {
    try {
      final response = await _networkApiService.getApiResponse(
        '${AppInfo.baseUrl}/workouts/get/$id',
        null,
        params: {'id': id},
      );

      logger.d("At fetchWorkoutPlanDetail: $response");
      logger
          .i("At fetchWorkoutPlanDetail: ${AppInfo.baseUrl}/workouts/get/$id'");
      if (response != null && response is Map<String, dynamic>) {
        logger.d("At fetchWorkoutPlanDetail: $response");
        return WorkoutPlan.fromJson(response);
      } else {
        return null;
      }
    } catch (e) {}
    return null;
    // WorkoutPlan workoutPlan = WorkoutPlan(
    //   planID: 1,
    //   planName: 'Dumbbell Only Workout: 5 Day Dumbbell Workout Split',
    //   planDescription:
    //       'This 5 day dumbbell only workout program only requires dumbbells and is perfect for those looking to build lean muscle mass at home or on the go!',
    //   workoutCategories: [
    //     WorkoutCategory.forMen,
    //     WorkoutCategory.muscleBuilding,
    //     WorkoutCategory.atHome
    //   ],
    //   coverImage: 'assets/images/background/wl_1.webp',
    //   workoutSummary: WorkoutSummary(
    //     daysPerWeek: 5,
    //     fitnessGoal: FitnessGoal.muscleBuilding,
    //     workoutType: WorkoutType.split,
    //     programDuration: 12,
    //     targetGender: Gender.Both,
    //     trainingLevel: ExperienceLevel.Intermediate,
    //     timePerWorkout: 60,
    //   ),
    //   createdAt: DateTime.now(),
    //   workoutDays: [
    //     WorkoutDay(
    //         name: "Day 1: Chest, Shoulders, & Triceps Dumbbell Workout",
    //         dayOfWeek: DayOfWeek.Monday,
    //         exercise: Exercise(
    //           exerciseId: 1,
    //           title: "Dumbbell Bench Press",
    //           exerProfileId: 1,
    //           instruction: [
    //             "Pick up the dumbbells off the floor using a neutral grip (palms facing in). Position the ends of the dumbbells in your hip crease, and sit down on the bench.",
    //             "To get into position, lay back and keep the weights close to your chest. Once you are in position, press the weights to lockout at the top."
    //                 "Slowly lower the dumbbells under control as far as comfortably possible (the handles should be about level with your chest).",
    //           ],
    //           tip: [],
    //           isDelete: false,
    //           exerciseProfile: ExerciseProfile(
    //             exerProfileId: 1,
    //             exerciseType: 1,
    //             experienceLevel: 1,
    //             targetMuscle: 1,
    //             equipmentRequired: 1,
    //             forceType: 1,
    //             mechanic: 1,
    //           ),
    //         ),
    //         sets: 5,
    //         reps: [8, 10]),
    //     WorkoutDay(
    //         name: "Day 1: Chest, Shoulders, & Triceps Dumbbell Workout",
    //         dayOfWeek: DayOfWeek.Monday,
    //         exercise: Exercise(
    //           exerciseId: 1,
    //           title: "Dumbbell Bench Press",
    //           exerProfileId: 1,
    //           instruction: [
    //             "Pick up the dumbbells off the floor using a neutral grip (palms facing in). Position the ends of the dumbbells in your hip crease, and sit down on the bench.",
    //             "To get into position, lay back and keep the weights close to your chest. Once you are in position, press the weights to lockout at the top."
    //                 "Slowly lower the dumbbells under control as far as comfortably possible (the handles should be about level with your chest).",
    //           ],
    //           tip: [],
    //           isDelete: false,
    //           exerciseProfile: ExerciseProfile(
    //             exerProfileId: 1,
    //             exerciseType: 1,
    //             experienceLevel: 1,
    //             targetMuscle: 1,
    //             equipmentRequired: 1,
    //             forceType: 1,
    //             mechanic: 1,
    //           ),
    //         ),
    //         sets: 5,
    //         reps: [8, 10]),
    //     WorkoutDay(
    //         name: "Day 1: Chest, Shoulders, & Triceps Dumbbell Workout",
    //         dayOfWeek: DayOfWeek.Monday,
    //         exercise: Exercise(
    //           exerciseId: 1,
    //           title: "Dumbbell Bench Press",
    //           exerProfileId: 1,
    //           instruction: [
    //             "Pick up the dumbbells off the floor using a neutral grip (palms facing in). Position the ends of the dumbbells in your hip crease, and sit down on the bench.",
    //             "To get into position, lay back and keep the weights close to your chest. Once you are in position, press the weights to lockout at the top."
    //                 "Slowly lower the dumbbells under control as far as comfortably possible (the handles should be about level with your chest).",
    //           ],
    //           tip: [],
    //           isDelete: false,
    //           exerciseProfile: ExerciseProfile(
    //             exerProfileId: 1,
    //             exerciseType: 1,
    //             experienceLevel: 1,
    //             targetMuscle: 1,
    //             equipmentRequired: 1,
    //             forceType: 1,
    //             mechanic: 1,
    //           ),
    //         ),
    //         sets: 5,
    //         reps: [8, 10])
    //   ],
    // );
    // return Future.value(workoutPlan);
  }
}
