import 'package:flutter/material.dart';
import 'package:terkelola/ui/pages/intro/intro_screen.dart';

import 'ui/pages/home/home_screen.dart';
import 'ui/pages/login/login_screen.dart';
import 'ui/pages/notification/notification_list_screen.dart';
import 'ui/pages/splashscreen/splash_screen.dart';

const String rootRN = "/";
const String introRN = "/intro";
const String loginRN = "/login";
const String homeRN = "/home";
const String notificationRN = "/notification";

final routes = {
  //Beginning Route
  rootRN: (BuildContext context) => SplashScreen(),
  introRN: (BuildContext context) => IntroScreen(),
  loginRN: (BuildContext context) => LoginScreen(),

  //Home route
  homeRN: (BuildContext context) => HomeScreen(),
  notificationRN: (BuildContext context) => NotificationListScreen()
};
