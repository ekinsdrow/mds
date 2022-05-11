import 'package:mds/common/data/models/record.dart';
import 'package:mds/features/main/data/notifiers/models/decorators/decorator_interface.dart';
import 'package:mds/features/main/data/notifiers/models/records_interface.dart';

class FavoritesDecorator implements RecordsFilterDecarator {
  @override
  final IRecords recordCollection;

  FavoritesDecorator(this.recordCollection);

  @override
  List<Record> get getRecords {
    final result = <Record>[];
    for (final record in recordCollection.getRecords) {
      if (record.isFavorite) {
        result.add(record);
      }
    }

    return result;
  }
}
