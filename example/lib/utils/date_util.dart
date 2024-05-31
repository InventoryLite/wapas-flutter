import 'package:intl/intl.dart';
import 'package:wapas_example/globals.dart';

formatDate(date, [String? format]) {
  if (date != null) {
    if (date.runtimeType == DateTime) {
      return DateFormat(format ?? globals.dateFormat).format(date);
    }
    return DateFormat(format ?? globals.dateFormat)
        .format(DateTime.parse(date));
  } else {
    return "...";
  }
}
