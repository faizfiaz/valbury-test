import 'package:terkelola/commons/base_view_model.dart';
import 'package:terkelola/repository/user_repository.dart';
import 'package:terkelola/usecases/user/user_usecase.dart';

import 'empty_navigator.dart';

class EmptyViewModel extends BaseViewModel<EmptyNavigator> {
  late UserUsecase _usecase;

  EmptyViewModel() {
    _usecase = new UserUsecase(UserRepository(dioClient));
  }
}
