import 'package:mds/common/data/models/record.dart';
import 'package:mds/features/app/data/notifiers/models/decorators/decorator_interface.dart';
import 'package:mds/features/app/data/notifiers/models/records_interface.dart';

class HistoryDecorator implements RecordsFilterDecarator {
  @override
  final IRecords recordCollection;
  final List<String> ids;

  HistoryDecorator({
    required this.recordCollection,
    required this.ids,
  });

  @override
  List<Record> get getRecords {
    final result = <Record>[];
    for (final record in recordCollection.getRecords) {
      if (ids.contains(record.recordId)) {
        result.add(record);
      }
    }

    return result;
  }
}
