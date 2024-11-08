import 'package:fit_master/src/config/routes.dart';
import 'package:fit_master/src/features/exercise/repositories/exercise.repoImpl.dart';
import 'package:fit_master/src/features/exercise/screen/list_exercise.dart';
import 'package:fit_master/src/features/exercise/view_model/exercise.view_model.dart';
import 'package:fit_master/src/features/food/repositories/food.repositoryImpl.dart';
import 'package:fit_master/src/features/food/screens/tab_food.dart';
import 'package:fit_master/src/features/food/view_model/food.view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/home_page.dart';
import 'theme/theme.dart';
import 'theme/util.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (context) => FoodViewModel(FoodRepositoryImpl())),
      ChangeNotifierProvider(
          create: (context) => ExerciseViewModel(ExerciseRepositoryImpl())),
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
      theme: theme.dark(),
      routerConfig: router,
    );
  }
}
