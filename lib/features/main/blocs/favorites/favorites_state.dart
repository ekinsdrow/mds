part of 'favorites_bloc.dart';

@freezed
class FavoritesState with _$FavoritesState {
  const factory FavoritesState.initial() = _Initial;
  const factory FavoritesState.loading() = _Loading;
  const factory FavoritesState.error() = _Error;
  const factory FavoritesState.successDelete({
    required String id,
  }) = _SuccessDelete;
  const factory FavoritesState.successAdd({
    required String id,
  }) = _SuccessAdd;
}
