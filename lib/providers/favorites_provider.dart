import 'package:flutter/material.dart';
import 'package:unimar_sab_19/models/petmodel.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<Pet> _favoritesPet = [];

  List<Pet> get favoritesPet => _favoritesPet;

  void addFavoritePet(Pet pet) {
    if (!isFavorite(pet)) {
      _favoritesPet.add(pet);
      notifyListeners(); // Notifica os ouvintes sobre a mudança
    }
  }

  void removeFavoritePet(Pet pet) {
    _favoritesPet.removeWhere((favPet) => favPet.id == pet.id);
    notifyListeners();
  }

  bool isFavorite(Pet pet) {
    return _favoritesPet.any((favPet) => favPet.id == pet.id);
  }

  void toggleFavorite(Pet pet) {
    if (isFavorite(pet)) {
      removeFavoritePet(pet);
    } else {
      addFavoritePet(pet);
    }
  }

  int get favoritesCount => _favoritesPet.length;
}
