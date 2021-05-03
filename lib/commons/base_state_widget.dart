import 'package:base_flutter_2/commons/screen_utils.dart';
import 'package:base_flutter_2/model/error/error_message.dart';
import 'package:flutter/material.dart';
import 'package:need_resume/need_resume.dart';

import 'base_navigator.dart';
import 'multilanguage.dart';

class BaseStateWidget<S extends StatefulWidget> extends ResumableState<S>
    with BaseNavigator {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  void changeLanguage(String languages) {
    MultiLanguage().setLanguage(path: languages, context: context);
  }

  @override
  Widget build(BuildContext context) {}

  void setLoading(bool condition) {
    isLoading = condition;
  }

  @override
  void setLoadingPage(bool condition) {
    setLoading(condition);
  }

  @override
  void showError(List<Errors> error, int httpCode) {
    checkExpired(error, httpCode);
  }

  void checkExpired(List<Errors> error, int httpCode) {
    if (httpCode == 400) {
      showExpired();
    } else {
      ScreenUtils.showAlertMessage(context, error, httpCode);
    }
  }

  @override
  void showExpired() {
    ScreenUtils.showExpiredMessage(context);
  }

  @override
  void refreshState() {
    setState(() {});
  }
}
