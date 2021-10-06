import 'package:valburytest/model/error/error_message.dart';
import 'package:valburytest/model/response/response_login.dart';
import 'package:valburytest/repository/user_repository.dart';

import '../base_usecase.dart';

abstract class IUserUsecase extends BaseUsecase<UserRepository> {
  IUserUsecase(UserRepository repository) : super(repository);

  Future<Map<bool, ErrorMessage?>> login(String email, String password);

  Future<Map<bool, ErrorMessage?>> register(
      String email, String phoneNumber, String password);
}
