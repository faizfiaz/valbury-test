import 'package:valburytest/commons/base_view_model.dart';
import 'package:valburytest/repository/user_repository.dart';
import 'package:valburytest/usecases/user/user_usecase.dart';

import 'empty_navigator.dart';

class EmptyViewModel extends BaseViewModel<EmptyNavigator> {
  late UserUsecase _usecase;

  EmptyViewModel() {
    _usecase = new UserUsecase(UserRepository(dioClient));
  }
}
