import 'package:audio_service/audio_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mds/common/assets/constants.dart';
import 'package:mds/common/data/models/record.dart';
import 'package:mds/common/widgets/progress_bar.dart';
import 'package:mds/common/widgets/record_list_item.dart';
import 'package:mds/features/favorites/blocs/favorites/favorites_bloc.dart';
import 'package:mds/features/player/widgets/modals/info_modal.dart';

import 'package:mds/features/player/widgets/modals/sleep_timer_modal.dart';
import 'package:mds/features/playing/logic/audio_handler.dart';
import 'package:provider/provider.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<Record?>(
          stream: context.read<MdsAudioHandler>().recordStream,
          builder: (context, recordSnapshot) {
            final record = recordSnapshot.data;

            return Column(
              children: [
                const SizedBox(
                  height: Constants.mediumPadding,
                ),
                _Header(
                  record: record,
                ),
                if (record == null)
                  const Expanded(
                    child: Center(
                      child: Text('Choose Station'),
                    ),
                  )
                else
                  Expanded(
                    child: Column(
                      children: [
                        const Expanded(
                          child: Queue(),
                        ),
                        const SizedBox(
                          height: Constants.mediumPadding,
                        ),
                        _Actions(
                          record: record,
                        ),
                      ],
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
    required this.record,
  }) : super(key: key);

  final Record? record;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Constants.smallPadding,
      ),
      child: Row(
        children: [
          IconButton(
            splashRadius: 20,
            onPressed: () {
              context.router.pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).primaryColor,
            ),
          ),
          if (record != null)
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: Constants.smallPadding,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width -
                            Constants.mediumPadding * 2 -
                            144,
                        child: Text(
                          record!.fullTitle,
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 16,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        splashRadius: 20,
                        onPressed: () {
                          //TODO: download
                        },
                        icon: Icon(
                          Icons.cloud_download,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      IconButton(
                        splashRadius: 20,
                        onPressed: () {
                          if (record!.isFavorite) {
                            context.read<FavoritesBloc>().add(
                                  FavoritesEvent.delete(
                                    record: record!,
                                  ),
                                );
                          } else {
                            context.read<FavoritesBloc>().add(
                                  FavoritesEvent.save(
                                    record: record!,
                                  ),
                                );
                          }
                        },
                        icon: Icon(
                          record!.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

//TODO: now playing queue
class Queue extends StatelessWidget {
  const Queue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final player = context.read<MdsAudioHandler>();

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(
        left: Constants.smallPadding,
        right: Constants.smallPadding,
      ),
      itemBuilder: (context, index) => RecordListItem(
        player: player,
        record: Record.placeholder(),
        callback: () {
          //TODO: play
        },
      ),
      itemCount: 100,
    );
  }
}

class _Actions extends StatelessWidget {
  const _Actions({
    Key? key,
    required this.record,
  }) : super(key: key);

  final Record record;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: Constants.mediumPadding,
        right: Constants.mediumPadding,
        bottom: Constants.mediumPadding,
      ),
      child: Column(
        children: [
          const _ProgressBar(),
          const SizedBox(
            height: Constants.bigPadding,
          ),
          _Buttons(
            record: record,
          ),
        ],
      ),
    );
  }
}

//TODO: progress bar
class _ProgressBar extends StatelessWidget {
  const _ProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProgressBar(),
        const SizedBox(
          height: Constants.smallPadding,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              '00:50:00',
            ),
            Text(
              '01:40:00',
            ),
          ],
        ),
      ],
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons({
    Key? key,
    required this.record,
  }) : super(key: key);

  final Record record;

  @override
  Widget build(BuildContext context) {
    final player = context.read<MdsAudioHandler>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          splashRadius: 20,
          onPressed: () {
            showInfoModal(
              context: context,
              record: record,
            );
          },
          icon: const Icon(
            Icons.info,
            color: Colors.black54,
          ),
        ),
        IconButton(
          splashRadius: 20,
          onPressed: () {
            //TODO: prev track
          },
          icon: Icon(
            Icons.skip_previous,
            color: Theme.of(context).primaryColor,
          ),
        ),
        StreamBuilder<PlaybackState>(
          stream: player.playbackState,
          builder: (context, playbackSnapshot) {
            final playbackState = playbackSnapshot.data ?? PlaybackState();

            var icon = Icons.play_arrow;

            if (playbackState.processingState == AudioProcessingState.loading) {
              return Column(
                children: const [
                  SizedBox(
                    height: Constants.mediumPadding,
                  ),
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
                  SizedBox(
                    height: Constants.mediumPadding,
                  ),
                ],
              );
            } else if (playbackState.processingState ==
                AudioProcessingState.error) {
              icon = Icons.close;
            } else if (playbackState.playing) {
              icon = Icons.pause;
            }

            return Material(
              borderRadius: BorderRadius.circular(
                Constants.borderRadius * 1.5,
              ),
              color: Theme.of(context).primaryColor,
              child: InkWell(
                onTap: () {
                  if (playbackState.playing) {
                    player.pause();
                  } else {
                    player.play();
                  }
                },
                borderRadius: BorderRadius.circular(
                  Constants.borderRadius * 1.5,
                ),
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: Icon(
                    icon,
                    color: icon == Icons.close ? Colors.red : Colors.white,
                  ),
                ),
              ),
            );
          },
        ),
        IconButton(
          splashRadius: 20,
          onPressed: () {
            //TODO: next track
          },
          icon: Icon(
            Icons.skip_next,
            color: Theme.of(context).primaryColor,
          ),
        ),
        IconButton(
          splashRadius: 20,
          onPressed: () {
            showSleepTimerModal(context);
          },
          icon: const Icon(
            Icons.timer,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
