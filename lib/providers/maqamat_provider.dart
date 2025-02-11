import 'package:flutter/foundation.dart';
import '../models/maqam.dart';

class MaqamatProvider with ChangeNotifier {
  final List<Maqam> _maqamat = List.from(Maqam.sampleMaqamat);
  String _searchQuery = '';

  List<Maqam> get maqamat => _maqamat;
  List<Maqam> get favoriteMaqamat => _maqamat.where((m) => m.isFavorite).toList();
  
  List<Maqam> get filteredMaqamat {
    if (_searchQuery.isEmpty) {
      return _maqamat;
    }
    return _maqamat.where((maqam) {
      final searchLower = _searchQuery.toLowerCase();
      return maqam.name.toLowerCase().contains(searchLower) ||
          maqam.notes.any((note) => note.toLowerCase().contains(searchLower)) ||
          maqam.description.toLowerCase().contains(searchLower);
    }).toList();
  }

  void searchMaqamat(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void toggleFavorite(Maqam maqam) {
    final index = _maqamat.indexWhere((m) => m.name == maqam.name);
    if (index >= 0) {
      final updatedMaqam = _maqamat[index].copyWith(isFavorite: !maqam.isFavorite);
      _maqamat[index] = updatedMaqam;
      notifyListeners();
    }
  }
}
