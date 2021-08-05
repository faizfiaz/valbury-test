import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:terkelola/commons/base_state_widget.dart';
import 'package:terkelola/commons/multilanguage.dart';
import 'package:terkelola/commons/nav_key.dart';
import 'package:terkelola/commons/screen_utils.dart';
import 'package:terkelola/constants/colors.dart';
import 'package:terkelola/constants/images.dart';
import 'package:terkelola/constants/styles.dart';
import 'package:terkelola/model/error/error_message.dart';
import 'package:terkelola/ui/widgets/default_button.dart';
import 'package:terkelola/ui/widgets/loading_indicator.dart';

import 'login_navigator.dart';
import 'login_view_model.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen();

  @override
  State<StatefulWidget> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends BaseStateWidget<LoginScreen>
    implements LoginNavigator {
  late LoginViewModel _viewModel;

  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _viewModel = LoginViewModel().setView(this) as LoginViewModel;
    if (NavKey.isRunningWeb) {
      _viewModel.checkToken();
    }
  }

  @override
  void dispose() {
    super.dispose();
    NavKey.isInLogin = false;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return ChangeNotifierProvider<LoginViewModel>(
        create: (context) => _viewModel,
        child: Consumer<LoginViewModel>(
            builder: (context, viewModel, _) => Scaffold(
                  backgroundColor: white,
                  body: SafeArea(
                    child: Container(
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  buildTitle(),
                                  SizedBox(
                                    height: 32,
                                  ),
                                  buildContentLogin()
                                ],
                              ),
                            ),
                          ),
                          viewModel.isLoading ? LoadingIndicator() : Container()
                        ],
                      ),
                    ),
                  ),
                )));
  }

  Widget buildTitle() {
    return Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 12, top: 12),
        child: SvgPicture.asset(
          icLogoRed,
          width: ScreenUtils.getScreenWidth(context) - 120,
        ));
  }

  @override
  void showError(List<Errors>? error, int? httpCode) {
    ScreenUtils.showAlertMessage(context, error, httpCode);
  }

  @override
  void showMainPage() {
    Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
  }

  Widget buildContentLogin() {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Email", style: BaseStyle.textSemiBold16),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  style: TextStyle(fontSize: 12),
                  decoration: InputDecoration(
                      contentPadding: BaseStyle.defaultPaddingTextField,
                      focusedBorder: BaseStyle.defaultBorderFocusedTextField,
                      enabledBorder: BaseStyle.defaultBorderTextField,
                      border: BaseStyle.defaultBorderTextField,
                      hintText: "Email",
                      errorText: _viewModel.errorEmail
                          ? txt("email_not_valid")
                          : null),
                  controller: _viewModel.controllerEmail,
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  "Password",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: _viewModel.controllerPassword,
                  obscureText: !passwordVisible,
                  style: TextStyle(fontSize: 12),
                  decoration: InputDecoration(
                      contentPadding: BaseStyle.defaultPaddingTextField,
                      focusedBorder: BaseStyle.defaultBorderFocusedTextField,
                      enabledBorder: BaseStyle.defaultBorderTextField,
                      border: BaseStyle.defaultBorderTextField,
                      hintText: "Passsword",
                      errorText: _viewModel.errorPassword
                          ? txt("password_minimum_6")
                          : null,
                      suffixIcon: IconButton(
                        icon: Icon(passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                      )),
                ),
                SizedBox(
                  height: 48,
                ),
                DefaultButton.redButton(
                    context, txt("login"), () => _viewModel.doLogin()),
                SizedBox(
                  height: 8,
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Material(
                    color: Colors.white,
                    child: InkWell(
                      child: Container(
                          padding: EdgeInsets.only(top: 16, bottom: 16),
                          child: Text(
                            txt("forgot_password"),
                            style: TextStyle(color: primary, fontSize: 12),
                          )),
                      onTap: () => displayForgotPassword(),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 10,
          ),
          Material(
            color: white,
            child: InkWell(
              onTap: () => _viewModel.changeLanguage(context),
              child: Text(
                txt("current_language"),
                style: TextStyle(
                    color: primary, fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  displayForgotPassword() {
    // push(context,
    //     MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
  }
}
