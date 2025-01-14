import 'package:get/get.dart';

class ProductController extends GetxController {
  var isFavorite = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void toggleFavorite() {
    isFavorite.toggle();
  }
}
