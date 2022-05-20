import 'dart:async';
import 'dart:developer';
import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mds/common/data/models/record.dart';
import 'package:mds/features/playing/data/models/skip_actions.dart';
import 'package:mds/features/playing/logic/playing_states.dart';
import 'package:rxdart/rxdart.dart';

class MdsAudioHandler extends BaseAudioHandler
    with
        PositionStreamMixin,
        RecordStreamMixin,
        RecordQueueMixin,
        SkipActionsMixin {
  final AudioPlayer _player;

  MdsAudioHandler(
    this._player,
  ) {
    _player.positionStream.listen(
      (event) {
        _positionStream.add(event);
      },
    );
  }

  @override
  Future<void> play() async {
    _player.play();
    playbackState.add(
      PlayingStates.playState(
        player: _player,
      ),
    );
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

  @override
  Future<void> seek(Duration position) => _player.seek(position);

  @override
  Future<void> skipToNext() async {
    playbackState.add(PlayingStates.pauseState);
    await _player.pause();

    final queue = recordQueueStream.value;

    if (_queueIndex == queue.length - 1) {
      _queueIndex = 0;
    } else {
      _queueIndex += 1;
    }

    addSkipAction(
      NextSkip(queue[_queueIndex]),
    );
  }

  @override
  Future<void> skipToPrevious() async {
    playbackState.add(PlayingStates.pauseState);
    await _player.pause();

    final queue = recordQueueStream.value;

    if (_queueIndex == 0) {
      _queueIndex = queue.length - 1;
    } else {
      _queueIndex -= 1;
    }

    addSkipAction(
      PreviousSkip(
        queue[_queueIndex],
      ),
    );
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

      final queue = recordQueueStream.value;

      _queueIndex =
          queue.indexWhere((element) => element.recordId == record.recordId);

      log(_queueIndex.toString());

      try {
        await _player.setUrl(url);
        playbackState.add(
          PlayingStates.playState(
            player: _player,
          ),
        );

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

    final oldQueue = recordQueueStream.value;

    List<Record> newQueue = [
      for (final rec in oldQueue)
        if (rec.recordId == record.recordId) record else rec
    ];

    setRecordQueue(newQueue);
  }
}

mixin RecordStreamMixin on BaseAudioHandler {
  final _recordStream = BehaviorSubject<Record?>.seeded(null);
  ValueStream<Record?> get recordStream => _recordStream.stream;
}

mixin PositionStreamMixin on BaseAudioHandler {
  final _positionStream = BehaviorSubject<Duration>.seeded(
    Duration.zero,
  );

  ValueStream<Duration> get positionStream => _positionStream.stream;
}

mixin RecordQueueMixin on BaseAudioHandler {
  final _recordQueue = BehaviorSubject<List<Record>>.seeded([]);
  ValueStream<List<Record>> get recordQueueStream => _recordQueue.stream;

  var _queueIndex = 0;

  void setRecordQueue(List<Record> records) {
    _recordQueue.add(records);
  }
}


mixin SkipActionsMixin on BaseAudioHandler {
  final _skipActionStream = BehaviorSubject<SkipAction?>.seeded(null);
  ValueStream<SkipAction?> get skipActionStream => _skipActionStream.stream;

  addSkipAction(SkipAction skipAction) {
    _skipActionStream.add(skipAction);
  }
}
