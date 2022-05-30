import 'dart:async';
import 'dart:isolate';

import 'package:mds/features/sleep_timer/data/models/sleep_timer_state.dart';
import 'package:mds/features/sleep_timer/data/models/sleep_timer_status.dart';
import 'package:rxdart/rxdart.dart';

// stop play
class SleepTimer {
  SleepTimer._();
  static SleepTimer instance = SleepTimer._();

  final _stateStream = BehaviorSubject<SleepTimerState>.seeded(
    SleepTimerState.defaultValue(),
  );

  Stream<SleepTimerState> get stateStream => _stateStream.stream;

  ReceivePort? _receivePort;

  Future<void> start(Duration duration) async {
    _stateStream.add(
      SleepTimerState(
        duration: duration,
        status: SleepTimerStatus.play,
      ),
    );

    _receivePort = ReceivePort();

    _receivePort!.listen(_listenIsolateMessages);

    _spawnIsolate(
      duration,
      _receivePort!.sendPort,
    );
  }

  void stop() {
    _stateStream.add(
      _stateStream.value.copyWith(
        duration: Duration.zero,
        status: SleepTimerStatus.stop,
      ),
    );

    _receivePort?.close();
  }

  void _listenIsolateMessages(dynamic message) {
    if (message is SleepTimerState) {
      _stateStream.add(message);
    } else if (message is String) {
      if (message == 'stop') {
        stop();
      }
    }
  }

  void _spawnIsolate(
    Duration duration,
    SendPort sendPort,
  ) {
    Isolate.spawn<Map<String, dynamic>>(
      (message) {
        final duration = message['duration'] as Duration;
        final port = message['port'] as SendPort;

        Timer.periodic(
          const Duration(
            seconds: 1,
          ),
          (timer) {
            if (timer.tick == duration.inSeconds) {
              port.send('stop');
              timer.cancel();
            }

            port.send(
              SleepTimerState(
                duration: duration -
                    Duration(
                      seconds: timer.tick,
                    ),
                status: SleepTimerStatus.play,
              ),
            );
          },
        );
      },
      {
        'duration': duration,
        'port': sendPort,
      },
    );
  }
}
