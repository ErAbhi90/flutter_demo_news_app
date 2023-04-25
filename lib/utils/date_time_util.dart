import 'package:intl/intl.dart';

class DateTimeUtils {
  static final DateFormat _dateTimeFormat = DateFormat("MMMM dd, yyyy hh:mm a");

  static String formatDateTime(DateTime d) => _dateTimeFormat.format(d);

  static String convertDateTimeToString(DateTime value) {
    return _dateTimeFormat.format(value);
  }

  static DateTime convertStringToDateTime(String value) {
    return _dateTimeFormat.parse(value);
  }
}
