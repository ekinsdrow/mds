import 'dart:convert';

import 'package:flutter/services.dart';
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

class AssetsRecordsRepository implements IRecordsRepository {
  @override
  Future<List<Record>> getRecords() async {
    final string = await rootBundle.loadString('assets/catalog.json');
    final json = jsonDecode(string);

    final records = <Record>[];

    for (final record in json) {
      records.add(
        Record.fromJson(record),
      );
    }

    return records;
  }
}
