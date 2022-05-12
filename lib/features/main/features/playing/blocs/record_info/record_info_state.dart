part of 'record_info_bloc.dart';

@freezed
class RecordInfoState with _$RecordInfoState {
  const factory RecordInfoState.initial() = _Initial;
  const factory RecordInfoState.loading() = _Loading;
  const factory RecordInfoState.error({
    required Exception error,
  }) = _Error;
  const factory RecordInfoState.success({
    required RecordLink recordLink,
  }) = _Success;
}
