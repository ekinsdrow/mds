import 'package:flutter/material.dart';

void showFilterModal(
  BuildContext context,
) {
  showModalBottomSheet(
    context: context,
    builder: (context) => const _FilterModal(),
  );
}

class _FilterModal extends StatelessWidget {
  const _FilterModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: double.infinity,
      height: 400,
      child: const Text('Filters'),
    );
  }
}
