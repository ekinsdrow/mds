import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mds/features/sleep_timer/data/models/sleep_timer_status.dart';

part 'sleep_timer_state.freezed.dart';

@freezed
class SleepTimerState with _$SleepTimerState {
  factory SleepTimerState({
    required Duration duration,
    required SleepTimerStatus status,
  }) = _SleepTimerState;

  factory SleepTimerState.defaultValue() {
    return SleepTimerState(
      duration: Duration.zero,
      status: SleepTimerStatus.stop,
    );
  }
}
