import 'package:dio/dio.dart';
import 'package:mds/features/playing/data/models/record_link.dart';
import 'package:mds/features/playing/data/models/record_link_body.dart';

class RecordLinkSource {
  RecordLinkSource({
    required this.dio,
  });

  final Dio dio;

  Future<RecordLink> getRecordLink(RecordLinkBody body) async {
    final response = await dio.post(
      '/get_record_file',
      //TODO: request body
      // data: {body.toBody()},
    );

    return RecordLink.fromJson(
      response.data,
    );
  }
}
