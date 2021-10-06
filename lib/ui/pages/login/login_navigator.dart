import 'package:valburytest/commons/base_navigator.dart';

abstract class LoginNavigator extends BaseNavigator {
  void showMainPage();

  void showErrorValidCred(String message);
}
