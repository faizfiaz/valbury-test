import 'package:flutter_dotenv/flutter_dotenv.dart';

class Endpoints {
  // ignore: unused_element
  Endpoints._();

  Endpoints();

  String? baseUrl = dotenv.env['CURRENT_ENV'] == "0"
      ? dotenv.env['BASE_URL_DEV']
      : dotenv.env['BASE_URL'];

  static const int receiveTimeout = 30000;
  static const int connectionTimeout = 30000;
}
