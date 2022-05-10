import 'package:flutter/material.dart';
import 'package:mds/common/data/models/record.dart';

class CatalogNotifier extends ChangeNotifier {
  final List<Record> _nowList;
  List<Record> get nowList => _nowList;

  final List<Record> _fullList;

  CatalogNotifier(this._fullList)
      : _nowList = [
          ..._fullList,
        ];

  void clearFilters() {
    _nowList.clear();

    for (final r in _fullList) {
      _nowList.add(r);
    }

    notifyListeners();
  }

  void search(String text) {
    _nowList.clear();

    for (final record in _fullList) {
      if (record.title.toLowerCase().contains(text.toLowerCase()) ||
          record.authorsString.toLowerCase().contains(text.toLowerCase())) {
        _nowList.add(record);
      }
    }

    notifyListeners();
  }
}
