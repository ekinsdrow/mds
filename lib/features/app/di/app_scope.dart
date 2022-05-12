import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mds/common/data/repositories/favorites_repository.dart';
import 'package:provider/provider.dart';


//TODO: add fav bloc and playing bloc there
class AppScope extends StatelessWidget {
  const AppScope({
    required this.child,
    required this.dio,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final Dio dio;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Dio>(
          create: (context) => dio,
        ),
      ],
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<IFavoritesRepository>(
            create: (context) => FavoritesRepository(),
          ),
        ],
        child: child,
      ),
    );
  }
}
