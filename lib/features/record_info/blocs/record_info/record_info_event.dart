part of 'record_info_bloc.dart';

@freezed
class RecordInfoEvent with _$RecordInfoEvent {
  const factory RecordInfoEvent.fetch({
    required Record record,
  }) = Fetch;
}
