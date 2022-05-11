import 'package:flutter/material.dart';
import 'package:mds/common/assets/constants.dart';
import 'package:mds/common/data/models/record.dart';
import 'package:mds/common/extensions/date_extension.dart';
import 'package:mds/common/extensions/duration_extension.dart';

void showInfoModal({
  required BuildContext context,
  required Record record,
}) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return _Info(
        record: record,
      );
    },
  );
}

class _Info extends StatelessWidget {
  const _Info({
    Key? key,
    required this.record,
  }) : super(key: key);

  final Record record;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 140,
        padding: const EdgeInsets.all(
          Constants.mediumPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${record.title} - ${record.authorsString}',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              height: Constants.mediumPadding,
            ),
            Wrap(
              spacing: Constants.mediumPadding,
              runSpacing: Constants.smallPadding,
              children: [
                Text(
                  record.date.formatDate(),
                ),
                Text(
                  record.file.duration.format(),
                ),
                Text(
                  '${record.file.bitrate}kbps',
                ),
                Text(
                  '${int.parse(record.file.size) ~/ 1024}Mb',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
