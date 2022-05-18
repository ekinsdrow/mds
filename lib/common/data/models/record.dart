import 'package:audio_service/audio_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mds/common/data/models/author.dart';
import 'package:mds/common/data/models/file.dart';

part 'record.freezed.dart';
part 'record.g.dart';

@freezed
class Record with _$Record {
  Record._();

  factory Record({
    required String title,
    required String rating,
    required File file,
    @JsonKey(name: 'comments_total') required String commentsTotal,
    @JsonKey(name: 'record_id') required String recordId,
    @JsonKey(name: 'streaming_date') required String streamingDate,
    @JsonKey(name: 'author') required List<Author> authors,
    @Default(false) bool isFavorite,
  }) = _Record;

  DateTime get date => DateTime(
        int.parse(
          streamingDate.substring(0, 4),
        ),
        int.parse(
          streamingDate.substring(5, 7),
        ),
        int.parse(
          streamingDate.substring(8),
        ),
      );

  String get authorsString {
    var res = '';

    for (final author in authors) {
      res += '${author.title}, ';
    }

    res = res.substring(0, res.length - 2);

    return res;
  }

  String get fullTitle => '$title - $authorsString';

  factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);

  factory Record.placeholder() {
    return Record(
      title: 'Title',
      rating: '5.0',
      file: File(
        bitrate: '128',
        durationString: '1000',
        fileId: '11',
        size: '100',
      ),
      commentsTotal: '4',
      recordId: '0',
      streamingDate: '2000-01-01',
      authors: [
        Author(title: 'Author'),
      ],
    );
  }

  MediaItem toMediaItem() {
    return MediaItem(
      id: recordId,
      title: title,
      artist: authorsString,
      duration: file.duration,
    );
  }
}
