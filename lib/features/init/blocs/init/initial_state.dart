part of 'initial_bloc.dart';

@freezed
class InitialState with _$InitialState {
  const factory InitialState.loading() = _Loading;
  const factory InitialState.error({
    required Exception error,
  }) = _Error;
  const factory InitialState.success({
    required List<Record> records,
  }) = _Success;
}
