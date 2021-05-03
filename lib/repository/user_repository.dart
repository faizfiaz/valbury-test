import 'package:base_flutter_2/data/remote/client/dio_client.dart';
import 'package:base_flutter_2/data/remote/endpoints/user_endpoints.dart';
import 'package:base_flutter_2/model/response/response_login.dart';
import 'package:flutter/material.dart';

import 'base_repository.dart';

class UserRepository extends BaseRepository {
  UserRepository(DioClient dioClient) : super(dioClient);

  dynamic data;

  Future<ResponseLogin> authenticate(
      {@required String email,
      @required String password,
      @required String firebaseToken}) async {
    await dioClient.post(UserEndpoint.urlLogin, data: {
      "identity": email,
      "password": password,
      "firebase_token": firebaseToken
    }).then((value) {
      data = value;
    });
    return ResponseLogin.fromJson(data);
  }
}
