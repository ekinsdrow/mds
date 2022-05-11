// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Record _$$_RecordFromJson(Map<String, dynamic> json) => _$_Record(
      title: json['title'] as String,
      rating: json['rating'] as String,
      file: File.fromJson(json['file'] as Map<String, dynamic>),
      commentsTotal: json['comments_total'] as String,
      recordId: json['record_id'] as String,
      streamingDate: json['streaming_date'] as String,
      authors: (json['author'] as List<dynamic>)
          .map((e) => Author.fromJson(e as Map<String, dynamic>))
          .toList(),
      isFavorite: json['isFavorite'] as bool? ?? false,
    );

Map<String, dynamic> _$$_RecordToJson(_$_Record instance) => <String, dynamic>{
      'title': instance.title,
      'rating': instance.rating,
      'file': instance.file,
      'comments_total': instance.commentsTotal,
      'record_id': instance.recordId,
      'streaming_date': instance.streamingDate,
      'author': instance.authors,
      'isFavorite': instance.isFavorite,
    };
