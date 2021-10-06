import 'package:valburytest/commons/base_view_model.dart';
import 'package:valburytest/repository/user_repository.dart';
import 'package:valburytest/usecases/user/user_usecase.dart';

import 'profile_navigator.dart';

class ProfileViewModel extends BaseViewModel<ProfileNavigator> {
  late UserUsecase _usecase;

  ProfileViewModel() {
    _usecase = new UserUsecase(UserRepository(dioClient));
  }

  doLogout() async {
    _usecase.doLogout().then((value) {
      if (value == true) {
        getView()?.navigateToLogin();
      }
    });
  }
}
