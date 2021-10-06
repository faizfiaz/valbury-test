class ErrorHandler {
  int? httpCode;
  String? error;
  String? message;

  ErrorHandler(this.httpCode, this.error, this.message);

  ErrorHandler.fromJson(Map<String, dynamic> json) {
    httpCode = json['httpCode'];
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['httpCode'] = this.httpCode;
    data['error'] = this.error;
    data['message'] = this.message;
    return data;
  }
}