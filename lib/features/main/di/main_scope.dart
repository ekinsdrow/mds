import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mds/common/data/models/record.dart';
import 'package:mds/common/data/repositories/favorites_repository.dart';
import 'package:mds/common/widgets/error_snackbar.dart';
import 'package:mds/features/main/blocs/favorites/favorites_bloc.dart';
import 'package:mds/features/main/data/notifiers/catalog_notifier.dart';
import 'package:provider/provider.dart';

class MainScope extends StatelessWidget {
  const MainScope({
    Key? key,
    required this.child,
    required this.records,
  }) : super(key: key);

  final Widget child;
  final List<Record> records;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CatalogNotifier(
        records,
      ),
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
            successDelete: (id) =>
                context.read<CatalogNotifier>().deleteRecordFromFav(
                      id: id,
                    ),
            successAdd: (id) => context.read<CatalogNotifier>().addRecordToFav(
                  id: id,
                ),
          ),
          child: child,
        ),
      ),
    );
  }
}
