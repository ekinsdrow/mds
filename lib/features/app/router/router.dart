import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mds/common/data/models/record.dart';
import 'package:mds/features/init/widgets/initial_page.dart';
import 'package:mds/features/main/features/home/widgets/home_page.dart';
import 'package:mds/features/main/features/info/widgets/info_page.dart';
import 'package:mds/features/main/features/settings/widgets/settings_page.dart';
import 'package:mds/features/main/widgets/main_page.dart';

part 'router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      initial: true,
      name: 'InitialRoute',
      page: InitialPage,
    ),
    AutoRoute(
      page: MainPage,
      children: [
        AutoRoute<dynamic>(
          path: 'home',
          name: 'HomeRouter',
          page: HomePage,
        ),
        AutoRoute<dynamic>(
          path: 'settings',
          name: 'SettingsRouter',
          page: SettingsPage,
        ),
        AutoRoute<dynamic>(
          path: 'info',
          name: 'InfoRouter',
          page: InfoPage,
        ),
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {}
