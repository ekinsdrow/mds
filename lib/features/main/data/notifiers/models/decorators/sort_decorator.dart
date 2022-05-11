import 'package:mds/common/data/models/record.dart';
import 'package:mds/features/main/data/enums/sort_enums.dart';
import 'package:mds/features/main/data/notifiers/models/decorators/decorator_interface.dart';
import 'package:mds/features/main/data/notifiers/models/records_interface.dart';

class SortDecorator implements RecordsFilterDecarator {
  @override
  final IRecords recordCollection;

  final SortTypes sortType;
  final SortDirections sortDirection;

  SortDecorator(
    this.recordCollection, {
    required this.sortDirection,
    required this.sortType,
  });

  @override
  List<Record> get getRecords {
    final result = [
      ...recordCollection.getRecords,
    ];

    if (sortType == SortTypes.name) {
      result.sort(
        (a, b) => a.title.toLowerCase().compareTo(
              b.title.toLowerCase(),
            ),
      );
    } else if (sortType == SortTypes.author) {
      result.sort(
        (a, b) => a.authorsString.toLowerCase().compareTo(
              b.authorsString.toLowerCase(),
            ),
      );
    } else if (sortType == SortTypes.date) {
      result.sort(
        (a, b) => a.streamingDate.compareTo(b.streamingDate),
      );
    } else if (sortType == SortTypes.duration) {
      result.sort(
        (a, b) => a.file.duration.compareTo(
          b.file.duration,
        ),
      );
    }

    if (sortDirection == SortDirections.desc) {
      final reversed = [...result.reversed];

      result.clear();

      result.addAll(reversed);
    }

    return result;
  }
}
