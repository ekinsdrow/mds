// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sleep_timer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SleepTimerState {
  Duration get duration => throw _privateConstructorUsedError;
  SleepTimerStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SleepTimerStateCopyWith<SleepTimerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SleepTimerStateCopyWith<$Res> {
  factory $SleepTimerStateCopyWith(
          SleepTimerState value, $Res Function(SleepTimerState) then) =
      _$SleepTimerStateCopyWithImpl<$Res>;
  $Res call({Duration duration, SleepTimerStatus status});
}

/// @nodoc
class _$SleepTimerStateCopyWithImpl<$Res>
    implements $SleepTimerStateCopyWith<$Res> {
  _$SleepTimerStateCopyWithImpl(this._value, this._then);

  final SleepTimerState _value;
  // ignore: unused_field
  final $Res Function(SleepTimerState) _then;

  @override
  $Res call({
    Object? duration = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SleepTimerStatus,
    ));
  }
}

/// @nodoc
abstract class _$$_SleepTimerStateCopyWith<$Res>
    implements $SleepTimerStateCopyWith<$Res> {
  factory _$$_SleepTimerStateCopyWith(
          _$_SleepTimerState value, $Res Function(_$_SleepTimerState) then) =
      __$$_SleepTimerStateCopyWithImpl<$Res>;
  @override
  $Res call({Duration duration, SleepTimerStatus status});
}

/// @nodoc
class __$$_SleepTimerStateCopyWithImpl<$Res>
    extends _$SleepTimerStateCopyWithImpl<$Res>
    implements _$$_SleepTimerStateCopyWith<$Res> {
  __$$_SleepTimerStateCopyWithImpl(
      _$_SleepTimerState _value, $Res Function(_$_SleepTimerState) _then)
      : super(_value, (v) => _then(v as _$_SleepTimerState));

  @override
  _$_SleepTimerState get _value => super._value as _$_SleepTimerState;

  @override
  $Res call({
    Object? duration = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_SleepTimerState(
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SleepTimerStatus,
    ));
  }
}

/// @nodoc

class _$_SleepTimerState implements _SleepTimerState {
  _$_SleepTimerState({required this.duration, required this.status});

  @override
  final Duration duration;
  @override
  final SleepTimerStatus status;

  @override
  String toString() {
    return 'SleepTimerState(duration: $duration, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SleepTimerState &&
            const DeepCollectionEquality().equals(other.duration, duration) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(duration),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_SleepTimerStateCopyWith<_$_SleepTimerState> get copyWith =>
      __$$_SleepTimerStateCopyWithImpl<_$_SleepTimerState>(this, _$identity);
}

abstract class _SleepTimerState implements SleepTimerState {
  factory _SleepTimerState(
      {required final Duration duration,
      required final SleepTimerStatus status}) = _$_SleepTimerState;

  @override
  Duration get duration => throw _privateConstructorUsedError;
  @override
  SleepTimerStatus get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SleepTimerStateCopyWith<_$_SleepTimerState> get copyWith =>
      throw _privateConstructorUsedError;
}
