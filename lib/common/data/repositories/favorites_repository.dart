import 'package:shared_preferences/shared_preferences.dart';

abstract class IFavoritesRepository {
  Future<void> saveFavorite({
    required String id,
  });
  Future<List<String>> getAllFavorites();
  Future<void> deleteFavorite({
    required String id,
  });
}

class FavoritesRepository implements IFavoritesRepository {
  final _key = 'favorites';

  @override
  Future<List<String>> getAllFavorites() async {
    final sharedPreferences = await SharedPreferences.getInstance();
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
    final sharedPreferences = await SharedPreferences.getInstance();
    final favorites = [
      ...await getAllFavorites(),
      id,
    ];

    await sharedPreferences.setStringList(
      _key,
      favorites,
    );
  }

  @override
  Future<void> deleteFavorite({required String id}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final favorites = [
      for (final i in await getAllFavorites())
        if (id != i) i
    ];

    await sharedPreferences.setStringList(
      _key,
      favorites,
    );
  }
}
