import 'package:flutter/material.dart';
import 'package:valburytest/commons/base_view_model.dart';
import 'package:valburytest/commons/email_validator.dart';
import 'package:valburytest/commons/multilanguage.dart';
import 'package:valburytest/data/local/user_preferences.dart';
import 'package:valburytest/repository/user_repository.dart';
import 'package:valburytest/usecases/user/user_usecase.dart';

import 'login_navigator.dart';

class LoginViewModel extends BaseViewModel<LoginNavigator> {
  var controllerEmail = TextEditingController();
  var controllerPassword = TextEditingController();

  bool errorEmail = false;
  bool errorPassword = false;

  late UserUsecase _usecase;

  LoginViewModel() {
    _usecase = new UserUsecase(UserRepository(dioClient));
    controllerEmail.addListener(checkValidEmail);
    controllerPassword.addListener(checkLengthPassword);
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
      if (value.isNotEmpty) {
        getView()?.showMainPage();
      }
    });
    showLoading(false);
  }

  doLogin() async {
    checkValidEmail();
    checkLengthPassword();
    if (!errorEmail && !errorPassword) {
      showLoading(true);
      await _usecase
          .login(controllerEmail.text, controllerPassword.text)
          .then((value) {
        showLoading(false);
        if (value.values.first != null) {
          getView()?.showError(
              value.values.first!.errors, value.values.first!.httpCode);
        } else {
          if (value.keys.first) {
            getView()?.showMainPage();
          } else {
            getView()?.showErrorValidCred(txt("wrong_cred"));
          }
        }
        // ignore: return_of_invalid_type_from_catch_error
      }).catchError((errorValue) => print(errorValue));
    }
  }
}
