import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mds/common/data/models/record.dart';

part 'config.freezed.dart';
part 'config.g.dart';

@freezed
class Config with _$Config {
  factory Config({
    required List<Record> records,
  }) = _Config;

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);
}
