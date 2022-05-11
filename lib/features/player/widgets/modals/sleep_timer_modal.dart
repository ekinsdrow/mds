import 'package:flutter/material.dart';
import 'package:mds/common/assets/constants.dart';

void showSleepTimerModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return const _SleepTimer();
    },
  );
}

//TODO: sleep timer modal
class _SleepTimer extends StatelessWidget {
  const _SleepTimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(
          Constants.mediumPadding,
        ),
        child: const Text('Sleep Timer'),
      ),
    );
  }
}
