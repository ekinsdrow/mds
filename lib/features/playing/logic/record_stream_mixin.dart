import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:mds/common/data/models/record.dart';

mixin RecordStreamMixin on BaseAudioHandler {
  // ignore: close_sinks
  final recordStream = StreamController<Record>.broadcast();
}
