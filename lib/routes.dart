import 'package:flutter/material.dart';
import 'package:terkelola/ui/pages/home/home_screen.dart';
import 'package:terkelola/ui/pages/login/login_screen.dart';
import 'package:terkelola/ui/pages/splashscreen/splash_screen.dart';

final routes = {
  '/': (BuildContext context) => new SplashScreen(),
  '/login': (BuildContext context) => new LoginScreen(),
  '/home': (BuildContext context) => new HomeScreen()
};
