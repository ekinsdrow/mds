import 'package:freezed_annotation/freezed_annotation.dart';

part 'record_link.freezed.dart';
part 'record_link.g.dart';

@freezed
class RecordLink with _$RecordLink {
  factory RecordLink({
    required String link,
  }) = _RecordLink;

  factory RecordLink.fromJson(Map<String, dynamic> json) =>
      _$RecordLinkFromJson(json);
}
