// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'history_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HistoryRecord {

 required get id => throw _privateConstructorUsedError;







@JsonKey(ignore: true)
$HistoryRecordCopyWith<HistoryRecord> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $HistoryRecordCopyWith<$Res>  {
  factory $HistoryRecordCopyWith(HistoryRecord value, $Res Function(HistoryRecord) then) = _$HistoryRecordCopyWithImpl<$Res>;
$Res call({
 required id
});



}

/// @nodoc
class _$HistoryRecordCopyWithImpl<$Res> implements $HistoryRecordCopyWith<$Res> {
  _$HistoryRecordCopyWithImpl(this._value, this._then);

  final HistoryRecord _value;
  // ignore: unused_field
  final $Res Function(HistoryRecord) _then;

@override $Res call({Object? id = freezed,}) {
  return _then(_value.copyWith(
id: id == freezed ? _value.id : id // ignore: cast_nullable_to_non_nullable
as required,
  ));
}

}


/// @nodoc
abstract class _$$_HistoryRecordCopyWith<$Res> implements $HistoryRecordCopyWith<$Res> {
  factory _$$_HistoryRecordCopyWith(_$_HistoryRecord value, $Res Function(_$_HistoryRecord) then) = __$$_HistoryRecordCopyWithImpl<$Res>;
@override $Res call({
 required id
});



}

/// @nodoc
class __$$_HistoryRecordCopyWithImpl<$Res> extends _$HistoryRecordCopyWithImpl<$Res> implements _$$_HistoryRecordCopyWith<$Res> {
  __$$_HistoryRecordCopyWithImpl(_$_HistoryRecord _value, $Res Function(_$_HistoryRecord) _then)
      : super(_value, (v) => _then(v as _$_HistoryRecord));

@override
_$_HistoryRecord get _value => super._value as _$_HistoryRecord;

@override $Res call({Object? id = freezed,}) {
  return _then(_$_HistoryRecord(
id: id == freezed ? _value.id : id // ignore: cast_nullable_to_non_nullable
as required,
  ));
}


}

/// @nodoc


class _$_HistoryRecord  implements _HistoryRecord {
   _$_HistoryRecord({required this.id});

  

@override final  required id;

@override
String toString() {
  return 'HistoryRecord(id: $id)';
}


@override
bool operator ==(dynamic other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$_HistoryRecord&&const DeepCollectionEquality().equals(other.id, id));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(id));

@JsonKey(ignore: true)
@override
_$$_HistoryRecordCopyWith<_$_HistoryRecord> get copyWith => __$$_HistoryRecordCopyWithImpl<_$_HistoryRecord>(this, _$identity);








}


abstract class _HistoryRecord implements HistoryRecord {
   factory _HistoryRecord({required final  required id}) = _$_HistoryRecord;
  

  

@override  required get id => throw _privateConstructorUsedError;
@override @JsonKey(ignore: true)
_$$_HistoryRecordCopyWith<_$_HistoryRecord> get copyWith => throw _privateConstructorUsedError;

}
