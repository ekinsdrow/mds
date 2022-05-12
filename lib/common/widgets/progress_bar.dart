import 'package:flutter/material.dart';
import 'package:mds/common/assets/constants.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: progressBar
    return Stack(
      children: [
        Container(
          height: 5,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              Constants.borderRadius,
            ),
          ),
        ),
        Container(
          height: 5,
          width: 200,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(
              Constants.borderRadius,
            ),
          ),
        ),
      ],
    );
  }
}
