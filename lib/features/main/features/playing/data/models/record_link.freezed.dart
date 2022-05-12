// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'record_link.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecordLink _$RecordLinkFromJson(Map<String, dynamic> json) {
  return _RecordLink.fromJson(json);
}

/// @nodoc
mixin _$RecordLink {
  String get link => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecordLinkCopyWith<RecordLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordLinkCopyWith<$Res> {
  factory $RecordLinkCopyWith(
          RecordLink value, $Res Function(RecordLink) then) =
      _$RecordLinkCopyWithImpl<$Res>;
  $Res call({String link});
}

/// @nodoc
class _$RecordLinkCopyWithImpl<$Res> implements $RecordLinkCopyWith<$Res> {
  _$RecordLinkCopyWithImpl(this._value, this._then);

  final RecordLink _value;
  // ignore: unused_field
  final $Res Function(RecordLink) _then;

  @override
  $Res call({
    Object? link = freezed,
  }) {
    return _then(_value.copyWith(
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_RecordLinkCopyWith<$Res>
    implements $RecordLinkCopyWith<$Res> {
  factory _$$_RecordLinkCopyWith(
          _$_RecordLink value, $Res Function(_$_RecordLink) then) =
      __$$_RecordLinkCopyWithImpl<$Res>;
  @override
  $Res call({String link});
}

/// @nodoc
class __$$_RecordLinkCopyWithImpl<$Res> extends _$RecordLinkCopyWithImpl<$Res>
    implements _$$_RecordLinkCopyWith<$Res> {
  __$$_RecordLinkCopyWithImpl(
      _$_RecordLink _value, $Res Function(_$_RecordLink) _then)
      : super(_value, (v) => _then(v as _$_RecordLink));

  @override
  _$_RecordLink get _value => super._value as _$_RecordLink;

  @override
  $Res call({
    Object? link = freezed,
  }) {
    return _then(_$_RecordLink(
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecordLink implements _RecordLink {
  _$_RecordLink({required this.link});

  factory _$_RecordLink.fromJson(Map<String, dynamic> json) =>
      _$$_RecordLinkFromJson(json);

  @override
  final String link;

  @override
  String toString() {
    return 'RecordLink(link: $link)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecordLink &&
            const DeepCollectionEquality().equals(other.link, link));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(link));

  @JsonKey(ignore: true)
  @override
  _$$_RecordLinkCopyWith<_$_RecordLink> get copyWith =>
      __$$_RecordLinkCopyWithImpl<_$_RecordLink>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecordLinkToJson(this);
  }
}

abstract class _RecordLink implements RecordLink {
  factory _RecordLink({required final String link}) = _$_RecordLink;

  factory _RecordLink.fromJson(Map<String, dynamic> json) =
      _$_RecordLink.fromJson;

  @override
  String get link => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RecordLinkCopyWith<_$_RecordLink> get copyWith =>
      throw _privateConstructorUsedError;
}
