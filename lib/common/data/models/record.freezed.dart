// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Record _$RecordFromJson(Map<String, dynamic> json) {
  return _Record.fromJson(json);
}

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
  bool get isFavorite => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'author') List<Author> authors,
      bool isFavorite});

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
    Object? isFavorite = freezed,
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
      isFavorite: isFavorite == freezed
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$_RecordCopyWith<$Res> implements $RecordCopyWith<$Res> {
  factory _$$_RecordCopyWith(_$_Record value, $Res Function(_$_Record) then) =
      __$$_RecordCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      String rating,
      File file,
      @JsonKey(name: 'comments_total') String commentsTotal,
      @JsonKey(name: 'record_id') String recordId,
      @JsonKey(name: 'streaming_date') String streamingDate,
      @JsonKey(name: 'author') List<Author> authors,
      bool isFavorite});

  @override
  $FileCopyWith<$Res> get file;
}

/// @nodoc
class __$$_RecordCopyWithImpl<$Res> extends _$RecordCopyWithImpl<$Res>
    implements _$$_RecordCopyWith<$Res> {
  __$$_RecordCopyWithImpl(_$_Record _value, $Res Function(_$_Record) _then)
      : super(_value, (v) => _then(v as _$_Record));

  @override
  _$_Record get _value => super._value as _$_Record;

  @override
  $Res call({
    Object? title = freezed,
    Object? rating = freezed,
    Object? file = freezed,
    Object? commentsTotal = freezed,
    Object? recordId = freezed,
    Object? streamingDate = freezed,
    Object? authors = freezed,
    Object? isFavorite = freezed,
  }) {
    return _then(_$_Record(
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
          ? _value._authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<Author>,
      isFavorite: isFavorite == freezed
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Record extends _Record {
  _$_Record(
      {required this.title,
      required this.rating,
      required this.file,
      @JsonKey(name: 'comments_total') required this.commentsTotal,
      @JsonKey(name: 'record_id') required this.recordId,
      @JsonKey(name: 'streaming_date') required this.streamingDate,
      @JsonKey(name: 'author') required final List<Author> authors,
      this.isFavorite = false})
      : _authors = authors,
        super._();

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
  final List<Author> _authors;
  @override
  @JsonKey(name: 'author')
  List<Author> get authors {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_authors);
  }

  @override
  @JsonKey()
  final bool isFavorite;

  @override
  String toString() {
    return 'Record(title: $title, rating: $rating, file: $file, commentsTotal: $commentsTotal, recordId: $recordId, streamingDate: $streamingDate, authors: $authors, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Record &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.rating, rating) &&
            const DeepCollectionEquality().equals(other.file, file) &&
            const DeepCollectionEquality()
                .equals(other.commentsTotal, commentsTotal) &&
            const DeepCollectionEquality().equals(other.recordId, recordId) &&
            const DeepCollectionEquality()
                .equals(other.streamingDate, streamingDate) &&
            const DeepCollectionEquality().equals(other._authors, _authors) &&
            const DeepCollectionEquality()
                .equals(other.isFavorite, isFavorite));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(rating),
      const DeepCollectionEquality().hash(file),
      const DeepCollectionEquality().hash(commentsTotal),
      const DeepCollectionEquality().hash(recordId),
      const DeepCollectionEquality().hash(streamingDate),
      const DeepCollectionEquality().hash(_authors),
      const DeepCollectionEquality().hash(isFavorite));

  @JsonKey(ignore: true)
  @override
  _$$_RecordCopyWith<_$_Record> get copyWith =>
      __$$_RecordCopyWithImpl<_$_Record>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecordToJson(this);
  }
}

abstract class _Record extends Record {
  factory _Record(
      {required final String title,
      required final String rating,
      required final File file,
      @JsonKey(name: 'comments_total') required final String commentsTotal,
      @JsonKey(name: 'record_id') required final String recordId,
      @JsonKey(name: 'streaming_date') required final String streamingDate,
      @JsonKey(name: 'author') required final List<Author> authors,
      final bool isFavorite}) = _$_Record;
  _Record._() : super._();

  factory _Record.fromJson(Map<String, dynamic> json) = _$_Record.fromJson;

  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get rating => throw _privateConstructorUsedError;
  @override
  File get file => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'comments_total')
  String get commentsTotal => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'record_id')
  String get recordId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'streaming_date')
  String get streamingDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'author')
  List<Author> get authors => throw _privateConstructorUsedError;
  @override
  bool get isFavorite => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RecordCopyWith<_$_Record> get copyWith =>
      throw _privateConstructorUsedError;
}
