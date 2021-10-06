import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:valburytest/commons/base_state_widget.dart';
import 'package:valburytest/commons/multilanguage.dart';
import 'package:valburytest/commons/screen_utils.dart';
import 'package:valburytest/constants/colors.dart';
import 'package:valburytest/constants/images.dart';
import 'package:valburytest/data/local/user_preferences.dart';
import 'package:valburytest/routes.dart';
import 'package:valburytest/ui/widgets/version_text.dart';

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
      backgroundColor: white,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imgCompanyLogo,
                  width: ScreenUtils.getScreenWidth(context) - 120,
                ),
              ],
            ),
          ),
          VersionText()
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
      value.isNotEmpty
          ? navigatePage(homeRN, clearBackStack: true)
          : navigatePage(loginRN, clearBackStack: true);
      // if (value.isNotEmpty) {
      //   checkIntroState(userPreferences, true);
      // } else {
      //   checkIntroState(userPreferences, false);
      // }
    });
  }

  void checkIntroState(UserPreferences userPreferences, bool alreadyLogin) {
    // userPreferences.hasSeenIntro().then((value) {
    //   /**
    //    * if value false mean not yet see intro
    //    * if value true mean already see intro
    //    ***/
    //   // if (!value) {
    //   //   navigatePage(introRN, clearBackStack: true);
    //   // } else {
    //    alreadyLogin
    //         ? navigatePage(homeRN, clearBackStack: true)
    //         : navigatePage(loginRN, clearBackStack: true);
    //   // }
    // });
  }
}
