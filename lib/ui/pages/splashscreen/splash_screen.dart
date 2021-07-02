import 'dart:async';

import 'package:terkelola/commons/multilanguage.dart';
import 'package:terkelola/constants/colors.dart';
import 'package:terkelola/usecases/user/user_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as environment;
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() {
    return new _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final prefs = SharedPreferences.getInstance();
    String languages = Languages.id;
    prefs.then((value) {
      String currentLanguage = value.getString(langKey);
      if (currentLanguage != null) languages = currentLanguage;
      var languageSetting =
          MultiLanguage().setLanguage(path: languages, context: context);
      languageSetting.then((value) {
        if (value) {
          startTimer();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            child: Text("SplashScreen"),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.all(20),
            child: Text(
              "App Version " +
                  environment.env['VERSION_NAME'] +
                  (environment.env['CURRENT_ENV'] == "0" ? "-DEV" : ""),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 9, fontWeight: FontWeight.w600, color: primary),
            ),
          ),
        ],
      ),
    );
  }

  startTimer() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, navigatePage);
  }

  void navigatePage() async {
    UserUsecase usecase = UserUsecase.empty();
    var alreadyLogin = await usecase.hasToken();
    if (await usecase.hasSeenIntro() == true) {
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => HomeScreen(
      //               0,
      //               alreadyLogin: alreadyLogin,
      //             )),
      //     (r) => false);
    } else {
      // Navigator.pushAndRemoveUntil(context,
      //     MaterialPageRoute(builder: (context) => IntroScreen()), (r) => false);
    }
  }
}
