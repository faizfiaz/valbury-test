import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:terkelola/commons/multilanguage.dart';
import 'package:terkelola/constants/colors.dart';
import 'package:terkelola/constants/images.dart';
import 'package:terkelola/ui/pages/intro/intro_screen.dart';

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
      String? currentLanguage = value.getString(langKey);
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
                SvgPicture.asset(icLogo, width: 60,),
                SizedBox(width: 4,),
                Text("terkelola",
                    style: TextStyle(
                        color: white, fontSize: 48, fontWeight: FontWeight.w400)),
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
    return new Timer(duration, navigatePage);
  }

  void navigatePage() async {
    // var alreadyLogin = await usecase.hasToken();
    // if (await usecase.hasSeenIntro() == true) {
    //   // Navigator.pushAndRemoveUntil(
    //   //     context,
    //   //     MaterialPageRoute(
    //   //         builder: (context) => HomeScreen(
    //   //               0,
    //   //               alreadyLogin: alreadyLogin,
    //   //             )),
    //   //     (r) => false);
    // } else {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => IntroScreen()), (r) => false);
  }
}
