import 'package:flutter/material.dart';
import 'package:mds/features/playing/logic/audio_handler.dart';
import 'package:provider/provider.dart';

class PlayingScope extends StatelessWidget {
  const PlayingScope({
    required this.child,
    required this.mdsAudioHandler,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final MdsAudioHandler mdsAudioHandler;

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: mdsAudioHandler,
      child: child,
    );
  }
}
