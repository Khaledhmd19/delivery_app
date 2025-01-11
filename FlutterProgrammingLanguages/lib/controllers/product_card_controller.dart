import 'package:get/get.dart';

class ProductController extends GetxController {
  var isFavorite = false.obs;

  void toggleFavorite() {
    isFavorite.toggle();
  }
}
