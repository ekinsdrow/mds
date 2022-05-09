import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mds/features/init/blocs/init/initial_bloc.dart';
import 'package:mds/features/init/data/repositories/records_repository.dart';
import 'package:mds/features/init/data/sources/records_source.dart';
import 'package:provider/provider.dart';

class InitialPageScope extends StatelessWidget {
  const InitialPageScope({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => RecordsSource(
        context.read<Dio>(),
      ),
      child: RepositoryProvider<IRecordsRepository>(
        create: (context) => RecordsRepository(
          recordsSource: context.read<RecordsSource>(),
        ),
        child: BlocProvider(
          create: (context) => InitialBloc(
            recordsRepository: context.read<IRecordsRepository>(),
          )..add(
              const InitialEvent.started(),
            ),
          child: child,
        ),
      ),
    );
  }
}
