import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mds/common/data/models/record.dart';

//TODO: playing error
class MdsAudioHandler extends BaseAudioHandler with QueueHandler, SeekHandler {
  final AudioPlayer player;

  MdsAudioHandler({
    required this.player,
  });

  @override
  Future<void> play() async {
    await player.play();
    playbackState.add(PlayingStates.playState);
  }

  @override
  Future<void> pause() async {
    await player.pause();
    playbackState.add(PlayingStates.pauseState);
  }

  @override
  Future<void> stop() async {
    await player.stop();
    playbackState.add(PlayingStates.stopState);
  }

  Future<void> playFromUrl({
    required String url,
    required Record record,
  }) async {
    mediaItem.add(
      record.toMediaItem(),
    );
    
    
    playbackState.add(PlayingStates.loadingState);
    await player.pause();

    try {
      player.setUrl(url);
      await player.play();

      playbackState.add(PlayingStates.playState);
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
