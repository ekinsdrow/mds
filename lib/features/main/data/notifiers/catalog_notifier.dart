import 'package:flutter/material.dart';
import 'package:mds/common/data/models/record.dart';
import 'package:mds/features/main/data/enums/sort_enums.dart';

class CatalogNotifier extends ChangeNotifier {
  final List<Record> _nowList;
  List<Record> get nowList => _nowList;

  final List<Record> _fullList;

  var _sortDirection = SortDirections.asc;
  SortDirections get sortDirection => _sortDirection;

  var _sortType = SortTypes.name;
  SortTypes get sortType => _sortType;

  var _searchText = '';

  CatalogNotifier(this._fullList) : _nowList = [..._fullList] {
    _applyFiltres();
  }

  void clearSearch() {
    _searchText = '';
    _applyFiltres();
  }

  void search(String text) {
    _searchText = text;
    _applyFiltres();
  }

  void changeSortType(SortTypes sortType) {
    _sortType = sortType;
    _applyFiltres();
  }

  void changeSortDirection(SortDirections sortDirection) {
    _sortDirection = sortDirection;
    _applyFiltres();
  }

  void _applyFiltres() {
    _applySearch();
    _applySort();
    notifyListeners();
  }

  void _applySearch() {
    _nowList.clear();

    if (_searchText == '') {
      _nowList.addAll(_fullList);
    } else {
      for (final record in _fullList) {
        if (record.title.toLowerCase().contains(_searchText.toLowerCase()) ||
            record.authorsString
                .toLowerCase()
                .contains(_searchText.toLowerCase())) {
          _nowList.add(record);
        }
      }
    }
  }

  void _applySort() {
    if (_sortType == SortTypes.name) {
      _nowList.sort(
        (a, b) => a.title.toLowerCase().compareTo(
              b.title.toLowerCase(),
            ),
      );
    } else if (_sortType == SortTypes.author) {
      _nowList.sort(
        (a, b) => a.authorsString.toLowerCase().compareTo(
              b.authorsString.toLowerCase(),
            ),
      );
    } else if (_sortType == SortTypes.date) {
      _nowList.sort(
        (a, b) => a.streamingDate.compareTo(b.streamingDate),
      );
    } else if (_sortType == SortTypes.duration) {
      _nowList.sort(
        (a, b) => a.file.duration.compareTo(
          b.file.duration,
        ),
      );
    }

    if (_sortDirection == SortDirections.desc) {
      final reversed = [..._nowList.reversed];

      _nowList.clear();

      _nowList.addAll(reversed);
    }
  }
}
