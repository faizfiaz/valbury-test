import 'package:base_flutter_2/model/error/error_message.dart';
import 'package:base_flutter_2/model/response/response_login.dart';
import 'package:base_flutter_2/repository/user_repository.dart';

import '../base_usecase.dart';

abstract class IUserUsecase extends BaseUsecase<UserRepository> {
  IUserUsecase(UserRepository repository) : super(repository);

  Future<Map<ResponseLogin, ErrorMessage>> login(String email, String password);
}
