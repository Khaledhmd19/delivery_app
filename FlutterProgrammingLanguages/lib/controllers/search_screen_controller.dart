import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app/services/product_service.dart';
import 'package:delivery_app/models/product_model.dart';

class SearchScreenController extends GetxController {
  final ProductService _productService = ProductService();
  var products = <Product>[].obs;
  var isLoading = false.obs;
  var selectedOption = 'Product'.obs;
  final TextEditingController searchController = TextEditingController();
  
  void updateSelectedOption(String? newValue) {
    selectedOption.value = newValue!;
  }

  void checkKeyboardVisibility() {
    update();
  }

  void searchProducts(String query) async {
    try {
      isLoading(true);
      var fetchedProducts = await _productService.searchProducts(query);
      products.assignAll(fetchedProducts);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
