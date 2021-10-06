import 'package:flutter/foundation.dart';
import 'package:valburytest/data/local/user_preferences.dart';
import 'package:valburytest/model/error/error_message.dart';
import 'package:valburytest/model/request/request_user.dart';
import 'package:valburytest/model/response/response_login.dart';
import 'package:valburytest/repository/user_repository.dart';

import 'i_user_usecase.dart';

class UserUsecase extends IUserUsecase {
  final userSp = UserPreferences();

  UserUsecase(UserRepository repository) : super(repository);

  @override
  Future<Map<bool, ErrorMessage?>> login(String email, String password) async {
    disposeVariable();
    RequestUser? requestUser = await userSp.getDataUser();
    print(requestUser);
    if (requestUser != null) {
      if (requestUser.email == email && requestUser.password == password) {
        await userSp.setToken("dummyToken");
        return Future.value({true: error});
      }
    }
    return Future.value({false: error});
  }

  @override
  Future<Map<bool, ErrorMessage?>> register(
      String email, String phoneNumber, String password) async {
    disposeVariable();
    var isSuccess =
        await userSp.setDataUser(RequestUser(email, phoneNumber, password));
    return Future.value({isSuccess: error});
  }

  Future<bool> doLogout() async {
    return await userSp.clearData();
  }
}
