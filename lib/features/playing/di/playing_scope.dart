import 'package:flutter/material.dart';

class PlayingScope extends StatelessWidget {
  const PlayingScope({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
