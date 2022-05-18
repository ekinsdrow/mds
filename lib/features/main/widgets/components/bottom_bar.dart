import 'package:audio_service/audio_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mds/common/assets/constants.dart';
import 'package:mds/common/data/models/record.dart';
import 'package:mds/common/extensions/string_extension.dart';
import 'package:mds/common/widgets/progress_bar.dart';
import 'package:mds/features/app/router/router.dart';
import 'package:mds/features/favorites/blocs/favorites/favorites_bloc.dart';
import 'package:mds/features/playing/logic/audio_handler.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({
    required this.activeIndex,
    required this.callback,
    Key? key,
  }) : super(key: key);

  final int activeIndex;
  final Function(int index) callback;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        Constants.smallPadding,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(
          Constants.borderRadius * 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor,
            offset: const Offset(
              0,
              2,
            ),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: StreamBuilder<Record?>(
        stream: context.read<MdsAudioHandler>().recordStream,
        builder: (context, snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (snapshot.data != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _PlayerWidget(
                      record: snapshot.data!,
                    ),
                    const SizedBox(
                      height: Constants.smallPadding,
                    ),
                  ],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _Item(
                    icon: Icons.home,
                    active: widget.activeIndex == 0,
                    callback: () {
                      widget.callback(0);
                    },
                  ),
                  _Item(
                    icon: Icons.settings,
                    active: widget.activeIndex == 1,
                    callback: () {
                      widget.callback(1);
                    },
                  ),
                  _Item(
                    icon: Icons.info,
                    active: widget.activeIndex == 2,
                    callback: () {
                      widget.callback(2);
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    required this.icon,
    required this.active,
    required this.callback,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final bool active;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        child: InkWell(
          borderRadius: BorderRadius.circular(
            Constants.borderRadius,
          ),
          onTap: callback,
          child: Container(
            padding: const EdgeInsets.all(
              Constants.smallPadding,
            ),
            child: Icon(
              icon,
              color: active
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).iconTheme.color,
            ),
          ),
        ),
      ),
    );
  }
}

class _PlayerWidget extends StatelessWidget {
  const _PlayerWidget({
    Key? key,
    required this.record,
  }) : super(key: key);

  final Record record;

  @override
  Widget build(BuildContext context) {
    final player = context.read<MdsAudioHandler>();

    return Material(
      borderRadius: BorderRadius.circular(
        Constants.borderRadius,
      ),
      color: Theme.of(context).splashColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(
          Constants.borderRadius,
        ),
        onTap: () {
          context.router.push(
            const PlayerRoute(),
          );
        },
        child: StreamBuilder<PlaybackState>(
          stream: player.playbackState.stream,
          builder: (context, playbackStateValue) {
            final playbackState = playbackStateValue.data ?? PlaybackState();

            return Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.smallPadding,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          record.fullTitle.sub(30),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (record.isFavorite) {
                                context.read<FavoritesBloc>().add(
                                      FavoritesEvent.delete(
                                        record: record,
                                      ),
                                    );
                              } else {
                                context.read<FavoritesBloc>().add(
                                      FavoritesEvent.save(
                                        record: record,
                                      ),
                                    );
                              }
                            },
                            splashRadius: 20,
                            icon: Icon(
                              record.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                            ),
                          ),
                          if (playbackState.processingState ==
                              AudioProcessingState.loading)
                            Row(
                              children: const [
                                SizedBox(
                                  width: 14,
                                ),
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                ),
                                SizedBox(
                                  width: 14,
                                ),
                              ],
                            )
                          else if (playbackState.processingState ==
                              AudioProcessingState.error)
                            Row(
                              children: const [
                                SizedBox(
                                  width: 14,
                                ),
                                Icon(
                                  Icons.close,
                                  color: Colors.red,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 14,
                                ),
                              ],
                            )
                          else
                            IconButton(
                              onPressed: () {
                                if (playbackState.playing) {
                                  player.pause();
                                } else {
                                  player.play();
                                }
                              },
                              splashRadius: 20,
                              icon: Icon(
                                playbackState.playing
                                    ? Icons.pause
                                    : Icons.play_arrow,
                              ),
                            )
                        ],
                      ),
                    ],
                  ),
                  ProgressBar(
                    record: record,
                    progressBarWidth:MediaQuery.of(context).size.width - 70,
                  ),
                  const SizedBox(
                    height: Constants.smallPadding,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
