import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mds/common/data/models/record.dart';
import 'package:mds/features/init/data/repositories/records_repository.dart';

part 'initial_event.dart';
part 'initial_state.dart';
part 'initial_bloc.freezed.dart';

class InitialBloc extends Bloc<InitialEvent, InitialState> {
  InitialBloc({
    required this.recordsRepository,
  }) : super(const _Loading()) {
    on<InitialEvent>(_onStarted);
  }

  final IRecordsRepository recordsRepository;

  Future<FutureOr<void>> _onStarted(
    InitialEvent event,
    Emitter<InitialState> emit,
  ) async {
    emit(const InitialState.loading());

    List<Record>? records;

    try {
      records = await recordsRepository.getRecords();
    } on Exception catch (e) {
      emit(
        InitialState.error(error: e),
      );
    }

    if (records != null) {
      emit(
        InitialState.success(
          records: records,
        ),
      );
    }
  }
}
