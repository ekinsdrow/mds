part of 'history_bloc.dart';

@freezed
class HistoryEvent with _$HistoryEvent {
  const factory HistoryEvent.save({
    required Record record,
  }) = _Save;
  const factory HistoryEvent.clearAll() = _Clear;
  const factory HistoryEvent.getRecordsIds() = _GetRecordsIds;
}
