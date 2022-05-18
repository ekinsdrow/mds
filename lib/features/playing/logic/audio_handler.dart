import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mds/common/data/models/record.dart';
import 'package:mds/features/playing/logic/record_stream_mixin.dart';

//TODO: playing error
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
    recordStream.add(
      record,
    );

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
