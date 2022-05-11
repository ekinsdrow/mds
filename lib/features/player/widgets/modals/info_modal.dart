import 'package:flutter/material.dart';
import 'package:mds/common/assets/constants.dart';

void showInfoModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return const _Info();
    },
  );
}

class _Info extends StatelessWidget {
  const _Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(
          Constants.mediumPadding,
        ),
        child: const Text('Info'),
      ),
    );
  }
}
