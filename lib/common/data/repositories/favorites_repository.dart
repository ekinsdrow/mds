import 'package:shared_preferences/shared_preferences.dart';

abstract class IFavoritesRepository {
  Future<void> saveFavorite({
    required String id,
  });
  Future<List<String>> getAllFavorites();
}

class FavoritesRepository implements IFavoritesRepository {
  final SharedPreferences sharedPreferences;

  final _key = 'favorites';

  FavoritesRepository({
    required this.sharedPreferences,
  });

  @override
  Future<List<String>> getAllFavorites() async {
    final favorites = sharedPreferences.getStringList(
      _key,
    );

    if (favorites != null) {
      return favorites;
    }

    return [];
  }

  @override
  Future<void> saveFavorite({required String id}) async {
    final favorites = [
      ...await getAllFavorites(),
      id,
    ];

    await sharedPreferences.setStringList(
      _key,
      favorites,
    );
  }
}
