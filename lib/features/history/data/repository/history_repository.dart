import 'package:mds/common/data/models/record.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IHistoryRepository {
  Future<void> saveHistoryRecord(Record record);
  Future<void> clearHistory();
  Future<List<String>> getHistoryIds();
}

class HistoryRepository implements IHistoryRepository {
  final _key = 'history';

  @override
  Future<void> clearHistory() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(_key);
  }

  @override
  Future<List<String>> getHistoryIds() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final histories = sharedPreferences.getStringList(_key);
    return histories ?? [];
  }

  @override
  Future<void> saveHistoryRecord(Record record) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final history = [
      ...await getHistoryIds(),
      record.recordId,
    ];

    sharedPreferences.setStringList(_key, history);
  }
}
