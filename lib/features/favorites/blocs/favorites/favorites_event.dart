part of 'favorites_bloc.dart';

@freezed
class FavoritesEvent with _$FavoritesEvent {
  const factory FavoritesEvent.save({
    required String id,
  }) = Save;
  const factory FavoritesEvent.delete({
    required String id,
  }) = Delete;
}
