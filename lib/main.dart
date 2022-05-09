import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mds/common/logs/app_bloc_observer.dart';
import 'package:mds/features/app/app.dart';

import 'package:mds/features/app/router/router.dart';

void main() => runZonedGuarded(
      () {
        BlocOverrides.runZoned(
          () {
            final dio = Dio();
            final router = AppRouter();

            runApp(
              App(
                dio: dio,
                router: router,
              ),
            );
          },
          blocObserver: AppBlocObserver(),
        );
      },
      (error, stack) => {},
    );
