import 'package:fit_master/src/features/food/repositories/food.repositoryImpl.dart';
import 'package:fit_master/src/features/food/screens/tab_food.dart';
import 'package:fit_master/src/features/food/view_model/food.view_model.dart';
import 'package:fit_master/src/features/plan/screens/plan_today_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/home_page.dart';
import 'theme/theme.dart';
import 'theme/util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final brightness = View.of(context).platformDispatcher.platformBrightness;

    TextTheme textTheme = createTextTheme(context, "Open Sans", "Open Sans");

    MyAppTheme theme = MyAppTheme(textTheme);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme.dark(),
      home: const PlanTodayScreen(title: 'Plan To Day'),
    );
  }
}