import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mds/common/data/models/record.dart';

part 'records.freezed.dart';
part 'records.g.dart';

@freezed
class Records with _$Records {
  factory Records({
    required List<Record> records,
  }) = _Records;

  factory Records.fromJson(Map<String, dynamic> json) =>
      _$RecordsFromJson(json);
}
