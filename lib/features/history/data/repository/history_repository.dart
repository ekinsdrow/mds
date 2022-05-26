import 'package:mds/features/history/data/models/history_record.dart';

abstract class IHistoryRepository {
  Future<int> saveHistoryRecord(HistoryRecord record);
  Future<void> clearHistory();
  Future<List<HistoryRecord>> getHistory();
}
