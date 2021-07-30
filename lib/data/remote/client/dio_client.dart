import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:terkelola/commons/multilanguage.dart';
import 'package:terkelola/commons/other_utils.dart';
import 'package:terkelola/commons/screen_utils.dart';
import 'package:terkelola/data/local/user_preferences.dart';

class DioClient {
  // dio instance
  // injecting dio instance
  final Dio _dio;
  static String _hk = "2uzew%T3p8wF^E!x1BTMs6ZIbRLoDqlT";

  DioClient(this._dio);

  Map<String, dynamic> addCustomHeaders(String? currentLanguage) {
    return {
      "content-type": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Accept": "*/*",
      "Accept-Language": currentLanguage == Languages.en ? "en" : "id"
    };
  }

  Map<String, dynamic> addAuthHeaders(String token) {
    return {'Authorization': token};
  }

  // Get:-----------------------------------------------------------------------
  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    print(uri + " " + queryParameters.toString());
    String token = await UserPreferences().getToken();
    final prefs = await SharedPreferences.getInstance();
    String? currentLanguage = prefs.getString(langKey);

    if (token.isNotEmpty) {
      options = Options();
      options.headers?.addAll(addAuthHeaders(token));
    }

    if (options == null) {
      options = Options();
    }
    options.headers?.addAll(addCustomHeaders(currentLanguage));

    try {
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) {
          // if (cert.pem == NavKey.pemKey) {
          return true;
          // }
          // return false;
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
      print(response.statusCode);
      OtherUtils.printWrapped(response.data.toString());
      return response.data;
    } catch (e) {
      print(e);
      OtherUtils.printWrapped(e.toString());
      if (e.toString().toString().toLowerCase().contains("expired")) {
        ScreenUtils.expiredToken();
      }
      throw e;
    }
  }

  // Get:-----------------------------------------------------------------------
  Future<dynamic> delete(String uri,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken}) async {
    print(uri + " " + queryParameters.toString());
    String token = await UserPreferences().getToken();
    final prefs = await SharedPreferences.getInstance();
    String? currentLanguage = prefs.getString(langKey);

    if (token.isNotEmpty) {
      options = Options();
      options.headers?.addAll(addAuthHeaders(token));
    }

    if (options == null) {
      options = Options();
    }
    options.headers?.addAll(addCustomHeaders(currentLanguage));

    try {
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) {
          // if (cert.pem == NavKey.pemKey) {
          return true;
          //}
          //return false;
        };
        return client;
      };
      final Response response = await _dio.delete(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      print(response.statusCode);
      OtherUtils.printWrapped(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      if (e.toString().toString().toLowerCase().contains("expired")) {
        ScreenUtils.expiredToken();
      }
      throw e;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    print(uri + " " + queryParameters.toString());
    String token = await UserPreferences().getToken();
    final prefs = await SharedPreferences.getInstance();
    String? currentLanguage = prefs.getString(langKey);

    if (token.isNotEmpty) {
      options = Options();
      options.headers?.addAll(addAuthHeaders(token));
    }

    if (options == null) {
      options = Options();
    }
    options.headers?.addAll(addCustomHeaders(currentLanguage));

    try {
      // (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      //     (HttpClient client) {
      //   client.badCertificateCallback =
      //       (X509Certificate cert, String host, int port) {
      //     //if (cert.pem == NavKey.pemKey) {
      //     return true;
      //     //}
      //     //return false;
      //   };
      //   return client;
      // };
      final Response response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      print(response.statusCode);
      OtherUtils.printWrapped(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      if (e.toString().toString().toLowerCase().contains("expired")) {
        ScreenUtils.expiredToken();
      }
      throw e;
    }
  }

  Future<dynamic> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    print(uri + " " + queryParameters.toString());
    String token = await UserPreferences().getToken();
    final prefs = await SharedPreferences.getInstance();
    String? currentLanguage = prefs.getString(langKey);

    if (token.isNotEmpty) {
      options = Options();
      options.headers?.addAll(addAuthHeaders(token));
    }

    if (options == null) {
      options = Options();
    }
    options.headers?.addAll(addCustomHeaders(currentLanguage));

    try {
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) {
          //if (cert.pem == NavKey.pemKey) {
          return true;
          //}
          //return false;
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
      print(response.statusCode);
      OtherUtils.printWrapped(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      if (e.toString().toString().toLowerCase().contains("expired")) {
        ScreenUtils.expiredToken();
      }
      throw e;
    }
  }
}
