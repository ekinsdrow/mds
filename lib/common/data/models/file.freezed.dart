// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

File _$FileFromJson(Map<String, dynamic> json) {
  return _File.fromJson(json);
}

/// @nodoc
mixin _$File {
  String get bitrate => throw _privateConstructorUsedError;
  String get size => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration')
  String get durationString => throw _privateConstructorUsedError;
  @JsonKey(name: 'file_id')
  String get fileId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FileCopyWith<File> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileCopyWith<$Res> {
  factory $FileCopyWith(File value, $Res Function(File) then) =
      _$FileCopyWithImpl<$Res>;
  $Res call(
      {String bitrate,
      String size,
      @JsonKey(name: 'duration') String durationString,
      @JsonKey(name: 'file_id') String fileId});
}

/// @nodoc
class _$FileCopyWithImpl<$Res> implements $FileCopyWith<$Res> {
  _$FileCopyWithImpl(this._value, this._then);

  final File _value;
  // ignore: unused_field
  final $Res Function(File) _then;

  @override
  $Res call({
    Object? bitrate = freezed,
    Object? size = freezed,
    Object? durationString = freezed,
    Object? fileId = freezed,
  }) {
    return _then(_value.copyWith(
      bitrate: bitrate == freezed
          ? _value.bitrate
          : bitrate // ignore: cast_nullable_to_non_nullable
              as String,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      durationString: durationString == freezed
          ? _value.durationString
          : durationString // ignore: cast_nullable_to_non_nullable
              as String,
      fileId: fileId == freezed
          ? _value.fileId
          : fileId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_FileCopyWith<$Res> implements $FileCopyWith<$Res> {
  factory _$$_FileCopyWith(_$_File value, $Res Function(_$_File) then) =
      __$$_FileCopyWithImpl<$Res>;
  @override
  $Res call(
      {String bitrate,
      String size,
      @JsonKey(name: 'duration') String durationString,
      @JsonKey(name: 'file_id') String fileId});
}

/// @nodoc
class __$$_FileCopyWithImpl<$Res> extends _$FileCopyWithImpl<$Res>
    implements _$$_FileCopyWith<$Res> {
  __$$_FileCopyWithImpl(_$_File _value, $Res Function(_$_File) _then)
      : super(_value, (v) => _then(v as _$_File));

  @override
  _$_File get _value => super._value as _$_File;

  @override
  $Res call({
    Object? bitrate = freezed,
    Object? size = freezed,
    Object? durationString = freezed,
    Object? fileId = freezed,
  }) {
    return _then(_$_File(
      bitrate: bitrate == freezed
          ? _value.bitrate
          : bitrate // ignore: cast_nullable_to_non_nullable
              as String,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      durationString: durationString == freezed
          ? _value.durationString
          : durationString // ignore: cast_nullable_to_non_nullable
              as String,
      fileId: fileId == freezed
          ? _value.fileId
          : fileId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_File extends _File {
  _$_File(
      {required this.bitrate,
      required this.size,
      @JsonKey(name: 'duration') required this.durationString,
      @JsonKey(name: 'file_id') required this.fileId})
      : super._();

  factory _$_File.fromJson(Map<String, dynamic> json) => _$$_FileFromJson(json);

  @override
  final String bitrate;
  @override
  final String size;
  @override
  @JsonKey(name: 'duration')
  final String durationString;
  @override
  @JsonKey(name: 'file_id')
  final String fileId;

  @override
  String toString() {
    return 'File(bitrate: $bitrate, size: $size, durationString: $durationString, fileId: $fileId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_File &&
            const DeepCollectionEquality().equals(other.bitrate, bitrate) &&
            const DeepCollectionEquality().equals(other.size, size) &&
            const DeepCollectionEquality()
                .equals(other.durationString, durationString) &&
            const DeepCollectionEquality().equals(other.fileId, fileId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(bitrate),
      const DeepCollectionEquality().hash(size),
      const DeepCollectionEquality().hash(durationString),
      const DeepCollectionEquality().hash(fileId));

  @JsonKey(ignore: true)
  @override
  _$$_FileCopyWith<_$_File> get copyWith =>
      __$$_FileCopyWithImpl<_$_File>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FileToJson(this);
  }
}

abstract class _File extends File {
  factory _File(
      {required final String bitrate,
      required final String size,
      @JsonKey(name: 'duration') required final String durationString,
      @JsonKey(name: 'file_id') required final String fileId}) = _$_File;
  _File._() : super._();

  factory _File.fromJson(Map<String, dynamic> json) = _$_File.fromJson;

  @override
  String get bitrate => throw _privateConstructorUsedError;
  @override
  String get size => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'duration')
  String get durationString => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'file_id')
  String get fileId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FileCopyWith<_$_File> get copyWith => throw _privateConstructorUsedError;
}
