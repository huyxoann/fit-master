import 'package:fit_master/src/config/locator.dart';
import 'package:fit_master/src/features/exercise/screen/exercise_detail.dart';
import 'package:fit_master/src/features/exercise/screen/list_exercise.dart';
import 'package:fit_master/src/features/gymlocation/screen/GymLocation.dart';
import 'package:fit_master/src/features/login/screens/login_screen.dart';
import 'package:fit_master/src/features/login/screens/sign_up_screen.dart';
import 'package:fit_master/src/features/login/viewmodel/auth_view_model.dart';
import 'package:fit_master/src/features/main_wrapper.dart';
import 'package:fit_master/src/features/options/screens/setting_screen.dart';
import 'package:fit_master/src/features/plan/screen/complete_plan_page.dart';
import 'package:fit_master/src/features/plan/screen/doing_exercise_page.dart';
import 'package:fit_master/src/features/plan/screen/plan_today_page.dart';
import 'package:fit_master/src/features/welcome/screens/choose_fitness_goal_page.dart';
import 'package:fit_master/src/features/welcome/screens/choose_gender_page.dart';
import 'package:fit_master/src/features/welcome/screens/choose_h_and_w_page.dart';
import 'package:fit_master/src/features/welcome/screens/choose_input_type_page.dart';
import 'package:fit_master/src/features/welcome/screens/choose_year_of_birth_page.dart';
import 'package:fit_master/src/features/welcome/screens/create_profile.dart';
import 'package:fit_master/src/features/welcome/screens/training_location_page.dart';
import 'package:fit_master/src/features/welcome/screens/welcome_page.dart';
import 'package:fit_master/src/features/welcome/screens/workout_recommend.dart';
import 'package:fit_master/src/features/workout_plan/screens/dashboard_page.dart';
import 'package:fit_master/src/features/workout_plan/screens/workout_plan_detail_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../features/plan/model/workout_day.dart';

const bool isLoggedIn = true;

const String initial = "/home";
final AuthViewModel authViewModel = AuthViewModel(authRepository: locator());

// Private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHome = GlobalKey<NavigatorState>(debugLabel: 'shellHome');
final _shellNavigatorExercise =
    GlobalKey<NavigatorState>(debugLabel: 'shellExercise');
final _shellNavigatorSchedule =
    GlobalKey<NavigatorState>(debugLabel: 'shellSchedule');
final _shellNavigatorNearByGym =
    GlobalKey<NavigatorState>(debugLabel: 'shellNearByGym');
final _shellNavigatorSettings =
    GlobalKey<NavigatorState>(debugLabel: 'shellSettings');

GoRouter router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      name: 'workout-plan-detail',
      path: '/workout-plan/:id',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return WorkoutPlanDetailPage(id: id);
      },
    ),
    GoRoute(
      name: 'welcome',
      path: '/welcome',
      builder: (context, state) => const WelcomePage(),
      routes: <RouteBase>[
        GoRoute(
          name: 'welcome-choose-input-type',
          path: '/choose-input-type',
          builder: (context, state) => const ChooseDataInputTypePage(),
        ),
        GoRoute(
          name: 'welcome-choose-gender',
          path: '/choose-gender',
          builder: (context, state) => const ChooseGenderPage(),
        ),
        GoRoute(
          name: 'welcome-choose-fitness-goal',
          path: '/choose-fitness-goal',
          builder: (context, state) => const ChooseFitnessGoalPage(),
        ),
        GoRoute(
          name: 'welcome-choose-year-of-birth',
          path: '/choose-year-of-birth',
          builder: (context, state) => const ChooseYearOrBirthPage(),
        ),
        GoRoute(
          name: 'welcome-choose-height-and-weight',
          path: '/height-and-weight',
          builder: (context, state) => const ChooseHAndWPage(),
        ),
        GoRoute(
          name: 'welcome-gym-location',
          path: '/gym-location',
          builder: (context, state) => const TrainingLocationPage(),
        ),
        GoRoute(
          name: 'welcome-create-profile',
          path: '/create-profile',
          builder: (context, state) => const LoadingScreen(),
        ),
        GoRoute(
          name: 'workout-recommendation',
          path: '/workout-recommendation',
          builder: (context, state) => const WorkoutRecommendScreen(),
        ),
      ],
    ),
    GoRoute(
      name: 'login',
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: 'sign-up',
      path: '/sign-up',
      builder: (context, state) => const SignUpScreen(),
    ),

    GoRoute(
      path: '/next_exercise',
      name: 'next_exercise',
      // builder: (context, state) {
      //   final workoutDay = state.extra as WorkoutDay;
      //   return NextPracticeScreen(workoutDay: workoutDay);
      // },
      builder: (context, state) {
        final todayWorkout = state.extra as WorkoutDay;
        return DoingExercisePage(
          todayWorkout: todayWorkout,
        );
      },
    ),

    GoRoute(
      name: 'plan_complete',
      path: '/plan_complete',
      builder: (context, state) => const CompletePlanScreen(),
    ),

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
              path: "/",
              name: "home",
              builder: (BuildContext context, GoRouterState state) =>
                  const WorkoutDashBoard(),
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
              name: 'plan_today',
              path: '/plan_today',
              builder: (context, state) => const PlanTodayScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorNearByGym,
          routes: <RouteBase>[
            GoRoute(
              name: 'gym_nearby',
              path: '/gym_nearby',
              builder: (context, state) => const GymListScreen(),
            ),
          ],
        ),

        StatefulShellBranch(
          navigatorKey: _shellNavigatorSettings,
          routes: <RouteBase>[
            GoRoute(
              path: "/setting",
              name: "setting",
              builder: (context, state) => const SettingScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
  // redirect: (context, state) async {
  //   final isLoggedIn = await authViewModel.isLoggedInApp();
  //   final loggingIn = state.topRoute?.name == 'login';

  //   if (!isLoggedIn && !loggingIn) return '/welcome';
  //   if (isLoggedIn && loggingIn) return '/';
  //   return null;
  // },
);
