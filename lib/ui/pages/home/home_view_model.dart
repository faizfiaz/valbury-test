import 'package:terkelola/commons/base_view_model.dart';
import 'package:terkelola/repository/user_repository.dart';
import 'package:terkelola/usecases/user/user_usecase.dart';

import 'home_navigator.dart';

class HomeViewModel extends BaseViewModel<HomeNavigator> {
  late UserUsecase _usecase;

  HomeViewModel() {
    _usecase = new UserUsecase(UserRepository(dioClient));
  }
}
