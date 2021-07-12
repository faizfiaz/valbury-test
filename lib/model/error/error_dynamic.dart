import 'dart:collection';

class ErrorHandlerDynamic{
  Map<String, List<dynamic>> errors = HashMap();
  int? httpCode;
  String? message;

  ErrorHandlerDynamic(this.httpCode, this.message);

  geMapping(Map<String, dynamic> map) {
    map.forEach((name, value) {
      errors.addAll({name : value});
    });
  }

  get error => errors;
}