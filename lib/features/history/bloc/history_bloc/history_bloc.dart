import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mds/common/data/models/record.dart';
import 'package:mds/features/history/data/repository/history_repository.dart';

part 'history_event.dart';
part 'history_state.dart';
part 'history_bloc.freezed.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc({
    required this.historyRepository,
  }) : super(
          const _Records(
            ids: [],
          ),
        ) {
    on<_Save>(_save);
    on<_Clear>(_clear);
    on<_GetRecordsIds>(_getRecordsIds);
  }

  final IHistoryRepository historyRepository;

  FutureOr<void> _save(
    _Save event,
    Emitter<HistoryState> emit,
  ) async {
    try {
      final history = await historyRepository.saveHistoryRecord(event.record);

      emit(
        _Records(
          ids: history,
        ),
      );
    } catch (e) {
      emit(
        const _Error(),
      );
    }
  }

  FutureOr<void> _clear(
    _Clear event,
    Emitter<HistoryState> emit,
  ) async {
    try {
      final history = await historyRepository.clearHistory();

      emit(
        _Records(
          ids: history,
        ),
      );
    } catch (e) {
      emit(
        const _Error(),
      );
    }
  }

  FutureOr<void> _getRecordsIds(
    _GetRecordsIds event,
    Emitter<HistoryState> emit,
  ) async {
    try {
      final history = await historyRepository.getHistoryIds();

      emit(
        _Records(
          ids: history,
        ),
      );
    } catch (e) {
      emit(
        const _Error(),
      );
    }
  }
}
