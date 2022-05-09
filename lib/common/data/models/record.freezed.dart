// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Record _$RecordFromJson(Map<String, dynamic> json) {
  return _Record.fromJson(json);
}

/// @nodoc
class _$RecordTearOff {
  const _$RecordTearOff();

  _Record call(
      {required String title,
      required String rating,
      required File file,
      @JsonKey(name: 'comments_total') required String commentsTotal,
      @JsonKey(name: 'record_id') required String recordId,
      @JsonKey(name: 'streaming_date') required String streamingDate,
      @JsonKey(name: 'author') required List<Author> authors}) {
    return _Record(
      title: title,
      rating: rating,
      file: file,
      commentsTotal: commentsTotal,
      recordId: recordId,
      streamingDate: streamingDate,
      authors: authors,
    );
  }

  Record fromJson(Map<String, Object?> json) {
    return Record.fromJson(json);
  }
}

/// @nodoc
const $Record = _$RecordTearOff();

/// @nodoc
mixin _$Record {
  String get title => throw _privateConstructorUsedError;
  String get rating => throw _privateConstructorUsedError;
  File get file => throw _privateConstructorUsedError;
  @JsonKey(name: 'comments_total')
  String get commentsTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'record_id')
  String get recordId => throw _privateConstructorUsedError;
  @JsonKey(name: 'streaming_date')
  String get streamingDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'author')
  List<Author> get authors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecordCopyWith<Record> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordCopyWith<$Res> {
  factory $RecordCopyWith(Record value, $Res Function(Record) then) =
      _$RecordCopyWithImpl<$Res>;
  $Res call(
      {String title,
      String rating,
      File file,
      @JsonKey(name: 'comments_total') String commentsTotal,
      @JsonKey(name: 'record_id') String recordId,
      @JsonKey(name: 'streaming_date') String streamingDate,
      @JsonKey(name: 'author') List<Author> authors});

  $FileCopyWith<$Res> get file;
}

/// @nodoc
class _$RecordCopyWithImpl<$Res> implements $RecordCopyWith<$Res> {
  _$RecordCopyWithImpl(this._value, this._then);

  final Record _value;
  // ignore: unused_field
  final $Res Function(Record) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? rating = freezed,
    Object? file = freezed,
    Object? commentsTotal = freezed,
    Object? recordId = freezed,
    Object? streamingDate = freezed,
    Object? authors = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
      file: file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
      commentsTotal: commentsTotal == freezed
          ? _value.commentsTotal
          : commentsTotal // ignore: cast_nullable_to_non_nullable
              as String,
      recordId: recordId == freezed
          ? _value.recordId
          : recordId // ignore: cast_nullable_to_non_nullable
              as String,
      streamingDate: streamingDate == freezed
          ? _value.streamingDate
          : streamingDate // ignore: cast_nullable_to_non_nullable
              as String,
      authors: authors == freezed
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<Author>,
    ));
  }

  @override
  $FileCopyWith<$Res> get file {
    return $FileCopyWith<$Res>(_value.file, (value) {
      return _then(_value.copyWith(file: value));
    });
  }
}

/// @nodoc
abstract class _$RecordCopyWith<$Res> implements $RecordCopyWith<$Res> {
  factory _$RecordCopyWith(_Record value, $Res Function(_Record) then) =
      __$RecordCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      String rating,
      File file,
      @JsonKey(name: 'comments_total') String commentsTotal,
      @JsonKey(name: 'record_id') String recordId,
      @JsonKey(name: 'streaming_date') String streamingDate,
      @JsonKey(name: 'author') List<Author> authors});

  @override
  $FileCopyWith<$Res> get file;
}

/// @nodoc
class __$RecordCopyWithImpl<$Res> extends _$RecordCopyWithImpl<$Res>
    implements _$RecordCopyWith<$Res> {
  __$RecordCopyWithImpl(_Record _value, $Res Function(_Record) _then)
      : super(_value, (v) => _then(v as _Record));

  @override
  _Record get _value => super._value as _Record;

  @override
  $Res call({
    Object? title = freezed,
    Object? rating = freezed,
    Object? file = freezed,
    Object? commentsTotal = freezed,
    Object? recordId = freezed,
    Object? streamingDate = freezed,
    Object? authors = freezed,
  }) {
    return _then(_Record(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
      file: file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
      commentsTotal: commentsTotal == freezed
          ? _value.commentsTotal
          : commentsTotal // ignore: cast_nullable_to_non_nullable
              as String,
      recordId: recordId == freezed
          ? _value.recordId
          : recordId // ignore: cast_nullable_to_non_nullable
              as String,
      streamingDate: streamingDate == freezed
          ? _value.streamingDate
          : streamingDate // ignore: cast_nullable_to_non_nullable
              as String,
      authors: authors == freezed
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<Author>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Record implements _Record {
  _$_Record(
      {required this.title,
      required this.rating,
      required this.file,
      @JsonKey(name: 'comments_total') required this.commentsTotal,
      @JsonKey(name: 'record_id') required this.recordId,
      @JsonKey(name: 'streaming_date') required this.streamingDate,
      @JsonKey(name: 'author') required this.authors});

  factory _$_Record.fromJson(Map<String, dynamic> json) =>
      _$$_RecordFromJson(json);

  @override
  final String title;
  @override
  final String rating;
  @override
  final File file;
  @override
  @JsonKey(name: 'comments_total')
  final String commentsTotal;
  @override
  @JsonKey(name: 'record_id')
  final String recordId;
  @override
  @JsonKey(name: 'streaming_date')
  final String streamingDate;
  @override
  @JsonKey(name: 'author')
  final List<Author> authors;

  @override
  String toString() {
    return 'Record(title: $title, rating: $rating, file: $file, commentsTotal: $commentsTotal, recordId: $recordId, streamingDate: $streamingDate, authors: $authors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Record &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.commentsTotal, commentsTotal) ||
                other.commentsTotal == commentsTotal) &&
            (identical(other.recordId, recordId) ||
                other.recordId == recordId) &&
            (identical(other.streamingDate, streamingDate) ||
                other.streamingDate == streamingDate) &&
            const DeepCollectionEquality().equals(other.authors, authors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      rating,
      file,
      commentsTotal,
      recordId,
      streamingDate,
      const DeepCollectionEquality().hash(authors));

  @JsonKey(ignore: true)
  @override
  _$RecordCopyWith<_Record> get copyWith =>
      __$RecordCopyWithImpl<_Record>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecordToJson(this);
  }
}

abstract class _Record implements Record {
  factory _Record(
      {required String title,
      required String rating,
      required File file,
      @JsonKey(name: 'comments_total') required String commentsTotal,
      @JsonKey(name: 'record_id') required String recordId,
      @JsonKey(name: 'streaming_date') required String streamingDate,
      @JsonKey(name: 'author') required List<Author> authors}) = _$_Record;

  factory _Record.fromJson(Map<String, dynamic> json) = _$_Record.fromJson;

  @override
  String get title;
  @override
  String get rating;
  @override
  File get file;
  @override
  @JsonKey(name: 'comments_total')
  String get commentsTotal;
  @override
  @JsonKey(name: 'record_id')
  String get recordId;
  @override
  @JsonKey(name: 'streaming_date')
  String get streamingDate;
  @override
  @JsonKey(name: 'author')
  List<Author> get authors;
  @override
  @JsonKey(ignore: true)
  _$RecordCopyWith<_Record> get copyWith => throw _privateConstructorUsedError;
}
