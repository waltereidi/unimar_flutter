import 'package:flutter/material.dart';
import 'package:unimar_sab_19/models/petmodel.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<Pet> _favoritesPet = [];

  List<Pet> get favoritesPet => _favoritesPet;

  void addFavoritePet(Pet pet) {
    _favoritesPet.add(pet);
    notifyListeners(); // Notifica os ouvintes sobre a mudança
  }

  void removeFavoritePet(Pet pet) {
    _favoritesPet.remove(pet);
    notifyListeners();
  }
}
