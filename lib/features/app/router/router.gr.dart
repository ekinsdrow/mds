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
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(InitialRoute.name, path: '/'),
        RouteConfig(MainRoute.name, path: '/main-page')
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
  MainRoute({Key? key, required List<Record> records})
      : super(MainRoute.name,
            path: '/main-page',
            args: MainRouteArgs(key: key, records: records));

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
