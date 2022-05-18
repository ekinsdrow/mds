import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mds/common/widgets/error_snackbar.dart';
import 'package:mds/features/playing/logic/audio_handler.dart';
import 'package:provider/provider.dart';

class PlayingScope extends StatefulWidget {
  const PlayingScope({
    required this.child,
    required this.mdsAudioHandler,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final MdsAudioHandler mdsAudioHandler;

  @override
  State<PlayingScope> createState() => _PlayingScopeState();
}

class _PlayingScopeState extends State<PlayingScope> {
  @override
  void initState() {
    super.initState();

    widget.mdsAudioHandler.playbackState.listen(
      (value) {
        if (value.processingState == AudioProcessingState.error) {
          showErrorSnackBar(
            context: context,
            message: AppLocalizations.of(context)!.playing_error,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: widget.mdsAudioHandler,
      child: widget.child,
    );
  }
}
