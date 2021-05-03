class ResponseLogin {
  LoginData data;
  Null meta;

  ResponseLogin({this.data, this.meta});

  ResponseLogin.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new LoginData.fromJson(json['data']) : null;
    meta = json['meta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['meta'] = this.meta;
    return data;
  }
}

class LoginData {
  String token;

  LoginData({this.token});

  LoginData.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }
}

