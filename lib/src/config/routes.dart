// import 'package:fit_master/src/features/welcome/screens/welcome_page_3.dart';
// import 'package:fit_master/src/features/welcome/screens/welcome_page_4.dart';
// import 'package:fit_master/src/features/welcome/screens/welcome_page_5.dart';
// import 'package:fit_master/src/features/welcome/screens/welcome_page_6.dart';
// import 'package:fit_master/src/features/welcome/screens/welcome_page_7.dart';
import 'package:fit_master/src/features/exercise/screen/list_exercise.dart';
import 'package:fit_master/src/features/login/screens/login_screen.dart';
import 'package:fit_master/src/features/welcome/screens/choose_fitness_goal_page.dart';
import 'package:fit_master/src/features/welcome/screens/choose_gender_page.dart';
import 'package:fit_master/src/features/welcome/screens/choose_h_and_w_page.dart';
import 'package:fit_master/src/features/welcome/screens/choose_input_type_page.dart';
import 'package:fit_master/src/features/welcome/screens/choose_year_of_birth_page.dart';
import 'package:fit_master/src/features/welcome/screens/create_profile.dart';
import 'package:fit_master/src/features/welcome/screens/training_location_page.dart';
import 'package:fit_master/src/features/welcome/screens/welcome_page.dart';
import 'package:fit_master/src/home_page.dart';
import 'package:go_router/go_router.dart';

// import '../src/features/welcome/screens/welcome_page_2.dart';

const bool isLoggedIn = true;

final router = GoRouter(
  initialLocation: isLoggedIn ? '/' : '/welcome/choose-year-of-birth',
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) => const MyHomePage(title: "Home"),
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
      ],
    ),
    GoRoute(
        name: 'exercises',
        path: '/exercises',
        builder: (context, state) => const ListExerciseScreen()),
    GoRoute(
      name: 'login',
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    )
  ],
);
