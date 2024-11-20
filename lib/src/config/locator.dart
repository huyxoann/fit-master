import 'package:fit_master/src/features/plan/repository/workout_plan.repository.dart';
import 'package:fit_master/src/features/plan/repository/workout_plan.repositoryImpl.dart';
import 'package:fit_master/src/features/workout_plan/repositories/workout_plan.repository.dart';
import 'package:fit_master/src/features/workout_plan/repositories/workout_plan.repositoryImpl.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  // locator.registerLazySingleton(() => FoodRepositoryImpl());
  // locator.registerLazySingleton(() => WorkoutPlanRepositoryImpl());
  locator.registerFactory<WorkoutPlanRepository>(
      () => WorkoutPlanRepositoryImpl());

  locator.registerFactory<MyPlanRepository>(
      () => MyPlanRepositoryIpml());
}
