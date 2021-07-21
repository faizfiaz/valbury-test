import 'package:flutter/material.dart';
import 'package:terkelola/commons/base_view_model.dart';
import 'package:terkelola/commons/email_validator.dart';
import 'package:terkelola/repository/user_repository.dart';
import 'package:terkelola/usecases/user/user_usecase.dart';

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
    errorPassword = controllerPassword.text.length < 4 ? true : false;
    notifyListeners();
  }

  doLogin() async {
    showLoading(true);
    await _usecase
        .login(controllerEmail.text, controllerPassword.text)
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
