import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mds/features/app/data/notifiers/catalog_notifier.dart';
import 'package:mds/features/favorites/di/favorites_scope.dart';
import 'package:mds/features/history/di/history_scope.dart';
import 'package:mds/features/playing/di/playing_scope.dart';
import 'package:mds/features/playing/logic/audio_handler.dart';
import 'package:mds/features/record_info/di/record_info_scope.dart';
import 'package:provider/provider.dart';

class AppScope extends StatelessWidget {
  const AppScope({
    required this.child,
    required this.mdsAudioHandler,
    required this.dio,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final MdsAudioHandler mdsAudioHandler;
  final Dio dio;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CatalogNotifier(),
      child: MultiProvider(
        providers: [
          Provider<Dio>(
            create: (context) => dio,
          ),
        ],
        child: PlayingScope(
          mdsAudioHandler: mdsAudioHandler,
          child: HistoryScope(
            child: FavoritesScope(
              child: RecordInfoScope(
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
