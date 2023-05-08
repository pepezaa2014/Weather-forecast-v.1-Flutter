import 'package:intl/intl.dart';

class Converter {
  static double? convertTemp(double? temp) {
    if (temp != null) {
      return temp = temp - 273.15;
    }
  }

  static String convertUnix(String unix) {
    int intUnix = int.parse(unix);
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(intUnix * 1000);
    String formattedTime = DateFormat.yMMMMd().add_jms().format(dateTime);
    return formattedTime;
  }
}
