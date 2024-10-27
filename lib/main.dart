import 'package:fit_master/src/features/food/screens/tab_food.dart';
import 'package:flutter/material.dart';

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

   TextTheme textTheme = Theme.of(context).textTheme.apply(
  fontFamily: 'OpenSans',
);


    MyAppTheme theme = MyAppTheme(textTheme);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme.dark(),
      home: TabFood(key: key,),

      debugShowCheckedModeBanner: false,
    );
  }
}
