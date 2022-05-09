import 'package:dio/dio.dart';
import 'package:mds/common/data/models/record.dart';
import 'package:retrofit/retrofit.dart';

part 'records_source.g.dart';

@RestApi(baseUrl: "http://mds.norn.su/api")
abstract class RecordsSource {
  factory RecordsSource(Dio dio, {String baseUrl}) = _RecordsSource;

  @GET('/get_records')
  Future<List<Record>> getRecords();
}
