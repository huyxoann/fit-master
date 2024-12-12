import 'package:flutter/widgets.dart';

class AppInfo {
  static const baseUrl = 'http://192.168.1.5:3000/api';

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static bool isMobileLarge(BuildContext context) {
    return getScreenHeight(context) >= 830;
  }

  static bool isMobileMedium(BuildContext context) {
    return getScreenHeight(context) >= 660 && getScreenHeight(context) < 830;
  }

  static bool isMobileSmall(BuildContext context) {
    return getScreenHeight(context) < 660;
  }

  static const loginEndPoint = "$baseUrl/auth/login";
  static const registerEndPoint = "$baseUrl/auth/register";
  static const getListExerEndPoint = "$baseUrl/exercises/list";
  static const getMyPlan = "$baseUrl/workouts/my_plan/";
  static const getWorkoutPlanInfoForCard = "$baseUrl/workouts/get_for_card/";
  static const getExerDetailEndPoint = "$baseUrl/exercises/";
  static const getRecommendedWorkoutPlan =
      "$baseUrl/workouts/create_recommendation";
}
