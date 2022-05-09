// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    InitialRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const InitialPage());
    },
    MainRoute.name: (routeData) {
      final args = routeData.argsAs<MainRouteArgs>();
      return AdaptivePage<dynamic>(
          routeData: routeData,
          child: MainPage(key: args.key, records: args.records));
    },
    HomeRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    SettingsRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const SettingsPage());
    },
    InfoRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const InfoPage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(InitialRoute.name, path: '/'),
        RouteConfig(MainRoute.name, path: '/main-page', children: [
          RouteConfig(HomeRouter.name, path: 'home', parent: MainRoute.name),
          RouteConfig(SettingsRouter.name,
              path: 'settings', parent: MainRoute.name),
          RouteConfig(InfoRouter.name, path: 'info', parent: MainRoute.name)
        ])
      ];
}

/// generated route for
/// [InitialPage]
class InitialRoute extends PageRouteInfo<void> {
  const InitialRoute() : super(InitialRoute.name, path: '/');

  static const String name = 'InitialRoute';
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<MainRouteArgs> {
  MainRoute(
      {Key? key, required List<Record> records, List<PageRouteInfo>? children})
      : super(MainRoute.name,
            path: '/main-page',
            args: MainRouteArgs(key: key, records: records),
            initialChildren: children);

  static const String name = 'MainRoute';
}

class MainRouteArgs {
  const MainRouteArgs({this.key, required this.records});

  final Key? key;

  final List<Record> records;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key, records: $records}';
  }
}

/// generated route for
/// [HomePage]
class HomeRouter extends PageRouteInfo<void> {
  const HomeRouter() : super(HomeRouter.name, path: 'home');

  static const String name = 'HomeRouter';
}

/// generated route for
/// [SettingsPage]
class SettingsRouter extends PageRouteInfo<void> {
  const SettingsRouter() : super(SettingsRouter.name, path: 'settings');

  static const String name = 'SettingsRouter';
}

/// generated route for
/// [InfoPage]
class InfoRouter extends PageRouteInfo<void> {
  const InfoRouter() : super(InfoRouter.name, path: 'info');

  static const String name = 'InfoRouter';
}
