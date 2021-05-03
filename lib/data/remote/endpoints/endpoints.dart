import 'package:flutter_dotenv/flutter_dotenv.dart' as environment;

class Endpoints {
  Endpoints._();

  Endpoints();

  String baseUrl = environment.env['CURRENT_ENV'] == "0"
      ? environment.env['BASE_URL_DEV']
      : environment.env['BASE_URL'];
  static String clientID = environment.env['CLIENT_ID'];
  static String innerToken = environment.env['INNER_TOKEN'];

  static const int receiveTimeout = 30000;
  static const int connectionTimeout = 30000;

  static const String googleKey = "google";
  static const String facebookKey = "facebook";
  static const String manualKey = "manual";
  static const String facebookAuthority = "www.graph.facebook.com";
  static const String facebookGraph = "/v2.12/me?fields=name,picture.width(800).height(800),first_name,last_name,email&access_token=";
}
