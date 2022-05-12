import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mds/features/main/features/player/data/models/record_link.dart';
import 'package:mds/features/main/features/player/data/models/record_link_body.dart';
import 'package:mds/features/main/features/player/data/repositories/record_link_repository.dart';

part 'record_info_event.dart';
part 'record_info_state.dart';
part 'record_info_bloc.freezed.dart';

class RecordInfoBloc extends Bloc<RecordInfoEvent, RecordInfoState> {
  RecordInfoBloc({
    required this.recordLinkRepository,
  }) : super(const _Initial()) {
    on<RecordInfoEvent>(_fetch);
  }

  final IRecordLinkRepository recordLinkRepository;

  FutureOr<void> _fetch(
    RecordInfoEvent event,
    Emitter<RecordInfoState> emit,
  ) async {
    emit(
      const _Loading(),
    );

    try {
      final recordLink = await recordLinkRepository.getRecordLink(
        recordLinkBody: RecordLinkBody(
          fileId: event.fileId,
        ),
      );

      emit(
        _Success(recordLink: recordLink),
      );
    } on Exception catch (e) {
      emit(
        _Error(
          error: e,
        ),
      );
    }
  }
}
