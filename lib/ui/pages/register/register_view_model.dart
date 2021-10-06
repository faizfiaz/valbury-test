import 'package:flutter/material.dart';
import 'package:valburytest/commons/base_view_model.dart';
import 'package:valburytest/commons/email_validator.dart';
import 'package:valburytest/data/local/user_preferences.dart';
import 'package:valburytest/repository/user_repository.dart';
import 'package:valburytest/usecases/user/user_usecase.dart';

import 'register_navigator.dart';

class RegisterViewModel extends BaseViewModel<RegisterNavigator> {
  var controllerEmail = TextEditingController();
  var controllerPhoneNumber = TextEditingController();
  var controllerPassword = TextEditingController();

  bool errorEmail = false;
  bool errorPhoneNumber = false;
  bool errorPassword = false;

  late UserUsecase _usecase;

  RegisterViewModel() {
    _usecase = new UserUsecase(UserRepository(dioClient));
    controllerEmail.addListener(checkValidEmail);
    controllerPhoneNumber.addListener(checkValidPhoneNumber);
    controllerPassword.addListener(checkLengthPassword);
  }

  void checkValidPhoneNumber() {
    RegExp regExp = new RegExp(
      r"^(08|62|02)\d{4,8}$",
      caseSensitive: false,
      multiLine: false,
    );
    errorPhoneNumber = !regExp.hasMatch(controllerPhoneNumber.text);
    notifyListeners();
  }

  void checkValidEmail() {
    errorEmail = !EmailValidator.validate(controllerEmail.text);
    notifyListeners();
  }

  void checkLengthPassword() {
    errorPassword = controllerPassword.text.length < 6 ? true : false;
    notifyListeners();
  }

  void checkToken() {
    showLoading(true);
    UserPreferences userPreferences = UserPreferences();
    userPreferences.getToken().then((value) {
      print(value);
      if (value.isNotEmpty) {
        getView()?.showMainPage();
      }
    });
    showLoading(false);
  }

  doLogin() async {
    checkValidEmail();
    checkLengthPassword();
    checkValidPhoneNumber();
    if (!errorEmail && !errorPassword && !errorPhoneNumber) {
      showLoading(true);
      await _usecase
          .register(controllerEmail.text, controllerPhoneNumber.text,
              controllerPassword.text)
          .then((value) {
        showLoading(false);
        if (value.values.first != null) {
          getView()?.showError(
              value.values.first!.errors, value.values.first!.httpCode);
        } else {
          getView()?.showMainPage();
        }
        // ignore: return_of_invalid_type_from_catch_error
      }).catchError((errorValue) => print(errorValue));
    }
  }
}
