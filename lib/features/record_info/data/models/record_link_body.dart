import 'package:freezed_annotation/freezed_annotation.dart';

part 'record_link_body.freezed.dart';
part 'record_link_body.g.dart';

@freezed
class RecordLinkBody with _$RecordLinkBody {
  factory RecordLinkBody({
    @JsonKey(name: 'file_id') required String fileId,
  }) = _RecordLinkBody;

  factory RecordLinkBody.fromJson(Map<String, dynamic> json) =>
      _$RecordLinkBodyFromJson(json);
}
