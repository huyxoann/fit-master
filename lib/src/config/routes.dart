// import 'package:fit_master/src/features/welcome/screens/welcome_page_3.dart';
// import 'package:fit_master/src/features/welcome/screens/welcome_page_4.dart';
// import 'package:fit_master/src/features/welcome/screens/welcome_page_5.dart';
// import 'package:fit_master/src/features/welcome/screens/welcome_page_6.dart';
// import 'package:fit_master/src/features/welcome/screens/welcome_page_7.dart';
import 'package:fit_master/src/features/exercise/screen/list_exercise.dart';
import 'package:fit_master/src/home_page.dart';
import 'package:go_router/go_router.dart';

// import '../src/features/welcome/screens/welcome_page_2.dart';

final bool isLoggedIn = true;

final router = GoRouter(
  initialLocation: isLoggedIn ? '/' : '/welcome/choose-year-of-birth',
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) => const MyHomePage(title: "Home"),
    ),
    // GoRoute(
    //     name: 'welcome',
    //     path: '/welcome',
    //     builder: (context, state) => const WelcomePage2(),
    //     routes: <RouteBase>[
    //       GoRoute(
    //         name: 'welcome-choose-input-type',
    //         path: '/choose-input-type',
    //         builder: (context, state) => WelcomePage3(),
    //       ),
    //       GoRoute(
    //         name: 'welcome-choose-gender',
    //         path: '/choose-gender',
    //         builder: (context, state) => WelcomePage4(),
    //       ),
    //       GoRoute(
    //         name: 'welcome-choose-fitness-goal',
    //         path: '/choose-fitness-goal',
    //         builder: (context, state) => WelcomePage5(),
    //       ),
    //       GoRoute(
    //         name: 'welcome-choose-year-of-birth',
    //         path: '/choose-year-of-birth',
    //         builder: (context, state) => WelcomePage6(),
    //       ),
    //       GoRoute(
    //         name: 'welcome-choose-height-and-weight',
    //         path: '/height-and-weight',
    //         builder: (context, state) => WelcomePage7(),
    //       ),
    //     ]),
    GoRoute(
        name: 'exercises',
        path: '/exercises',
        builder: (context, state) => const ListExerciseScreen()),
  ],
);
