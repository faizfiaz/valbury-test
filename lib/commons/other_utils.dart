import 'dart:io';

import 'package:loadmore/loadmore.dart';

import 'multilanguage.dart';

class OtherUtils {
  static bool validatePhoneNumber(String value) {
    String pattern = r'(^(?:[+0]8)[0-9]{8,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }

  static String removeJsonProp(String json) {
    return json
        .replaceAll("(", "")
        .replaceAll("[", "")
        .replaceAll("]", "")
        .replaceAll(")", "");
  }

  static List<String> splitName(String displayName) {
    var splitted = displayName.split(" ");
    return splitted;
  }

  static dynamic myEncode(dynamic item) {
    if (item is DateTime) {
      return item.toIso8601String();
    }
    if (item is File) {
      return "";
    }
    return item;
  }

  static void printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  static String? buildLoadMoreText(LoadMoreStatus status) {
    String? text = "";
    switch (status) {
      case LoadMoreStatus.fail:
        text = txt("load_more_failed");
        break;
      case LoadMoreStatus.idle:
        text = txt("load_more_idle");
        break;
      case LoadMoreStatus.loading:
        text = txt("load_more_load");
        break;
      case LoadMoreStatus.nomore:
        text = txt("load_more_finish");
        break;
      default:
        text = "";
    }
    return text;
  }

  static String getRegexPassword() {
    return r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!\#$%&\()*+,-./:;<=>?@[\]^_\`{|}~\"]).{6,}$';
  }
}
