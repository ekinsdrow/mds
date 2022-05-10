import 'package:mds/common/extensions/add_zero.dart';

extension DurationExtension on Duration {
  String format() {
    final secondsFormat = inSeconds;
    final h = secondsFormat ~/ 3600;
    final m = (secondsFormat - h * 3600) ~/ 60;
    final s = secondsFormat - h * 3600 - m * 60;

    return '${AddZero.addZero(h)}:${AddZero.addZero(m)}:${AddZero.addZero(s)}';
  }
}
