import 'package:fit_master/src/features/login/screens/login_screen.dart';
import 'package:fit_master/src/features/welcome/screens/choose_input_type_page.dart';
import 'package:fit_master/src/features/welcome/screens/choose_gender_page.dart';
import 'package:fit_master/src/features/welcome/screens/choose_fitness_goal_page.dart';
import 'package:fit_master/src/features/welcome/screens/choose_year_of_birth_page.dart';
import 'package:fit_master/src/features/welcome/screens/choose_h_and_w_page.dart';
import 'package:fit_master/src/home_page.dart';
import 'package:go_router/go_router.dart';

import '../src/features/welcome/screens/welcome_page.dart';

const bool isLoggedIn = false;

final router = GoRouter(
  initialLocation: isLoggedIn ? '/' : '/welcome',
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) => const MyHomePage(title: "Home"),
    ),
    GoRoute(
      name: 'welcome',
      path: '/welcome',
      builder: (context, state) => const WelcomePage2(),
      routes: <RouteBase>[
        GoRoute(
          name: 'welcome-choose-input-type',
          path: '/choose-input-type',
          builder: (context, state) => WelcomePage3(),
        ),
        GoRoute(
          name: 'welcome-choose-gender',
          path: '/choose-gender',
          builder: (context, state) => const WelcomePage4(),
        ),
        GoRoute(
          name: 'welcome-choose-fitness-goal',
          path: '/choose-fitness-goal',
          builder: (context, state) => const WelcomePage5(),
        ),
        GoRoute(
          name: 'welcome-choose-year-of-birth',
          path: '/choose-year-of-birth',
          builder: (context, state) => const WelcomePage6(),
        ),
        GoRoute(
          name: 'welcome-choose-height-and-weight',
          path: '/height-and-weight',
          builder: (context, state) => const WelcomePage7(),
        ),
      ],
    ),
    GoRoute(
      name: 'login',
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    )
  ],
);
