import 'dart:async';
import 'dart:isolate';

import 'package:mds/features/sleep_timer/data/models/sleep_timer_state.dart';
import 'package:mds/features/sleep_timer/data/models/sleep_timer_status.dart';
import 'package:rxdart/rxdart.dart';

class SleepTimer {
  SleepTimer._();
  static SleepTimer get instance => SleepTimer._();

  BehaviorSubject<SleepTimerState>? _stateStream;
  Stream<SleepTimerState> get stateStream => _stateStream != null
      ? _stateStream!.stream
      : BehaviorSubject.seeded(
          SleepTimerState.defaultValue(),
        );

  Isolate? _isolate;
  ReceivePort? _receivePort;

  Future<void> start(Duration duration) async {
    _stateStream = BehaviorSubject.seeded(
      SleepTimerState(
        duration: duration,
        status: SleepTimerStatus.play,
      ),
    );

    _receivePort = ReceivePort();

    _receivePort!.listen(_listenIsolateMessages);

    _isolate = await Isolate.spawn(
      _timer,
      {
        'duration': duration,
        'port': _receivePort!.sendPort,
      },
    );
  }

  void pause() {
    _stateStream?.add(
      _stateStream?.value.copyWith(status: SleepTimerStatus.pause),
    );
  }

  void stop() {
    _stateStream?.add(
      _stateStream?.value.copyWith(
        duration: Duration.zero,
        status: SleepTimerStatus.stop,
      ),
    );

    _stateStream?.close();
    _receivePort?.close();
    _isolate?.kill();
  }

  void _listenIsolateMessages(dynamic message) {
    if (message is SleepTimerState) {
      _stateStream?.add(message);
    } else if (message is String) {
      if (message == 'stop') {
        stop();
      }
    }
  }

  void _timer(dynamic message) {
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
  }
}
