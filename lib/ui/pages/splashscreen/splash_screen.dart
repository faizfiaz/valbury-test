import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:terkelola/commons/base_state_widget.dart';
import 'package:terkelola/commons/multilanguage.dart';
import 'package:terkelola/commons/screen_utils.dart';
import 'package:terkelola/constants/colors.dart';
import 'package:terkelola/constants/images.dart';
import 'package:terkelola/data/local/user_preferences.dart';
import 'package:terkelola/routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() {
    return new _SplashScreenState();
  }
}

class _SplashScreenState extends BaseStateWidget<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final prefs = SharedPreferences.getInstance();
    String languages = Languages.id;
    prefs.then((value) {
      String? currentLanguage = value.getString(langKey);
      if (currentLanguage != null) languages = currentLanguage;
      var languageSetting =
          MultiLanguage().setLanguage(path: languages, context: context);
      languageSetting.then((value) {
        if (value) {
          if ((defaultTargetPlatform == TargetPlatform.iOS) ||
              (defaultTargetPlatform == TargetPlatform.android)) {
            startTimer();
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  icLogo,
                  width: ScreenUtils.getScreenWidth(context) - 120,
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.all(20),
            child: Text(
              "App Version " +
                  dotenv.env['VERSION_NAME']! +
                  (dotenv.env['CURRENT_ENV'] == "0" ? "-DEV" : ""),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w600,
                color: white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  startTimer() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, checkToken);
  }

  void checkToken() async {
    UserPreferences userPreferences = UserPreferences();
    userPreferences.getToken().then((value) {
      if (value.isNotEmpty) {
        checkIntroState(userPreferences, true);
      } else {
        checkIntroState(userPreferences, false);
      }
    });
  }

  void checkIntroState(UserPreferences userPreferences, bool alreadyLogin) {
    userPreferences.hasSeenIntro().then((value) {
      /**
       * if value false mean not yet see intro
       * if value true mean already see intro
       ***/
      if (!value) {
        navigatePage(introRN, clearBackStack: true);
      } else {
        alreadyLogin
            ? navigatePage(homeRN, clearBackStack: true)
            : navigatePage(loginRN, clearBackStack: true);
      }
    });
  }
}
