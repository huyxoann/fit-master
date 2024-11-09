import 'package:fit_master/src/features/plan/screens/next_practice_page.dart';
import 'package:flutter/material.dart';

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
      // home: const StartPracticeScreen(title: "Start practice"),
      // home: const PlanTodayScreen(title: 'Plan To Day'),
      // home: const CompletePlanScreen(title: 'Plan To Day'),
      home: const NextPracticeScreen(title: 'Next practice'),
    );
  }
}
