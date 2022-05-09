import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mds/common/widgets/retry_error_widget.dart';
import 'package:mds/features/app/router/router.dart';
import 'package:mds/features/init/blocs/init/initial_bloc.dart';
import 'package:mds/features/init/di/inital_page_scope.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InitialPageScope(
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<InitialBloc, InitialState>(
            listener: (context, state) => state.whenOrNull(
              success: (records) => context.router.replaceAll(
                [
                  MainRoute(
                    records: records,
                  ),
                ],
              ),
            ),
            builder: (context, state) => state.when(
              loading: () => const Body(),
              success: (_) => const Body(),
              error: (error) => Center(
                child: RetryErrorWidget(
                  error: error,
                  callback: () {
                    context.read<InitialBloc>().add(
                          const InitialEvent.started(),
                        );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//TODO: Create init screen
class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
