part of 'history_bloc.dart';

@freezed
class HistoryState with _$HistoryState {
  const factory HistoryState.initial({
    required List<String> ids,
  }) = _Records;
  const factory HistoryState.error() = _Error;
}
