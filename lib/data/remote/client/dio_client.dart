import 'dart:io';

import 'package:base_flutter_2/commons/multilanguage.dart';
import 'package:base_flutter_2/commons/nav_key.dart';
import 'package:base_flutter_2/commons/other_utils.dart';
import 'package:base_flutter_2/commons/screen_utils.dart';
import 'package:base_flutter_2/data/local/user_preferences.dart';
import 'package:base_flutter_2/data/remote/endpoints/endpoints.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioClient {
  // dio instance
  // injecting dio instance
  final Dio _dio;
  static String _hk = "2uzew%T3p8wF^E!x1BTMs6ZIbRLoDqlT";

  DioClient(this._dio);

  // Get:-----------------------------------------------------------------------
  Future<dynamic> get(
    String uri, {
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  }) async {
    print(uri + " " + queryParameters.toString());
    String token = await UserPreferences().getToken();
    final prefs = await SharedPreferences.getInstance();
    String currentLanguage = prefs.getString(langKey);

    if (token != null) {
      var customHeaders = {
        'content-type': 'application/json',
        'Authorization': token
      };

      options = Options();
      options.headers.addAll(customHeaders);
    }

    if (options == null) {
      options = Options();
    }

    final plainText = Endpoints.clientID;
    final key = Key.fromUtf8(_hk);
    final iv = IV.fromLength(16);

    final _e = Encrypter(AES(key));
    final _edr = _e.decrypt16(plainText, iv: iv);

    if (options != null) {
      var customHeaders = {
        "content-type": "application/json",
        "Access-Control-Allow-Origin": "*",
        "Accept-Language": currentLanguage == Languages.en ? "en" : "id",
        "Client-Id": _edr
      };
      options.headers.addAll(customHeaders);
    }
    try {
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) {
          if (cert.pem == NavKey.pemKey) {
            return true;
          }
          return false;
        };
        return client;
      };
      final Response response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      OtherUtils.printWrapped(response.data.toString());
      return response.data;
    } catch (e) {
      print(e);
      OtherUtils.printWrapped(e.response);
      if (e.response.toString().toLowerCase().contains("expired")) {
        ScreenUtils.expiredToken();
      }
      throw e;
    }
  }

  Future<dynamic> getInner(
      String uri, {
        Map<String, dynamic> queryParameters,
        Options options,
        CancelToken cancelToken,
        ProgressCallback onReceiveProgress,
      }) async {
    print(uri + " " + queryParameters.toString());
    String token = await UserPreferences().getToken();
    final prefs = await SharedPreferences.getInstance();
    String currentLanguage = prefs.getString(langKey);

    if (token != null) {
      var customHeaders = {
        'content-type': 'application/json',
        'Authorization': token
      };

      options = Options();
      options.headers.addAll(customHeaders);
    }

    if (options == null) {
      options = Options();
    }

    final plainText = Endpoints.clientID;
    final key = Key.fromUtf8(_hk);
    final iv = IV.fromLength(16);

    final _e = Encrypter(AES(key));
    final _edr = _e.decrypt16(plainText, iv: iv);

    if (options != null) {
      var customHeaders = {
        "content-type": "application/json",
        "Access-Control-Allow-Origin": "*",
        "Accept-Language": currentLanguage == Languages.en ? "en" : "id",
        "Client-Id": _edr,
        "Authorization": Endpoints.innerToken
      };
      options.headers.addAll(customHeaders);
    }
    try {
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) {
          if (cert.pem == NavKey.pemKey) {
            return true;
          }
          return false;
        };
        return client;
      };
      final Response response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      OtherUtils.printWrapped(response.data.toString());
      return response.data;
    } catch (e) {
      print(e);
      OtherUtils.printWrapped(e.response);
      if (e.response.toString().toLowerCase().contains("expired")) {
        ScreenUtils.expiredToken();
      }
      throw e;
    }
  }

  // Get:-----------------------------------------------------------------------
  Future<dynamic> delete(String uri,
      {Map<String, dynamic> queryParameters,
      Options options,
      CancelToken cancelToken}) async {
    print(uri + " " + queryParameters.toString());
    String token = await UserPreferences().getToken();
    final prefs = await SharedPreferences.getInstance();
    String currentLanguage = prefs.getString(langKey);

    if (token != null) {
      var customHeaders = {
        'content-type': 'application/json',
        'Authorization': token
      };

      options = Options();
      options.headers.addAll(customHeaders);
    }

    final plainText = Endpoints.clientID;
    final key = Key.fromUtf8(_hk);
    final iv = IV.fromLength(16);

    final _e = Encrypter(AES(key));
    final _edr = _e.decrypt16(plainText, iv: iv);

    if (options != null) {
      var customHeaders = {
        "content-type": "application/json",
        "Access-Control-Allow-Origin": "*",
        "Accept-Language": currentLanguage == Languages.en ? "en" : "id",
        "Client-Id": _edr
      };
      options.headers.addAll(customHeaders);
    }
    try {
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) {
          if (cert.pem == NavKey.pemKey) {
            return true;
          }
          return false;
        };
        return client;
      };
      final Response response = await _dio.delete(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      print(response.data);
      return response.data;
    } catch (e) {
      print(e.response);
      if (e.response.toString().toLowerCase().contains("expired")) {
        ScreenUtils.expiredToken();
      }
      throw e;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    String token = await UserPreferences().getToken();
    final prefs = await SharedPreferences.getInstance();
    String currentLanguage = prefs.getString(langKey);
    if (token != null) {
      var customHeaders = {
        'content-type': 'application/json',
        'Authorization': token
      };

      options = Options();
      options.headers.addAll(customHeaders);
    }

    if (options == null) {
      options = Options();
    }

    final plainText = Endpoints.clientID;
    final key = Key.fromUtf8(_hk);
    final iv = IV.fromLength(16);

    final _e = Encrypter(AES(key));
    final _edr = _e.decrypt16(plainText, iv: iv);

    if (options != null) {
      var customHeaders = {
        "content-type": "application/json",
        "Access-Control-Allow-Origin": "*",
        "Accept": "*/*",
        "Accept-Language": currentLanguage == Languages.en ? "en" : "id",
        "Client-Id": _edr
      };
      options.headers.addAll(customHeaders);
    }

    print(uri);

    try {
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) {
          if (cert.pem == NavKey.pemKey) {
            return true;
          }
          return false;
        };
        return client;
      };
      final Response response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      print(response);
      return response.data;
    } catch (e) {
      print(e.response);
      if (e.response.toString().toLowerCase().contains("expired")) {
        ScreenUtils.expiredToken();
      }
      throw e;
    }
  }

  Future<dynamic> put(
    String uri, {
    data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    String token = await UserPreferences().getToken();
    final prefs = await SharedPreferences.getInstance();
    String currentLanguage = prefs.getString(langKey);
    if (token != null) {
      var customHeaders = {
        'content-type': 'application/json',
        'Authorization': token
      };

      options = Options();
      options.headers.addAll(customHeaders);
    }

    final plainText = Endpoints.clientID;
    final key = Key.fromUtf8(_hk);
    final iv = IV.fromLength(16);

    final _e = Encrypter(AES(key));
    final _edr = _e.decrypt16(plainText, iv: iv);

    if (options != null) {
      var customHeaders = {
        "content-type": "application/json",
        "Access-Control-Allow-Origin": "*",
        "Accept": "*/*",
        "Accept-Language": currentLanguage == Languages.en ? "en" : "id",
        "Client-Id": _edr
      };
      options.headers.addAll(customHeaders);
    }

    print(uri);

    try {
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) {
          if (cert.pem == NavKey.pemKey) {
            return true;
          }
          return false;
        };
        return client;
      };
      final Response response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      print(response);
      print(response.statusCode);
      return response.data;
    } catch (e) {
      print(e.response);
      if (e.response.toString().toLowerCase().contains("expired")) {
        ScreenUtils.expiredToken();
      }
      throw e;
    }
  }
}
