import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mds/features/playing/blocs/record_info/record_info_bloc.dart';
import 'package:mds/features/playing/data/repositories/record_link_repository.dart';
import 'package:mds/features/playing/data/sources/record_link_source.dart';
import 'package:provider/provider.dart';

class PlayerScope extends StatelessWidget {
  const PlayerScope({
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
          child: child,
        ),
      ),
    );
  }
}
