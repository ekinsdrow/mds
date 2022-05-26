import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mds/common/data/models/record.dart';

part 'history_record.freezed.dart';

@freezed
class HistoryRecord with _$HistoryRecord {
  factory HistoryRecord({
    required id,
  }) = _HistoryRecord;

  factory HistoryRecord.fromRecord(Record record) {
    return HistoryRecord(
      id: record.recordId,
    );
  }
}
