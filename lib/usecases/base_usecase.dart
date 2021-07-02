import 'dart:convert';

import 'package:terkelola/commons/multilanguage.dart';
import 'package:terkelola/model/error/error_dynamic.dart';
import 'package:terkelola/model/error/error_message.dart';
import 'package:terkelola/repository/base_repository.dart';

abstract class BaseUsecase<R extends BaseRepository> {
  R repository;

  ErrorMessage error;
  ErrorHandlerDynamic errorHandlerDynamic;

  BaseUsecase(this.repository);

  Future<ErrorMessage> mappingError(ErrorMessage error, dynamic e) async {
    print(e);
    print(e.response.toString());
    try {
      error = ErrorMessage.fromJson(jsonDecode(e.response.toString()));
      error.httpCode = e.response.statusCode;
      return Future.value(error);
    } catch (NoSuchMethodError) {
      var errorDefault = [Errors(error: txt("something_wrong"))];
      error = ErrorMessage(
          errors: errorDefault, meta: null, httpCode: 0);
      return Future.value(error);
    }
  }

  Future<ErrorHandlerDynamic> mappingErrorDynamic(
      ErrorHandlerDynamic error, dynamic e) async {
    error = ErrorHandlerDynamic(0, "");
    try {
      var decoded = jsonDecode(e.response.toString());
      error.geMapping(decoded['errors']);
      error.httpCode = e.response.statusCode;
      error.message = decoded['message'];
      return Future.value(error);
    } catch (NoSuchMethodError) {
      error = ErrorHandlerDynamic(e.response.statusCode, e.response.toString());
      return Future.value(error);
    }
  }

  void disposeVariable() {
    error = null;
    errorHandlerDynamic = null;
  }
}
