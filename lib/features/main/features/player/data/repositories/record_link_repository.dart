import 'package:mds/features/main/features/player/data/models/record_link.dart';
import 'package:mds/features/main/features/player/data/models/record_link_body.dart';
import 'package:mds/features/main/features/player/data/sources/record_link_source.dart';

abstract class IRecordLinkRepository {
  Future<RecordLink> getRecordLink({
    required RecordLinkBody recordLinkBody,
  });
}

class RecordLinkRepository implements IRecordLinkRepository {
  final RecordLinkSource recordLinkSource;

  RecordLinkRepository(this.recordLinkSource);

  @override
  Future<RecordLink> getRecordLink({
    required RecordLinkBody recordLinkBody,
  }) =>
      recordLinkSource.getRecordLink(recordLinkBody);
}
