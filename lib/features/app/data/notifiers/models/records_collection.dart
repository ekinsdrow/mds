import 'package:mds/common/data/models/record.dart';
import 'package:mds/features/app/data/notifiers/models/records_interface.dart';

class RecordsCollection implements IRecords {
  RecordsCollection({
    required this.records,
  });

  final List<Record> records;

  @override
  List<Record> get getRecords => records;

  RecordsCollection deleteRecordFromFav({
    required String id,
  }) =>
      _updateFavs(
        false,
        id,
      );

  RecordsCollection addRecordToFav({
    required String id,
  }) =>
      _updateFavs(
        true,
        id,
      );

  RecordsCollection _updateFavs(
    bool value,
    String id,
  ) {
    final nowList = [...records];
    final resultList = <Record>[];

    for (final record in nowList) {
      if (record.recordId == id) {
        resultList.add(
          record.copyWith(isFavorite: value),
        );
      } else {
        resultList.add(record);
      }
    }

    return RecordsCollection(
      records: resultList,
    );
  }
}
