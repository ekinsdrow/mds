
import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

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

  static PlaybackState playState({
    required AudioPlayer player,
  }) {
    return PlaybackState(
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
      speed: player.speed,
      processingState: AudioProcessingState.completed,
      updatePosition: player.position,
      bufferedPosition: player.bufferedPosition,
      playing: true,
    );
  }

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