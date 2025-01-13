import 'package:delivery_app/models/ProductsModel.dart';
import 'package:delivery_app/models/storeModel.dart';
import 'package:delivery_app/services/show-store-service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app/services/product_service.dart';

class SearchScreenController extends GetxController {
  final ProductService _productService = ProductService();
  final ShowStore _storeService = ShowStore();
  var products = <ProductsModel>[].obs;
  var stores = <Stores>[].obs;

  var isLoading = false.obs;
  var selectedOption = 'Products'.obs;
  final TextEditingController searchController = TextEditingController();

  void updateSelectedOption(String? newValue) {
    selectedOption.value = newValue!;
  }

  void checkKeyboardVisibility() {
    update();
  }

  List<dynamic> getDropDownValue() {
    if (selectedOption.value == 'Stores') {
      return stores.value;
    } else {
      return products.value;
    }
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

  void searchStores(String query) async {
    try {
      isLoading(true);
      var fetchedStores = await _storeService.searchStores(query);
      stores.assignAll(fetchedStores);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
