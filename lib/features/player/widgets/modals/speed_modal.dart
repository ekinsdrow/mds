import 'package:flutter/material.dart';
import 'package:mds/common/assets/constants.dart';
import 'package:mds/features/playing/logic/audio_handler.dart';

void showSpeedModal(BuildContext context, MdsAudioHandler player) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return _Speed(
        player: player,
      );
    },
  );
}

class _Speed extends StatelessWidget {
  const _Speed({
    Key? key,
    required this.player,
  }) : super(key: key);

  final MdsAudioHandler player;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(
          Constants.mediumPadding,
        ),
        child: StreamBuilder<double>(
            stream: player.speedStream,
            builder: (context, speedSnapshot) {
              final speed = speedSnapshot.data ?? 1.0;
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    splashRadius: 20,
                    onPressed: () {
                      player.setSpeedValue(speed - 0.1);
                    },
                    icon: const Icon(
                      Icons.remove,
                    ),
                  ),
                  const SizedBox(
                    width: Constants.smallPadding,
                  ),
                  Text(
                    '${speed.toStringAsFixed(1)}x',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(
                    width: Constants.smallPadding,
                  ),
                  IconButton(
                    splashRadius: 20,
                    onPressed: () {
                      player.setSpeedValue(speed + 0.1);
                    },
                    icon: const Icon(
                      Icons.add,
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
