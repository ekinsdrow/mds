import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mds/common/data/models/record.dart';
import 'package:rxdart/rxdart.dart';

class MdsAudioHandler extends BaseAudioHandler
    with QueueHandler, SeekHandler, RecordStreamMixin {
  final AudioPlayer _player;

  MdsAudioHandler(
    this._player,
  );

  @override
  Future<void> play() async {
    _player.play();
    playbackState.add(PlayingStates.playState);
  }

  @override
  Future<void> pause() async {
    await _player.pause();
    playbackState.add(PlayingStates.pauseState);
  }

  @override
  Future<void> stop() async {
    await _player.stop();
    playbackState.add(PlayingStates.stopState);
  }

  Future<void> playFromUrl({
    required String url,
    required Record record,
  }) async {
    if (record.recordId == _recordStream.value?.recordId) {
      if (playbackState.value.playing) {
        pause();
      } else {
        play();
      }
    } else {
      addRecord(record);

      playbackState.add(PlayingStates.loadingState);
      await _player.pause();

      try {
        await _player.setUrl(url);
        playbackState.add(PlayingStates.playState);

        _player.play();
      } catch (_) {
        playbackState.add(PlayingStates.errorState);
      }
    }
  }

  void addRecord(Record record) {
    _recordStream.add(
      record,
    );

    mediaItem.add(
      record.toMediaItem(),
    );
  }
}

abstract class PlayingStates {
  static PlaybackState stopState = PlaybackState(
    controls: [],
    systemActions: const {},
    processingState: AudioProcessingState.idle,
    playing: false,
  );

  static PlaybackState loadingState = PlaybackState(
    controls: [],
    systemActions: const {},
    processingState: AudioProcessingState.loading,
    playing: false,
  );

  static PlaybackState playState = PlaybackState(
    controls: [
      MediaControl.skipToPrevious,
      MediaControl.pause,
      MediaControl.stop,
      MediaControl.skipToNext,
    ],
    systemActions: const {
      MediaAction.seek,
      MediaAction.seekForward,
      MediaAction.seekBackward,
    },
    androidCompactActionIndices: const [0, 1, 3],
    processingState: AudioProcessingState.completed,
    playing: true,
  );

  static PlaybackState pauseState = PlaybackState(
    controls: [
      MediaControl.skipToPrevious,
      MediaControl.play,
      MediaControl.stop,
      MediaControl.skipToNext,
    ],
    systemActions: const {
      MediaAction.seek,
      MediaAction.seekForward,
      MediaAction.seekBackward,
    },
    androidCompactActionIndices: const [0, 1, 3],
    processingState: AudioProcessingState.ready,
    playing: false,
  );

  static PlaybackState errorState = PlaybackState(
    controls: [],
    systemActions: const {},
    processingState: AudioProcessingState.error,
    playing: false,
  );
}

mixin RecordStreamMixin on BaseAudioHandler {
  // ignore: close_sinks
  final _recordStream = BehaviorSubject<Record?>.seeded(null);
  ValueStream<Record?> get recordStream => _recordStream.stream;
}
