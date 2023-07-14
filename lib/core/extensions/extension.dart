import 'package:intl/intl.dart';

extension IntX on int {
  String toDateFormat([String? format]) {
    final date = DateTime.fromMillisecondsSinceEpoch(toInt());
    final formatter = DateFormat(format ?? 'yyyy-MM-dd');
    return formatter.format(date);
  }
}
