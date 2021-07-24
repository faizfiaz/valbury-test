import 'package:terkelola/data/local/user_preferences.dart';
import 'package:terkelola/model/error/error_message.dart';
import 'package:terkelola/model/response/response_login.dart';
import 'package:terkelola/repository/user_repository.dart';

import 'i_user_usecase.dart';

class UserUsecase extends IUserUsecase {
  final userSp = UserPreferences();

  UserUsecase(UserRepository repository) : super(repository);

  @override
  Future<Map<ResponseLogin?, ErrorMessage?>> login(
      String email, String password) async {
    disposeVariable();
    ResponseLogin? responseLogin;
    String firebaseToken = await userSp.getFirebaseToken();
    await repository
        .authenticate(
            email: email, password: password, firebaseToken: firebaseToken)
        .then((val) {
      responseLogin = val;
      if (responseLogin != null &&
          responseLogin!.data != null &&
          responseLogin!.data!.token != null) {
        userSp.setToken(responseLogin!.data!.token!);
      }
    }).catchError((e) async {
      mappingError(error, e).then((value) => error = value);
    });
    return Future.value({responseLogin: error});
  }
}
