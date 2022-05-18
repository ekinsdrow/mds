part of 'favorites_bloc.dart';

@freezed
class FavoritesEvent with _$FavoritesEvent {
  const factory FavoritesEvent.save({
    required Record record,
  }) = Save;
  const factory FavoritesEvent.delete({
    required Record record,
  }) = Delete;
}
