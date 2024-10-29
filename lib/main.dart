import 'package:fit_master/src/features/food/repositories/food.repositoryImpl.dart';
import 'package:fit_master/src/features/food/view_model/food.view_model.dart';
import 'package:fit_master/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theme/theme.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (context) => FoodViewModel(FoodRepositoryImpl())),
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
      routerConfig: router,
    );
  }
}
