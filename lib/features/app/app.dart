import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mds/common/assets/themes/themes.dart';
import 'package:mds/features/app/di/app_scope.dart';
import 'package:mds/features/app/router/router.dart';
import 'package:mds/features/playing/logic/audio_handler.dart';

class App extends StatelessWidget {
  const App({
    required this.dio,
    required this.router,
    required this.mdsAudioHandler,
    Key? key,
  }) : super(key: key);

  final AppRouter router;
  final MdsAudioHandler mdsAudioHandler;
  final Dio dio;

  @override
  Widget build(BuildContext context) {
    return AppScope(
      mdsAudioHandler: mdsAudioHandler,
      dio: dio,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationParser: router.defaultRouteParser(),
        routerDelegate: router.delegate(),
        title: 'Flutter DAW',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: Themes.lightTheme,
      ),
    );
  }
}
