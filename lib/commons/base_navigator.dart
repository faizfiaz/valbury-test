import 'package:terkelola/model/error/error_message.dart';

abstract class BaseNavigator {
  void setLoadingPage(bool condition);

  void showError(List<Errors> error, int httpCode);

  void showExpired() {}

  void refreshState();
}
