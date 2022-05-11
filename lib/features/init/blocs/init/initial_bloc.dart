import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mds/common/data/models/record.dart';
import 'package:mds/common/data/repositories/favorites_repository.dart';
import 'package:mds/features/init/data/repositories/records_repository.dart';

part 'initial_event.dart';
part 'initial_state.dart';
part 'initial_bloc.freezed.dart';

class InitialBloc extends Bloc<InitialEvent, InitialState> {
  InitialBloc({
    required this.recordsRepository,
    required this.favoritesRepository,
  }) : super(const _Loading()) {
    on<InitialEvent>(_onStarted);
  }

  final IRecordsRepository recordsRepository;
  final IFavoritesRepository favoritesRepository;

  Future<FutureOr<void>> _onStarted(
    InitialEvent event,
    Emitter<InitialState> emit,
  ) async {
    emit(const InitialState.loading());

    try {
      final records = await recordsRepository.getRecords();
      final favorites = await favoritesRepository.getAllFavorites();

      final favRecords = <Record>[];

      for (final record in records) {
        if (favorites.contains(record.recordId)) {
          favRecords.add(
            record.copyWith(
              isFavorite: true,
            ),
          );
        } else {
          favRecords.add(record);
        }
      }

      emit(
        InitialState.success(
          records: favRecords,
        ),
      );
    } on Exception catch (e) {
      emit(
        InitialState.error(error: e),
      );
    }
  }
}
