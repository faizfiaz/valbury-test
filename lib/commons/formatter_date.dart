import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'multilanguage.dart';

class FormatterDate {
  static String parseToReadable(String dates) {
    String languages = txt("current_language") == "EN" ? "en_US" : "in_ID";
    initializeDateFormatting(languages);
    var parseTime = DateTime.parse(dates).toLocal();
    return DateFormat.yMMMMd(languages).format(parseTime).toString();
  }

  static String getDateTimeNow() {
    String languages = txt("current_language") == "EN" ? "en_US" : "in_ID";
    initializeDateFormatting(languages);
    DateTime now = DateTime.now();
    return DateFormat("yyyy-MM-dd HH:mm:ss", languages).format(now).toString();
  }

  static String parseToReadableNotifications(String dates) {
    String languages = txt("current_language") == "EN" ? "en_US" : "in_ID";
    initializeDateFormatting(languages);
    var parseTime = DateTime.parse(dates).toLocal();
    return DateFormat.yMMMMd(languages).add_Hm().format(parseTime).toString();
  }

  static String parseToReadableFull(String dates) {
    String languages = txt("current_language") == "EN" ? "en_US" : "in_ID";
    initializeDateFormatting(languages);
    var parseTime = DateTime.parse(dates).toLocal();
    return DateFormat.d(languages)
        .add_MMMM()
        .add_y()
        .add_Hm()
        .format(parseTime)
        .toString();
  }

  static int parseToLong(String dates) {
    var parseTime = DateTime.parse(dates).toLocal();
    return parseTime.millisecondsSinceEpoch;
  }
}
