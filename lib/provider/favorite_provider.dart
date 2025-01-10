// ignore_for_file: prefer_final_fields

import 'package:flutter/foundation.dart';

class FavoriteProvider with ChangeNotifier {
  List<int> _favtItem = [];

  List<int> get favoriteItem => _favtItem;

  void setFavrt(int index) {
    _favtItem.add(index);
    notifyListeners();
  }

  void removeFavrt(index) {
    _favtItem.remove(index);
    notifyListeners();
  }
}
