import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mds/common/assets/themes/themes.dart';
import 'package:mds/features/app/router/router.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  App({
    required this.dio,
    Key? key,
  }) : super(key: key);

  final _router = AppRouter();

  final Dio dio;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => dio,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationParser: _router.defaultRouteParser(),
        routerDelegate: _router.delegate(),
        title: 'Flutter DAW',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: Themes.darkTheme,
      ),
    );
  }
}
