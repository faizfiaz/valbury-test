import 'package:valburytest/constants/colors.dart';
import 'package:valburytest/model/error/error_message.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'multilanguage.dart';
import 'nav_key.dart';

class ScreenUtils {
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static void showDialog(
      BuildContext context, AlertType alertType, String title, String message) {
    Alert(
      context: context,
      style: AlertStyle(
          titleStyle: TextStyle(fontSize: 16),
          descStyle: TextStyle(fontSize: 14)),
      type: alertType,
      title: title,
      desc: message,
      buttons: [
        DialogButton(
          color: primary,
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }

  static void showAlertMessage(
      BuildContext context, List<Errors>? message, int? httpCode) {
    var messageText = "";
    if (message != null && message.isNotEmpty) {
      message.forEach((element) {
        messageText += "${element.error} \n";
      });
    }
    Alert(
      context: context,
      style: AlertStyle(titleStyle: TextStyle(fontSize: 14)),
      type: AlertType.error,
      title: txt("something_wrong"),
      desc: messageText.isEmpty ? txt("please_try_again_later") : messageText,
      buttons: [
        DialogButton(
          color: primary,
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }

  static void showLogout(BuildContext context, Function() doLogout) {
    Alert(
      context: context,
      style: AlertStyle(),
      type: AlertType.info,
      title: "",
      desc: txt("logout_message"),
      buttons: [
        DialogButton(
          color: primary,
          child: Text(
            txt("cancel"),
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        ),
        DialogButton(
          color: Colors.red,
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            doLogout.call();
          },
          width: 120,
        )
      ],
    ).show();
  }

  static void showExpiredMessage(BuildContext context) {
    // Alert(
    //   context: context,
    //   style: AlertStyle(),
    //   type: AlertType.error,
    //   title: txt("login_expired"),
    //   desc: txt("login_again"),
    //   buttons: [
    //     DialogButton(
    //       color: primary,
    //       child: Text(
    //         "OK",
    //         style: TextStyle(color: Colors.white, fontSize: 20),
    //       ),
    //       onPressed: () => UserUsecase.empty().logout().then((value) =>
    //           Navigator.pushAndRemoveUntil(
    //               context,
    //               MaterialPageRoute(builder: (context) => LoginScreen()),
    //               (r) => false)),
    //       width: 120,
    //     )
    //   ],
    // ).show();
  }

  static void showToastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void expiredToken() {
    if (!NavKey.isInLogin) {
      showToastMessage(txt("expired_token"));
      // UserUsecase.empty().logout().then((value) {
      NavKey.isInLogin = true;
      NavKey.navKey.currentState!.pushNamed('/login');
      // });
    }
  }
}
