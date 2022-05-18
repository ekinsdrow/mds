import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mds/common/data/repositories/favorites_repository.dart';
import 'package:mds/common/widgets/error_snackbar.dart';
import 'package:mds/features/app/data/notifiers/catalog_notifier.dart';
import 'package:mds/features/favorites/blocs/favorites/favorites_bloc.dart';
import 'package:mds/features/playing/logic/audio_handler.dart';

class FavoritesScope extends StatelessWidget {
  const FavoritesScope({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<IFavoritesRepository>(
          create: (context) => FavoritesRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => FavoritesBloc(
              favoritesRepository: context.read<IFavoritesRepository>(),
            ),
          ),
        ],
        child: BlocListener<FavoritesBloc, FavoritesState>(
          listener: (context, state) => state.whenOrNull(
            error: () {
              showErrorSnackBar(
                context: context,
                message: AppLocalizations.of(context)!.fav_error,
              );
            },
            successDelete: (record) {
              context.read<CatalogNotifier>().deleteRecordFromFav(
                    id: record.recordId,
                  );

              context.read<MdsAudioHandler>().addRecord(
                    record,
                  );
            },
            successAdd: (record) {
              context.read<CatalogNotifier>().addRecordToFav(
                    id: record.recordId,
                  );

              context.read<MdsAudioHandler>().addRecord(
                    record,
                  );
            },
          ),
          child: child,
        ),
      ),
    );
  }
}
