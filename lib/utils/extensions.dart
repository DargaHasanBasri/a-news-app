import 'package:intl/intl.dart';

class Extensions {

  static DateTime getDateTime(String? date) {
    if (date == "" || date == null) {
      return DateTime.now();
    } else {
      DateTime dateTime = DateTime.parse(date);
      return dateTime;
    }
  }

  static String getHourDate(String? date) {
    if (date == "" || date == null) {
      return "";
    } else {
      DateTime dateTime = DateTime.parse(date);
      DateFormat dateFormat = DateFormat("HH:mm");
      String time = dateFormat.format(dateTime);
      return time;
    }
  }

  static String getDayDate(DateTime? date) {
    if (date == null) {
      return "";
    } else {
      DateFormat dateFormat = DateFormat("EEEE", "tr_TR");
      String day = dateFormat.format(date);
      return day;
    }
  }
}
