import 'package:dio/dio.dart';
import 'package:mds/features/main/features/player/data/models/record_link.dart';
import 'package:mds/features/main/features/player/data/models/record_link_body.dart';
import 'package:retrofit/retrofit.dart';

part 'record_link_source.g.dart';

@RestApi(baseUrl: "http://mds.norn.su/api")
abstract class RecordLinkSource {
  factory RecordLinkSource(Dio dio, {String baseUrl}) = _RecordLinkSource;

  @POST(
    '/get_records',
  )
  Future<RecordLink> getRecordLink(
    @Body() final RecordLinkBody recordLinkBody,
  );
}
