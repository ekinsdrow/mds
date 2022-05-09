import 'package:mds/common/data/models/record.dart';
import 'package:mds/features/init/data/sources/records_source.dart';

abstract class IRecordsRepository {
  Future<List<Record>> getRecords();
}

class RecordsRepository implements IRecordsRepository {
  final RecordsSource recordsSource;

  RecordsRepository({
    required this.recordsSource,
  });

  @override
  Future<List<Record>> getRecords() => recordsSource.getRecords();
}
