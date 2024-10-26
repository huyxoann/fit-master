import 'package:fit_master/src/features/welcome/screens/welcome_page_3.dart';
import 'package:fit_master/src/features/welcome/screens/welcome_page_4.dart';
import 'package:fit_master/src/home_page.dart';
import 'package:go_router/go_router.dart';

import '../src/features/welcome/screens/welcome_page_2.dart';

final bool isLoggedIn = false;

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
            builder: (context, state) => WelcomePage4(),
          ),
        ]),
  ],
);
