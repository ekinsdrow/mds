import 'package:flutter/material.dart';
import 'package:mds/common/data/models/record.dart';
import 'package:mds/features/main/data/enums/sort_enums.dart';
import 'package:mds/features/main/data/notifiers/models/decorators/favorites_decorator.dart';
import 'package:mds/features/main/data/notifiers/models/decorators/search_decorator.dart';
import 'package:mds/features/main/data/notifiers/models/decorators/sort_decorator.dart';
import 'package:mds/features/main/data/notifiers/models/records_collection.dart';
import 'package:mds/features/main/data/notifiers/models/records_interface.dart';

class CatalogNotifier extends ChangeNotifier {
  CatalogNotifier(List<Record> records)
      : _collection = RecordsCollection(
          records: records,
        ),
        _initCollection = RecordsCollection(
          records: records,
        );

  RecordsCollection _initCollection;

  late IRecords _collection;
  List<Record> get nowList => _collection.getRecords;

  //Fav
  var _showOnlyFav = false;
  bool get showOnlyFav => _showOnlyFav;

  void toogleShowOnlyFav() {
    _showOnlyFav = !_showOnlyFav;
    _applyFilters();
  }

  void deleteRecordFromFav({
    required String id,
  }) {
    _initCollection = _initCollection.deleteRecordFromFav(id: id);
    _applyFilters();
  }

  void addRecordToFav({
    required String id,
  }) {
    _initCollection = _initCollection.addRecordToFav(id: id);
    _applyFilters();
  }

  //Search
  var _searchRequest = '';

  void search(String request) {
    _searchRequest = request;
    _applyFilters();
  }

  void clearSearch() {
    _searchRequest = '';
    _applyFilters();
  }

  //Sort
  var _sortDirection = SortDirections.asc;
  SortDirections get sortDirection => _sortDirection;
  var _sortType = SortTypes.name;
  SortTypes get sortType => _sortType;

  void changeSortDirection(SortDirections sortDirection) {
    _sortDirection = sortDirection;
    _applyFilters();
  }

  void changeSortType(SortTypes sortType) {
    _sortType = sortType;
    _applyFilters();
  }

  //Clear filtres
  void clearFiltres() {
    _showOnlyFav = false;
    _sortDirection = SortDirections.asc;
    _sortType = SortTypes.name;
    _searchRequest = '';
    _applyFilters();
  }

  //Apply Filtres
  void _applyFilters() {
    IRecords records = _initCollection;

    if (_showOnlyFav) {
      records = FavoritesDecorator(records);
    }

    if (_searchRequest.isNotEmpty) {
      records = SearchDecorator(
        records,
        request: _searchRequest,
      );
    }

    records = SortDecorator(
      records,
      sortDirection: _sortDirection,
      sortType: _sortType,
    );

    _collection = records;
    notifyListeners();
  }
}
