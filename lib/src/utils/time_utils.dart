import 'package:easy_localization/easy_localization.dart';

mixin TimeUtils {
  static String convertDateFormat(DateTime? date) {
    if (date == null) return 'N/A';
    final format = DateFormat('d MMM yyyy');
    return format.format(date);
  }

  static String convertTimeFormat(DateTime time) {
    final format = DateFormat('h:mm a');
    return format.format(time);
  }

  static String convertDateTimeFormat(DateTime date) {
    final format = DateFormat('d MMM yyyy h:mm a');
    return format.format(date);
  }
}
