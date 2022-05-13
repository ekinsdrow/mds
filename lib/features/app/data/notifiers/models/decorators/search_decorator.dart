import 'package:mds/common/data/models/record.dart';
import 'package:mds/features/app/data/notifiers/models/decorators/decorator_interface.dart';
import 'package:mds/features/app/data/notifiers/models/records_interface.dart';

class SearchDecorator implements RecordsFilterDecarator {
  @override
  final IRecords recordCollection;

  final String request;

  SearchDecorator(
    this.recordCollection, {
    required this.request,
  });

  @override
  List<Record> get getRecords {
    final result = <Record>[];
    for (final record in recordCollection.getRecords) {
      if (record.title.toLowerCase().contains(request.toLowerCase()) ||
          record.authorsString.toLowerCase().contains(request.toLowerCase())) {
        result.add(record);
      }
    }

    return result;
  }
}
