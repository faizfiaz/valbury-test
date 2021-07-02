import 'package:terkelola/model/error/error_message.dart';
import 'package:terkelola/model/response/response_login.dart';
import 'package:terkelola/repository/user_repository.dart';

import '../base_usecase.dart';

abstract class IUserUsecase extends BaseUsecase<UserRepository> {
  IUserUsecase(UserRepository repository) : super(repository);

  Future<Map<ResponseLogin, ErrorMessage>> login(String email, String password);
}
