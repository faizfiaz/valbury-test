import 'package:terkelola/data/local/user_preferences.dart';
import 'package:terkelola/model/error/error_message.dart';
import 'package:terkelola/model/response/response_login.dart';
import 'package:terkelola/repository/user_repository.dart';

import 'i_user_usecase.dart';

class UserUsecase extends IUserUsecase {
  final userSp = UserPreferences();

  UserUsecase(UserRepository repository) : super(repository);

  UserUsecase.empty() : super(null);

  @override
  Future<Map<ResponseLogin, ErrorMessage>> login(
      String email, String password) async {
    disposeVariable();
    ResponseLogin responseLogin;
    String firebaseToken = await userSp.getFirebaseToken();
    await repository
        .authenticate(
            email: email, password: password, firebaseToken: firebaseToken)
        .then((val) {
      responseLogin = val;
      userSp.setToken(responseLogin.data.token);
    }).catchError((e) async {
      mappingError(error, e).then((value) => error = value);
    });
    return Future.value({responseLogin: error});
  }

  Future<String> getFirebaseToken() async {
    String token = await userSp.getFirebaseToken();
    if (token != null) {
      return token;
    }
    return "";
  }

  hasToken() async {
    String token = await userSp.getToken();
    if (token != null) {
      return true;
    }
    return false;
  }

  setAlreadySeenIntro() async {
    await userSp.setAlreadySeenIntro();
  }

  hasSeenIntro() async {
    return await userSp.hasSeenIntro();
  }
}
