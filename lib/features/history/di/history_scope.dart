import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mds/features/history/bloc/history_bloc/history_bloc.dart';
import 'package:mds/features/history/data/repository/history_repository.dart';

class HistoryScope extends StatelessWidget {
  const HistoryScope({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<IHistoryRepository>(
          create: (context) => HistoryRepository(),
        )
      ],
      child: BlocProvider(
        create: (context) => HistoryBloc(
          historyRepository: context.read<IHistoryRepository>(),
        ),
        child: child,
      ),
    );
  }
}
