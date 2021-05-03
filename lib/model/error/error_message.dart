class ErrorMessage {
  int httpCode;
  List<Errors> errors;
  Meta meta;

  ErrorMessage({this.errors, this.meta, this.httpCode});

  ErrorMessage.fromJson(Map<String, dynamic> json) {
    if (json['errors'] != null) {
      errors = new List<Errors>();
      json['errors'].forEach((v) {
        errors.add(new Errors.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.errors != null) {
      data['errors'] = this.errors.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    data['httpCode'] = this.httpCode;
    return data;
  }
}

class Errors {
  String error;

  Errors({this.error});

  Errors.fromJson(Map<String, dynamic> json) {
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    return data;
  }
}

class Meta {
  String message;

  Meta({this.message});

  Meta.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}

