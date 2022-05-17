import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

class MdsAudioHandler extends BaseAudioHandler with QueueHandler, SeekHandler {
  final AudioPlayer player;

  MdsAudioHandler({
    required this.player,
  });

  @override
  Future<void> play() async {
    await player.play();
  }

  @override
  Future<void> pause() async {
    await player.pause();
  }

  @override
  Future<void> stop() async {
    await player.stop();
  }

  @override
  Future<void> playFromMediaId(
    String mediaId, [
    Map<String, dynamic>? extras,
  ]) async {
    await player.pause();
    
    final item = queue.value.firstWhere(
      (element) => element.id == mediaId,
    );

    await player.setUrl(
      item.extras!['url'],
    );

    await player.play();
  }
}
