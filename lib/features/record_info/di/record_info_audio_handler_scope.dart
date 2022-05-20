import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mds/features/playing/data/models/skip_actions.dart';
import 'package:mds/features/playing/logic/audio_handler.dart';
import 'package:mds/features/record_info/blocs/record_info/record_info_bloc.dart';
import 'package:provider/provider.dart';

class RecordInfoAudioHandlerScope extends StatefulWidget {
  const RecordInfoAudioHandlerScope({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<RecordInfoAudioHandlerScope> createState() =>
      _RecordInfoAudioHandlerScopeState();
}

class _RecordInfoAudioHandlerScopeState
    extends State<RecordInfoAudioHandlerScope> {
  late StreamSubscription<SkipAction?> skipActionSub;

  @override
  void initState() {
    super.initState();

    final recordInfoBloc = context.read<RecordInfoBloc>();

    skipActionSub = context.read<MdsAudioHandler>().skipActionStream.listen(
      (event) {
        if (event != null) {
          recordInfoBloc.add(
            RecordInfoEvent.fetch(
              record: event.record,
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    skipActionSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
