import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:mds/common/assets/constants.dart';
import 'package:mds/common/data/models/record.dart';
import 'package:mds/common/extensions/date_extension.dart';
import 'package:mds/common/extensions/duration_extension.dart';
import 'package:mds/features/favorites/blocs/favorites/favorites_bloc.dart';
import 'package:mds/features/playing/logic/audio_handler.dart';
import 'package:provider/provider.dart';

class RecordListItem extends StatelessWidget {
  const RecordListItem({
    required this.record,
    required this.callback,
    this.active = false,
    Key? key,
  }) : super(key: key);

  final Record record;
  final bool active;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: active
          ? Theme.of(context).primaryColor.withAlpha(150)
          : Colors.transparent,
      borderRadius: BorderRadius.circular(
        Constants.borderRadius * 2,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(
          Constants.borderRadius * 2,
        ),
        onTap: callback,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: Constants.mediumPadding,
            horizontal: Constants.smallPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    record.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    record.authorsString,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Text(
                        record.file.duration.format(),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${int.parse(record.file.size) ~/ 1024}Mb',
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        record.date.formatDate(),
                      ),
                    ],
                  ),
                ],
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

                  //TODO: check states
                  StreamBuilder<PlaybackState>(
                    stream: context.read<MdsAudioHandler>().playbackState,
                    builder: (context, snapshot) {
                      if (snapshot.data != null) {
                        if (snapshot.data!.playing) {
                          return const Icon(
                            Icons.pause,
                          );
                        }
                      }
                      return const Icon(
                        Icons.play_arrow,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
