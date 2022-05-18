import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mds/common/data/models/record.dart';
import 'package:mds/common/data/repositories/favorites_repository.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';
part 'favorites_bloc.freezed.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final IFavoritesRepository favoritesRepository;

  FavoritesBloc({
    required this.favoritesRepository,
  }) : super(const _Initial()) {
    on<Save>(_save);
    on<Delete>(_delete);
  }

  Future<FutureOr<void>> _save(
    Save event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(
      const _Loading(),
    );

    try {
      await favoritesRepository.saveFavorite(
        id: event.record.recordId,
      );

      emit(
        _SuccessAdd(
          record: event.record.copyWith(
            isFavorite: true,
          ),
        ),
      );
    } catch (e) {
      emit(
        const _Error(),
      );
    }
  }

  FutureOr<void> _delete(
    Delete event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(
      const _Loading(),
    );

    try {
      await favoritesRepository.deleteFavorite(
        id: event.record.recordId,
      );

      emit(
        _SuccessDelete(
          record: event.record.copyWith(
            isFavorite: false,
          ),
        ),
      );
    } catch (e) {
      emit(
        const _Error(),
      );
    }
  }
}
