import 'package:fit_master/src/config/locator.dart';
import 'package:fit_master/src/config/routes.dart';
import 'package:fit_master/src/features/exercise/repositories/exercise.repoImpl.dart';
import 'package:fit_master/src/features/exercise/view_model/exercise.view_model.dart';
import 'package:fit_master/src/features/food/repositories/food.repositoryImpl.dart';
import 'package:fit_master/src/features/food/view_model/food.view_model.dart';
import 'package:fit_master/src/features/login/viewmodel/auth_view_model.dart';
import 'package:fit_master/src/features/login/viewmodel/user_view_model.dart';
import 'package:fit_master/src/features/options/viewmodel/setting_viewmodel.dart';
import 'package:fit_master/src/features/plan/model/workout_history.dart';
import 'package:fit_master/src/features/plan/viewmodel/doing_exercise_viewmodel.dart';
import 'package:fit_master/src/features/plan/viewmodel/my_plan_viemodel.dart';
import 'package:fit_master/src/features/welcome/viewmodel/workout_recommend_viewmodel.dart';
import 'package:fit_master/src/features/workout_plan/viewmodels/dashboard_exercise_list_viewmodel.dart';
import 'package:fit_master/src/features/workout_plan/viewmodels/workout_plan.viewmodel.dart';
import 'package:fit_master/src/features/workout_plan/viewmodels/workout_plan_detail_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('userDataBox');
  Hive.registerAdapter(WorkoutHistoryAdapter());
  Hive.registerAdapter(WorkoutStatusEnumAdapter());
  setupLocator();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (context) => FoodViewModel(FoodRepositoryImpl())),
      ChangeNotifierProvider(
          create: (context) => ExerciseViewModel(ExerciseRepositoryImpl())),
      ChangeNotifierProvider(
          create: (context) => WorkoutPlanViewModel(
              repository: locator(), myPlanRepository: locator())),
      ChangeNotifierProvider(
        create: (context) => UserViewModel(
          authService: locator(),
          authRepository: locator(),
        ),
      ),
      ChangeNotifierProvider(
          create: (context) => MyPlanViewModel(myPlanRepository: locator())),
      ChangeNotifierProvider(
        create: (context) => AuthViewModel(
          authRepository: locator(),
        ),
      ),
      ChangeNotifierProvider(
        create: (context) => WorkoutRecommendViewmodel(
          workoutPlanRepository: locator(),
        ),
      ),
      ChangeNotifierProvider(
        create: (context) => DashboardExerciseListViewmodel(
          exerciseRepository: locator(),
        ),
      ),
      ChangeNotifierProvider(
        create: (context) => WorkoutPlanDetailViewmodel(
          repository: locator(),
        ),
      ),
      ChangeNotifierProvider(
          create: (context) => SettingViewmodel(authService: locator())),
      ChangeNotifierProvider(create: (context) => DoingExerciseViewModel())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final brightness = View.of(context).platformDispatcher.platformBrightness;

    TextTheme textTheme = Theme.of(context).textTheme.apply(
          fontFamily: 'OpenSans',
        );

    MyAppTheme theme = MyAppTheme(textTheme);

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: theme.dark(),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
