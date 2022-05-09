import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mds/common/data/models/author.dart';
import 'package:mds/common/data/models/file.dart';

part 'record.freezed.dart';
part 'record.g.dart';

@freezed
class Record with _$Record {
  factory Record({
    required String title,
    required String rating,
    required File file,
    @JsonKey(name: 'comments_total') required String commentsTotal,
    @JsonKey(name: 'record_id') required String recordId,
    @JsonKey(name: 'streaming_date') required String streamingDate,
    @JsonKey(name: 'author') required List<Author> authors,
  }) = _Record;

  DateTime get date => DateTime(
        int.parse(
          streamingDate.substring(0, 4),
        ),
        int.parse(
          streamingDate.substring(5, 7),
        ),
        int.parse(
          streamingDate.substring(8),
        ),
      );

  factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);
}
