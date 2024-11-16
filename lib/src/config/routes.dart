// import 'package:fit_master/src/features/welcome/screens/welcome_page_3.dart';
// import 'package:fit_master/src/features/welcome/screens/welcome_page_4.dart';
// import 'package:fit_master/src/features/welcome/screens/welcome_page_5.dart';
// import 'package:fit_master/src/features/welcome/screens/welcome_page_6.dart';
// import 'package:fit_master/src/features/welcome/screens/welcome_page_7.dart';
import 'package:fit_master/src/config/extra/exercise_detail.dart';
import 'package:fit_master/src/features/exercise/screen/exercise_detail.dart';
import 'package:fit_master/src/features/exercise/screen/list_exercise.dart';
import 'package:fit_master/src/features/main_wrapper.dart';
import 'package:fit_master/src/home_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

// import '../src/features/welcome/screens/welcome_page_2.dart';

final bool isLoggedIn = true;

// final router = GoRouter(
//   initialLocation: isLoggedIn ? '/' : '/welcome/choose-year-of-birth',
//   errorBuilder: (context, state ) => const Scaffold(body: Center(child: Text("Not found page"),),),
//   routes: [
//     GoRoute(
//       name: 'home',
//       path: '/',
//       builder: (context, state) => const MyHomePage(title: "Home"),
//     ),
//     // GoRoute(
//     //     name: 'welcome',
//     //     path: '/welcome',
//     //     builder: (context, state) => const WelcomePage2(),
//     //     routes: <RouteBase>[
//     //       GoRoute(
//     //         name: 'welcome-choose-input-type',
//     //         path: '/choose-input-type',
//     //         builder: (context, state) => WelcomePage3(),
//     //       ),
//     //       GoRoute(
//     //         name: 'welcome-choose-gender',
//     //         path: '/choose-gender',
//     //         builder: (context, state) => WelcomePage4(),
//     //       ),
//     //       GoRoute(
//     //         name: 'welcome-choose-fitness-goal',
//     //         path: '/choose-fitness-goal',
//     //         builder: (context, state) => WelcomePage5(),
//     //       ),
//     //       GoRoute(
//     //         name: 'welcome-choose-year-of-birth',
//     //         path: '/choose-year-of-birth',
//     //         builder: (context, state) => WelcomePage6(),
//     //       ),
//     //       GoRoute(
//     //         name: 'welcome-choose-height-and-weight',
//     //         path: '/height-and-weight',
//     //         builder: (context, state) => WelcomePage7(),
//     //       ),
//     //     ]),
//      GoRoute(
//       name: 'exercises',
//       path: '/exercises',
//       builder: (context, state) => const ListExerciseScreen(),
//       routes: [
//         GoRoute(
//           name: 'exerciseDetails',
//           path: '/details',
//           builder: (context, state) {
//             final extraData = state.extra as Map<dynamic, dynamic>;
//             final exerciseId = extraData['exerciseId'];
//             final title = extraData['title'];
//             final coverImage = extraData['coverImage'];
//             final exerProfileId = extraData['exerProfileId'];

//             return ExerciseDetailScreen(
//               exerciseId: exerciseId,
//               title: title,
//               coverImage: coverImage,
//               exerProfileId: exerProfileId,
//             );
//           },
//         ),
//       ],
//     ),
//   ],
// );

const String initial = "/home";

  // Private navigators
  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorHome =
      GlobalKey<NavigatorState>(debugLabel: 'shellHome');
    final _shellNavigatorExercise=
      GlobalKey<NavigatorState>(debugLabel: 'shellExercise');
        final _shellNavigatorSchedule =
      GlobalKey<NavigatorState>(debugLabel: 'shellSchedule');
  final _shellNavigatorSettings =
      GlobalKey<NavigatorState>(debugLabel: 'shellSettings');

GoRouter router = GoRouter(
    initialLocation: initial,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      /// MainWrapper
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainWrapper(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          /// Brach Home
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHome,
            routes: <RouteBase>[
              GoRoute(
                path: "/home",
                name: "Home",
                builder: (BuildContext context, GoRouterState state) => Center(child: Container(child: Text("Home"))),
                // routes: [
                //   GoRoute(
                //     path: 'subHome',
                //     name: 'subHome',
                //     pageBuilder: (context, state) => CustomTransitionPage<void>(
                //       key: state.pageKey,
                //       child: const SubHomeView(),
                //       transitionsBuilder:
                //           (context, animation, secondaryAnimation, child) =>
                //               FadeTransition(opacity: animation, child: child),
                //     ),
                //   ),
                // ],
              ),
            ],
          ),

          /// Brach Setting
          StatefulShellBranch(
            navigatorKey: _shellNavigatorExercise,
            routes: <RouteBase>[
              GoRoute(
                path: "/exercises",
                name: "exercises",
                builder: (BuildContext context, GoRouterState state) =>
                    const ListExerciseScreen(),
                routes: [
                  GoRoute(
                    path: "details",
                    name: "exerciseDetails",
                    pageBuilder: (context, state) {
                      final extraData = state.extra as Map<dynamic, dynamic>;
                      final exerciseId = extraData['exerciseId'];
                      final title = extraData['title'];
                      final coverImage = extraData['coverImage'];
                      final exerProfileId = extraData['exerProfileId'];
                      return CustomTransitionPage<void>(
                        key: state.pageKey,
                        child: ExerciseDetailScreen(
                          exerciseId: exerciseId,
                          title: title,
                          coverImage: coverImage,
                          exerProfileId: exerProfileId,
                        ),
                        transitionsBuilder: (
                          context,
                          animation,
                          secondaryAnimation,
                          child,
                        ) =>
                            FadeTransition(opacity: animation, child: child),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),

           StatefulShellBranch(
            navigatorKey: _shellNavigatorSchedule,
            routes: <RouteBase>[
              GoRoute(
                path: "/schedule",
                name: "schedule",
                builder: (BuildContext context, GoRouterState state) => Center(child: Container(child: Text("Schedule"))),
              ),
            ],
          ),

           StatefulShellBranch(
            navigatorKey: _shellNavigatorSettings,
            routes: <RouteBase>[
              GoRoute(
                path: "/setting",
                name: "setting",
                builder: (BuildContext context, GoRouterState state) => Center(child: Container(child: Text("Setting"))),
              ),
            ],
          ),
        ],
      ),

    ],
  );