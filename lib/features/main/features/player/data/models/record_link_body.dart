import 'package:freezed_annotation/freezed_annotation.dart';

part 'record_link_body.freezed.dart';

@freezed
class RecordLinkBody with _$RecordLinkBody {
  factory RecordLinkBody({
    required String fileId,
  }) = _RecordLinkBody;
}

extension RecordToBody on RecordLinkBody {
  String toBody() {
    return 'file_id=$fileId';
  }
}
