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
import 'package:terkelola/ui/widgets/app_bar_custom.dart';
import 'package:terkelola/ui/widgets/default_button.dart';
import 'package:terkelola/ui/widgets/loading_indicator.dart';

import 'login_navigator.dart';
import 'login_view_model.dart';

class LoginScreen extends StatefulWidget {
  // ignore: must_be_immutable
  bool backToPreviousPage;

  LoginScreen({this.backToPreviousPage = false});

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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return ChangeNotifierProvider<LoginViewModel>(
        create: (context) => _viewModel,
        child: Consumer<LoginViewModel>(
            builder: (context, viewModel, _) => Scaffold(
                  appBar: AppBarCustom.trans() as PreferredSizeWidget?,
                  backgroundColor: white,
                  body: Container(
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.white,
                          alignment: Alignment.center,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                buildTitle(),
                                SizedBox(
                                  height: 30,
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
                )));
  }

  Widget buildTitle() {
    return Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: SvgPicture.asset(
          icLogoRed,
          width: ScreenUtils.getScreenWidth(context) - 120,
        ));
  }

  @override
  void showError(List<Errors>? error, int? httpCode) {
    ScreenUtils.showAlertMessage(context, error, httpCode);
  }

  displayRegister() {
    // push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => RegisterScreen(
    //               registerVia: Endpoints.manualKey,
    //             )));
  }

  @override
  void showMainPage() {
    if (widget.backToPreviousPage) {
      Navigator.pop(context, true);
    } else {
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => HomeScreen(
      //               0,
      //               alreadyLogin: true,
      //             )),
      //     (r) => false);
    }
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
                Text("Login", style: BaseStyle.textBold28),
                SizedBox(
                  height: 24,
                ),
                TextField(
                  style: TextStyle(fontSize: 12),
                  decoration: ,
                  controller: _viewModel.controllerEmail,
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: _viewModel.controllerPassword,
                  obscureText: !passwordVisible,
                  style: TextStyle(fontSize: 12),
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 14.0),
                      prefixIcon: Container(
                        margin: EdgeInsets.only(
                            right: 16, left: 16, top: 4, bottom: 4),
                        padding: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              //                   <--- left side
                              color: primaryText,
                              width: 0.5,
                            ),
                          ),
                        ),
                        child: Icon(
                          Icons.account_balance,
                          color: primary,
                          size: 18,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: primaryText, width: 0.5)),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: primaryText, width: 0.5)),
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
                  height: 16,
                ),
                DefaultButton.redButton(
                    context, txt("login"), () => _viewModel.doLogin()),
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
          Text(
            txt("login_with"),
            style: TextStyle(
                color: primary, fontWeight: FontWeight.w400, fontSize: 12),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => _viewModel.handleSignInGoogle(),
                  child: SvgPicture.asset(
                    icGoogle,
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => _viewModel.handleSignInFacebook(),
                  child: SvgPicture.asset(
                    icFacebook,
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 48,
          ),
          Material(
            color: white,
            child: InkWell(
              onTap: () => displayRegister(),
              child: RichText(
                text: TextSpan(
                    text: txt("signup_message"),
                    style: TextStyle(color: Colors.black, fontSize: 12),
                    children: <TextSpan>[
                      TextSpan(
                          text: "  " + txt("signup_here"),
                          style: TextStyle(
                              color: primary,
                              fontSize: 12,
                              fontWeight: FontWeight.w800))
                    ]),
              ),
            ),
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

  @override
  void showRegisterThirdParty(
      // ignore: override_on_non_overriding_member
      String email,
      String displayName,
      String photoUrl,
      String registerVia) {
    // push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => RegisterScreen(
    //             email: email,
    //             displayName: displayName,
    //             photoUrl: photoUrl,
    //             registerVia: registerVia)));
  }

  displayForgotPassword() {
    // push(context,
    //     MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
  }
}
