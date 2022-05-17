import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mds/common/logs/app_bloc_observer.dart';
import 'package:mds/features/app/app.dart';

import 'package:mds/features/app/router/router.dart';
import 'package:mds/features/playing/logic/audio_handler.dart';

void main() => runZonedGuarded(
      () {
        BlocOverrides.runZoned(
          () async {
            final audioHandler = await AudioService.init(
              builder: () => MdsAudioHandler(
                player: AudioPlayer(),
              ),
              config: const AudioServiceConfig(
                androidNotificationChannelId: 'com.ekinsdrow.mds',
                androidNotificationChannelName: 'Mds',
              ),
            );

            final dio = Dio(
              BaseOptions(
                connectTimeout: 10000,
                baseUrl: 'http://mds.norn.su/api',
              ),
            );

            final router = AppRouter();

            runApp(
              App(
                dio: dio,
                router: router,
                mdsAudioHandler: audioHandler,
              ),
            );
          },
          blocObserver: AppBlocObserver(),
        );
      },
      (error, stack) => {},
    );
