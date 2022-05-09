// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'records.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Records _$$_RecordsFromJson(Map<String, dynamic> json) => _$_Records(
      records: (json['records'] as List<dynamic>)
          .map((e) => Record.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RecordsToJson(_$_Records instance) =>
    <String, dynamic>{
      'records': instance.records,
    };
