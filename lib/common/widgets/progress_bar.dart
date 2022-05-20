import 'package:flutter/material.dart';
import 'package:mds/common/assets/constants.dart';
import 'package:mds/common/data/models/record.dart';
import 'package:mds/features/playing/logic/audio_handler.dart';
import 'package:provider/provider.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
    required this.record,
    required this.progressBarWidth,
  }) : super(key: key);

  final Record record;
  final double progressBarWidth;

  @override
  Widget build(BuildContext context) {
    final player = context.read<MdsAudioHandler>();

    return GestureDetector(
      onTapDown: (details) {
        final offsetX = details.localPosition.dx;

        final seekPosition = Duration(
          seconds:
              (record.file.duration.inSeconds * offsetX) ~/ progressBarWidth,
        );

        player.seek(seekPosition);
      },
      child: Stack(
        children: [
          Container(
            height: 10,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                Constants.borderRadius,
              ),
            ),
          ),
          StreamBuilder<Duration>(
            stream: player.positionStream,
            builder: (context, positionSnapshot) {
              final nowDuration = positionSnapshot.data ?? Duration.zero;
              return Container(
                height: 10,
                width: (progressBarWidth * nowDuration.inSeconds) /
                    record.file.duration.inSeconds,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(
                    Constants.borderRadius,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
