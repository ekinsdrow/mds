import 'package:audio_service/audio_service.dart';
import 'package:mds/common/data/models/record.dart';
import 'package:rxdart/subjects.dart';

mixin RecordStreamMixin on BaseAudioHandler {
  // ignore: close_sinks
  final recordStream = BehaviorSubject<Record?>.seeded(null);
}
