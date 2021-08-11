import 'package:terkelola/commons/base_view_model.dart';
import 'package:terkelola/repository/user_repository.dart';
import 'package:terkelola/usecases/user/user_usecase.dart';

import 'profile_navigator.dart';

class ProfileViewModel extends BaseViewModel<ProfileNavigator> {
  late UserUsecase _usecase;

  ProfileViewModel() {
    _usecase = new UserUsecase(UserRepository(dioClient));
  }
}
