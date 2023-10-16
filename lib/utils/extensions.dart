import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';

class Extensions {
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
