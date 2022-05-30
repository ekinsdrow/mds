// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'history_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HistoryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Record record) save,
    required TResult Function() clearAll,
    required TResult Function() getRecordsIds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Record record)? save,
    TResult Function()? clearAll,
    TResult Function()? getRecordsIds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Record record)? save,
    TResult Function()? clearAll,
    TResult Function()? getRecordsIds,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Save value) save,
    required TResult Function(_Clear value) clearAll,
    required TResult Function(_GetRecordsIds value) getRecordsIds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Save value)? save,
    TResult Function(_Clear value)? clearAll,
    TResult Function(_GetRecordsIds value)? getRecordsIds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Save value)? save,
    TResult Function(_Clear value)? clearAll,
    TResult Function(_GetRecordsIds value)? getRecordsIds,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryEventCopyWith<$Res> {
  factory $HistoryEventCopyWith(
          HistoryEvent value, $Res Function(HistoryEvent) then) =
      _$HistoryEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$HistoryEventCopyWithImpl<$Res> implements $HistoryEventCopyWith<$Res> {
  _$HistoryEventCopyWithImpl(this._value, this._then);

  final HistoryEvent _value;
  // ignore: unused_field
  final $Res Function(HistoryEvent) _then;
}

/// @nodoc
abstract class _$$_SaveCopyWith<$Res> {
  factory _$$_SaveCopyWith(_$_Save value, $Res Function(_$_Save) then) =
      __$$_SaveCopyWithImpl<$Res>;
  $Res call({Record record});

  $RecordCopyWith<$Res> get record;
}

/// @nodoc
class __$$_SaveCopyWithImpl<$Res> extends _$HistoryEventCopyWithImpl<$Res>
    implements _$$_SaveCopyWith<$Res> {
  __$$_SaveCopyWithImpl(_$_Save _value, $Res Function(_$_Save) _then)
      : super(_value, (v) => _then(v as _$_Save));

  @override
  _$_Save get _value => super._value as _$_Save;

  @override
  $Res call({
    Object? record = freezed,
  }) {
    return _then(_$_Save(
      record: record == freezed
          ? _value.record
          : record // ignore: cast_nullable_to_non_nullable
              as Record,
    ));
  }

  @override
  $RecordCopyWith<$Res> get record {
    return $RecordCopyWith<$Res>(_value.record, (value) {
      return _then(_value.copyWith(record: value));
    });
  }
}

/// @nodoc

class _$_Save implements _Save {
  const _$_Save({required this.record});

  @override
  final Record record;

  @override
  String toString() {
    return 'HistoryEvent.save(record: $record)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Save &&
            const DeepCollectionEquality().equals(other.record, record));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(record));

  @JsonKey(ignore: true)
  @override
  _$$_SaveCopyWith<_$_Save> get copyWith =>
      __$$_SaveCopyWithImpl<_$_Save>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Record record) save,
    required TResult Function() clearAll,
    required TResult Function() getRecordsIds,
  }) {
    return save(record);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Record record)? save,
    TResult Function()? clearAll,
    TResult Function()? getRecordsIds,
  }) {
    return save?.call(record);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Record record)? save,
    TResult Function()? clearAll,
    TResult Function()? getRecordsIds,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save(record);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Save value) save,
    required TResult Function(_Clear value) clearAll,
    required TResult Function(_GetRecordsIds value) getRecordsIds,
  }) {
    return save(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Save value)? save,
    TResult Function(_Clear value)? clearAll,
    TResult Function(_GetRecordsIds value)? getRecordsIds,
  }) {
    return save?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Save value)? save,
    TResult Function(_Clear value)? clearAll,
    TResult Function(_GetRecordsIds value)? getRecordsIds,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save(this);
    }
    return orElse();
  }
}

abstract class _Save implements HistoryEvent {
  const factory _Save({required final Record record}) = _$_Save;

  Record get record => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_SaveCopyWith<_$_Save> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ClearCopyWith<$Res> {
  factory _$$_ClearCopyWith(_$_Clear value, $Res Function(_$_Clear) then) =
      __$$_ClearCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ClearCopyWithImpl<$Res> extends _$HistoryEventCopyWithImpl<$Res>
    implements _$$_ClearCopyWith<$Res> {
  __$$_ClearCopyWithImpl(_$_Clear _value, $Res Function(_$_Clear) _then)
      : super(_value, (v) => _then(v as _$_Clear));

  @override
  _$_Clear get _value => super._value as _$_Clear;
}

/// @nodoc

class _$_Clear implements _Clear {
  const _$_Clear();

  @override
  String toString() {
    return 'HistoryEvent.clearAll()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Clear);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Record record) save,
    required TResult Function() clearAll,
    required TResult Function() getRecordsIds,
  }) {
    return clearAll();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Record record)? save,
    TResult Function()? clearAll,
    TResult Function()? getRecordsIds,
  }) {
    return clearAll?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Record record)? save,
    TResult Function()? clearAll,
    TResult Function()? getRecordsIds,
    required TResult orElse(),
  }) {
    if (clearAll != null) {
      return clearAll();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Save value) save,
    required TResult Function(_Clear value) clearAll,
    required TResult Function(_GetRecordsIds value) getRecordsIds,
  }) {
    return clearAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Save value)? save,
    TResult Function(_Clear value)? clearAll,
    TResult Function(_GetRecordsIds value)? getRecordsIds,
  }) {
    return clearAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Save value)? save,
    TResult Function(_Clear value)? clearAll,
    TResult Function(_GetRecordsIds value)? getRecordsIds,
    required TResult orElse(),
  }) {
    if (clearAll != null) {
      return clearAll(this);
    }
    return orElse();
  }
}

abstract class _Clear implements HistoryEvent {
  const factory _Clear() = _$_Clear;
}

/// @nodoc
abstract class _$$_GetRecordsIdsCopyWith<$Res> {
  factory _$$_GetRecordsIdsCopyWith(
          _$_GetRecordsIds value, $Res Function(_$_GetRecordsIds) then) =
      __$$_GetRecordsIdsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetRecordsIdsCopyWithImpl<$Res>
    extends _$HistoryEventCopyWithImpl<$Res>
    implements _$$_GetRecordsIdsCopyWith<$Res> {
  __$$_GetRecordsIdsCopyWithImpl(
      _$_GetRecordsIds _value, $Res Function(_$_GetRecordsIds) _then)
      : super(_value, (v) => _then(v as _$_GetRecordsIds));

  @override
  _$_GetRecordsIds get _value => super._value as _$_GetRecordsIds;
}

/// @nodoc

class _$_GetRecordsIds implements _GetRecordsIds {
  const _$_GetRecordsIds();

  @override
  String toString() {
    return 'HistoryEvent.getRecordsIds()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetRecordsIds);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Record record) save,
    required TResult Function() clearAll,
    required TResult Function() getRecordsIds,
  }) {
    return getRecordsIds();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Record record)? save,
    TResult Function()? clearAll,
    TResult Function()? getRecordsIds,
  }) {
    return getRecordsIds?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Record record)? save,
    TResult Function()? clearAll,
    TResult Function()? getRecordsIds,
    required TResult orElse(),
  }) {
    if (getRecordsIds != null) {
      return getRecordsIds();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Save value) save,
    required TResult Function(_Clear value) clearAll,
    required TResult Function(_GetRecordsIds value) getRecordsIds,
  }) {
    return getRecordsIds(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Save value)? save,
    TResult Function(_Clear value)? clearAll,
    TResult Function(_GetRecordsIds value)? getRecordsIds,
  }) {
    return getRecordsIds?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Save value)? save,
    TResult Function(_Clear value)? clearAll,
    TResult Function(_GetRecordsIds value)? getRecordsIds,
    required TResult orElse(),
  }) {
    if (getRecordsIds != null) {
      return getRecordsIds(this);
    }
    return orElse();
  }
}

abstract class _GetRecordsIds implements HistoryEvent {
  const factory _GetRecordsIds() = _$_GetRecordsIds;
}

/// @nodoc
mixin _$HistoryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> ids) initial,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<String> ids)? initial,
    TResult Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> ids)? initial,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Records value) initial,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Records value)? initial,
    TResult Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Records value)? initial,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryStateCopyWith<$Res> {
  factory $HistoryStateCopyWith(
          HistoryState value, $Res Function(HistoryState) then) =
      _$HistoryStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$HistoryStateCopyWithImpl<$Res> implements $HistoryStateCopyWith<$Res> {
  _$HistoryStateCopyWithImpl(this._value, this._then);

  final HistoryState _value;
  // ignore: unused_field
  final $Res Function(HistoryState) _then;
}

/// @nodoc
abstract class _$$_RecordsCopyWith<$Res> {
  factory _$$_RecordsCopyWith(
          _$_Records value, $Res Function(_$_Records) then) =
      __$$_RecordsCopyWithImpl<$Res>;
  $Res call({List<String> ids});
}

/// @nodoc
class __$$_RecordsCopyWithImpl<$Res> extends _$HistoryStateCopyWithImpl<$Res>
    implements _$$_RecordsCopyWith<$Res> {
  __$$_RecordsCopyWithImpl(_$_Records _value, $Res Function(_$_Records) _then)
      : super(_value, (v) => _then(v as _$_Records));

  @override
  _$_Records get _value => super._value as _$_Records;

  @override
  $Res call({
    Object? ids = freezed,
  }) {
    return _then(_$_Records(
      ids: ids == freezed
          ? _value._ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_Records implements _Records {
  const _$_Records({required final List<String> ids}) : _ids = ids;

  final List<String> _ids;
  @override
  List<String> get ids {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ids);
  }

  @override
  String toString() {
    return 'HistoryState.initial(ids: $ids)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Records &&
            const DeepCollectionEquality().equals(other._ids, _ids));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_ids));

  @JsonKey(ignore: true)
  @override
  _$$_RecordsCopyWith<_$_Records> get copyWith =>
      __$$_RecordsCopyWithImpl<_$_Records>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> ids) initial,
    required TResult Function() error,
  }) {
    return initial(ids);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<String> ids)? initial,
    TResult Function()? error,
  }) {
    return initial?.call(ids);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> ids)? initial,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(ids);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Records value) initial,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Records value)? initial,
    TResult Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Records value)? initial,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Records implements HistoryState {
  const factory _Records({required final List<String> ids}) = _$_Records;

  List<String> get ids => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_RecordsCopyWith<_$_Records> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res> extends _$HistoryStateCopyWithImpl<$Res>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, (v) => _then(v as _$_Error));

  @override
  _$_Error get _value => super._value as _$_Error;
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error();

  @override
  String toString() {
    return 'HistoryState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Error);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> ids) initial,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<String> ids)? initial,
    TResult Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> ids)? initial,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Records value) initial,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Records value)? initial,
    TResult Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Records value)? initial,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements HistoryState {
  const factory _Error() = _$_Error;
}
