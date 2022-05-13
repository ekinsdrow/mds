// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'record_link_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecordLinkBody _$RecordLinkBodyFromJson(Map<String, dynamic> json) {
  return _RecordLinkBody.fromJson(json);
}

/// @nodoc
mixin _$RecordLinkBody {
  @JsonKey(name: 'file_id')
  String get fileId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecordLinkBodyCopyWith<RecordLinkBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordLinkBodyCopyWith<$Res> {
  factory $RecordLinkBodyCopyWith(
          RecordLinkBody value, $Res Function(RecordLinkBody) then) =
      _$RecordLinkBodyCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'file_id') String fileId});
}

/// @nodoc
class _$RecordLinkBodyCopyWithImpl<$Res>
    implements $RecordLinkBodyCopyWith<$Res> {
  _$RecordLinkBodyCopyWithImpl(this._value, this._then);

  final RecordLinkBody _value;
  // ignore: unused_field
  final $Res Function(RecordLinkBody) _then;

  @override
  $Res call({
    Object? fileId = freezed,
  }) {
    return _then(_value.copyWith(
      fileId: fileId == freezed
          ? _value.fileId
          : fileId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_RecordLinkBodyCopyWith<$Res>
    implements $RecordLinkBodyCopyWith<$Res> {
  factory _$$_RecordLinkBodyCopyWith(
          _$_RecordLinkBody value, $Res Function(_$_RecordLinkBody) then) =
      __$$_RecordLinkBodyCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'file_id') String fileId});
}

/// @nodoc
class __$$_RecordLinkBodyCopyWithImpl<$Res>
    extends _$RecordLinkBodyCopyWithImpl<$Res>
    implements _$$_RecordLinkBodyCopyWith<$Res> {
  __$$_RecordLinkBodyCopyWithImpl(
      _$_RecordLinkBody _value, $Res Function(_$_RecordLinkBody) _then)
      : super(_value, (v) => _then(v as _$_RecordLinkBody));

  @override
  _$_RecordLinkBody get _value => super._value as _$_RecordLinkBody;

  @override
  $Res call({
    Object? fileId = freezed,
  }) {
    return _then(_$_RecordLinkBody(
      fileId: fileId == freezed
          ? _value.fileId
          : fileId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecordLinkBody implements _RecordLinkBody {
  _$_RecordLinkBody({@JsonKey(name: 'file_id') required this.fileId});

  factory _$_RecordLinkBody.fromJson(Map<String, dynamic> json) =>
      _$$_RecordLinkBodyFromJson(json);

  @override
  @JsonKey(name: 'file_id')
  final String fileId;

  @override
  String toString() {
    return 'RecordLinkBody(fileId: $fileId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecordLinkBody &&
            const DeepCollectionEquality().equals(other.fileId, fileId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(fileId));

  @JsonKey(ignore: true)
  @override
  _$$_RecordLinkBodyCopyWith<_$_RecordLinkBody> get copyWith =>
      __$$_RecordLinkBodyCopyWithImpl<_$_RecordLinkBody>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecordLinkBodyToJson(this);
  }
}

abstract class _RecordLinkBody implements RecordLinkBody {
  factory _RecordLinkBody(
          {@JsonKey(name: 'file_id') required final String fileId}) =
      _$_RecordLinkBody;

  factory _RecordLinkBody.fromJson(Map<String, dynamic> json) =
      _$_RecordLinkBody.fromJson;

  @override
  @JsonKey(name: 'file_id')
  String get fileId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RecordLinkBodyCopyWith<_$_RecordLinkBody> get copyWith =>
      throw _privateConstructorUsedError;
}
