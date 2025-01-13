import 'package:get/get.dart';
import 'package:delivery_app/services/product_service.dart';
import 'package:delivery_app/models/product_model.dart';

class ProductController extends GetxController {
  final ProductService _productService = ProductService();
  var products = <Product>[].obs;
  var isLoading = true.obs;
  var isFavorite = false.obs;

  @override
  void onInit() {
    // fetchProducts();
    super.onInit();
  }

  // void fetchProducts() async {
  //   try {
  //     isLoading(true);
  //     // var fetchedProducts = await _productService.fetchProducts();
  //     // products.assignAll(fetchedProducts);
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  void toggleFavorite() {
    isFavorite.toggle();
  }
}
