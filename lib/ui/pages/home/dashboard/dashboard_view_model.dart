import 'package:terkelola/commons/base_view_model.dart';
import 'package:terkelola/repository/user_repository.dart';
import 'package:terkelola/usecases/user/user_usecase.dart';

import 'dashboard_navigator.dart';

class DashboardViewModel extends BaseViewModel<DashboardNavigator> {
  late UserUsecase _usecase;

  DashboardViewModel() {
    _usecase = new UserUsecase(UserRepository(dioClient));
  }
}
