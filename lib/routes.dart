import 'package:flutter/material.dart';
import 'ui/pages/home/home_screen.dart';
import 'ui/pages/login/login_screen.dart';
import 'ui/pages/notification/notification_list_screen.dart';
import 'ui/pages/register/register_screen.dart';
import 'ui/pages/splashscreen/splash_screen.dart';

const String rootRN = "/";
const String loginRN = "/login";
const String registerRN = "/register";
const String homeRN = "/home";
const String notificationRN = "/notification";

final routes = {
  //Beginning Route
  rootRN: (BuildContext context) => SplashScreen(),
  loginRN: (BuildContext context) => LoginScreen(),
  registerRN: (BuildContext context) => RegisterScreen(),

  //Home route
  homeRN: (BuildContext context) => HomeScreen(),
  notificationRN: (BuildContext context) => NotificationListScreen()
};
