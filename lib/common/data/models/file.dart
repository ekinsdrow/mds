import 'package:freezed_annotation/freezed_annotation.dart';

part 'file.freezed.dart';
part 'file.g.dart';

@freezed
class File with _$File {
  File._();

  factory File({
    required String bitrate,
    required String size,
    @JsonKey(name: 'duration') required String durationString,
    @JsonKey(name: 'file_id') required String fileId,
  }) = _File;

  Duration get duration => Duration(
        seconds: int.parse(durationString),
      );

  factory File.fromJson(Map<String, dynamic> json) => _$FileFromJson(json);
}
