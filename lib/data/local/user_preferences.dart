import 'package:encrypt/encrypt.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:terkelola/commons/nav_key.dart';

class UserPreferences {
  static const String user_key = "userData";
  static const String token_key = "tokenKey";
  static const String firebase_token_key = "firebaseTokenKey";
  static const String intro_key = "introKey";
  static const String check_version_prompt = "checkVersionPrompt";

  static String _hk = "Wa!s7fCAQXGJHrVwYTiCoRcKOjnprhav";

  Future<bool> setToken(String token) async {
    final key = Key.fromUtf8(_hk);
    final iv = IV.fromLength(16);

    final _e = Encrypter(AES(key));
    final _edr = _e.encrypt(token, iv: iv);

    if (NavKey.isRunningWeb) {
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      preferences.setString(token_key, _edr.base64);
      return true;
    } else {
      final secureStorage = FlutterSecureStorage();
      await secureStorage.write(key: token_key, value: _edr.base64);
      return true;
    }
  }

  Future<String> getToken() async {
    if (NavKey.isRunningWeb) {
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      String? data = preferences.getString(token_key);
      if (data != null) {
        final key = Key.fromUtf8(_hk);
        final iv = IV.fromLength(16);

        final _e = Encrypter(AES(key));
        final _dctr = _e.decrypt64(data, iv: iv);
        return Future.value(_dctr);
      } else {
        return Future.value("");
      }
    } else {
      final secureStorage = FlutterSecureStorage();
      String? data = await secureStorage.read(key: token_key);
      if (data != null) {
        final key = Key.fromUtf8(_hk);
        final iv = IV.fromLength(16);

        final _e = Encrypter(AES(key));
        final _dctr = _e.decrypt64(data, iv: iv);
        return Future.value(_dctr);
      } else {
        return Future.value("");
      }
    }
  }

  Future<void> setAlreadySeenIntro() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(intro_key, true);
  }

  Future<bool> hasSeenIntro() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    bool? data = preferences.getBool(intro_key);
    if (data == null) {
      return Future.value(false);
    }
    return Future.value(data);
  }

  Future<bool> setFirebaseToken(String token) async {
    final secureStorage = FlutterSecureStorage();
    await secureStorage.write(key: firebase_token_key, value: token);
    return true;
  }

  Future<String> getFirebaseToken() async {
    final secureStorage = FlutterSecureStorage();
    String? data = await secureStorage.read(key: firebase_token_key);
    if (data != null) {
      return Future.value(data);
    } else {
      return Future.value("");
    }
  }

  Future<bool> clearData() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final secureStorage = FlutterSecureStorage();
    preferences.remove(user_key);
    preferences.remove(token_key);
    await secureStorage.deleteAll();
    return true;
  }
}
