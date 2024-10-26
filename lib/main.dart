import 'package:fit_master/config/routes.dart';
import 'package:fit_master/src/features/welcome/screens/welcome_page_2.dart';
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

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: theme.dark(),
      routerConfig: router,

      // home: const WelcomePage2(),
      // home: const MyHomePage(title: 'Fit Master'),
    );
  }
}
