import 'package:get/get.dart';

class FavoritesController extends GetxController {
  List<String> favorites = [];
  List<String> get favorite => favorites;

  void toggleFavorites(String category) {
    if (favorites.contains(category)) {
      favorites.remove(category);
    } else {
      favorites.add(category);
    }
    print(favorite);
    update();
    }

    bool isExist(String category) {
      final isExist = favorites.contains(category);
      return isExist;
    }
  }

