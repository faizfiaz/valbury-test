class RequestUser {
  String email = "";
  String phoneNumber = "";
  String password = "";

  RequestUser(this.email, this.phoneNumber, this.password);

  RequestUser.fromJson(Map<dynamic, dynamic> json) {
    email = json['email'];
    phoneNumber = json['phone_number'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['password'] = this.password;
    return data;
  }
}
