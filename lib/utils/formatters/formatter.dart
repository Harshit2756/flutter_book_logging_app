import 'package:intl/intl.dart';

class HFormatter {
  static String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('MMMM d, yyyy');
    return formatter.format(date);
  }
}
