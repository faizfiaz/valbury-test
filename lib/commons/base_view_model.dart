import 'package:terkelola/data/remote/client/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base_navigator.dart';
import 'multilanguage.dart';

abstract class BaseViewModel<NV extends BaseNavigator> extends ChangeNotifier {
  NV view;
  DioClient dioClient;

  bool isLoading = false;

  BaseViewModel() {
    dioClient = DioClient(Dio());
  }

  BaseViewModel setView(NV view) {
    this.view = view;
    return this;
  }

  NV getView() {
    return view;
  }

  void showLoading(bool isLoading) {
    this.isLoading = isLoading;
    notifyListeners();
  }

  void checkExpired(int httpCode) {
    // if (httpCode == 400) {
    //   getView().showExpired();
    // }
  }

  void changeLanguage(BuildContext context) async {
    String languages = Languages.en;
    final prefs = await SharedPreferences.getInstance();
    String currentLanguage = prefs.getString(langKey);
    if (currentLanguage != null) {
      if (currentLanguage == Languages.en) {
        languages = Languages.id;
      } else {
        languages = Languages.en;
      }
    }
    MultiLanguage()
        .setLanguage(path: languages, context: context)
        .then((value) {
      getView().refreshState();
      notifyListeners();
    });
  }

  void dispose();
}
