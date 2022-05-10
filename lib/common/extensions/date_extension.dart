import 'package:mds/common/extensions/add_zero.dart';

extension DateExtension on DateTime {
  String formatDate() {
    return '${AddZero.addZero(day)}/${AddZero.addZero(month)}/$year';
  }
}
