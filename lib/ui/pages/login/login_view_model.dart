import 'dart:convert';

import 'package:terkelola/commons/base_view_model.dart';
import 'package:terkelola/commons/email_validator.dart';
import 'package:terkelola/data/remote/endpoints/endpoints.dart';
import 'package:terkelola/model/entity/facebook_data.dart';
import 'package:terkelola/repository/user_repository.dart';
import 'package:terkelola/usecases/user/user_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import 'login_navigator.dart';

class LoginViewModel extends BaseViewModel<LoginNavigator> {
  var controllerEmail = TextEditingController();
  var controllerPassword = TextEditingController();

  bool errorEmail = false;
  bool errorPassword = false;

  UserUsecase _usecase;

  GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount _currentUser;
  FacebookData data;

  LoginViewModel() {
    _usecase = new UserUsecase(UserRepository(dioClient));
    controllerEmail.addListener(checkValidEmail);
    controllerPassword.addListener(checkLengthPassword);

    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      _currentUser = account;
      if (_currentUser != null) {
        _currentUser.authentication.then((value) {
          //Success Login Google
          // doLoginThirdParty(
          //     _currentUser.email, value.idToken, Endpoints.googleKey);
        });
      }
    });
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
    notifyListeners();
    await _usecase
        .login(controllerEmail.text, controllerPassword.text)
        .then((value) {
      showLoading(false);
      if (value.values.first != null) {
        getView()
            .showError(value.values.first.errors, value.values.first.httpCode);
      } else {
        getView().showMainPage();
      }
    }).catchError((errorValue) => print(errorValue));
  }

  Future<void> handleSignInGoogle() async {
    try {
      await _googleSignIn.signOut();
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  handleSignInFacebook() async {
    final facebookLogin = FacebookLogin();
    facebookLogin.logOut();
    final result = await facebookLogin.logIn(['email']);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        fetchUserData(result.accessToken);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("canceled");
        break;
      case FacebookLoginStatus.error:
        print("error");
        break;
    }
  }

  Future<void> fetchUserData(FacebookAccessToken accessToken) async {
    showLoading(true);
    final token = accessToken.token;
    final graphResponse = await http.get(Uri.https(
        Endpoints.facebookAuthority, Endpoints.facebookGraph + token));
    final profile = jsonDecode(graphResponse.body);
    data = FacebookData.fromJson(profile);
    if (data != null) {
      //Success Login Facebook
      // doLoginThirdParty(data.email, token, Endpoints.facebookKey);
    }
    showLoading(false);
  }
}
