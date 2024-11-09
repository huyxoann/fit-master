import 'package:flutter/widgets.dart';

class AppInfo {
  static const baseUrl = 'http://127.0.0.1:3000/api';

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

  static const loginEndPoint = "$baseUrl/auth/signin";
  static const registerEndPoint = "$baseUrl/auth/register";
  static const getListExerEndPoint = "$baseUrl/exercises/list";
}
