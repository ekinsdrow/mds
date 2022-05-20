import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mds/common/widgets/error_snackbar.dart';
import 'package:mds/features/playing/logic/audio_handler.dart';
import 'package:mds/features/record_info/blocs/record_info/record_info_bloc.dart';
import 'package:mds/features/record_info/data/repositories/record_link_repository.dart';
import 'package:mds/features/record_info/data/sources/record_link_source.dart';
import 'package:mds/features/record_info/di/record_info_audio_handler_scope.dart';
import 'package:provider/provider.dart';

class RecordInfoScope extends StatelessWidget {
  const RecordInfoScope({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => RecordLinkSource(
            dio: context.read<Dio>(),
          ),
        ),
      ],
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<IRecordLinkRepository>(
            create: (context) => RecordLinkRepository(
              context.read<RecordLinkSource>(),
            ),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => RecordInfoBloc(
                recordLinkRepository: context.read<IRecordLinkRepository>(),
              ),
            ),
          ],
          child: BlocListener<RecordInfoBloc, RecordInfoState>(
            listener: (context, state) => state.whenOrNull(
              error: (error) => showErrorSnackBar(
                context: context,
                message: AppLocalizations.of(context)!.playing_error,
              ),
              success: (
                recordLink,
                record,
              ) {
                final player = context.read<MdsAudioHandler>();

                player.playFromUrl(
                  url: recordLink.link,
                  record: record,
                );
              },
            ),
            child: RecordInfoAudioHandlerScope(
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
