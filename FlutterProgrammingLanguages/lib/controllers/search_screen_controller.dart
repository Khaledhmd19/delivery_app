import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreenController extends GetxController {
  var selectedIndex = (-1).obs;
  var selectedOption = 'Product'.obs;
  final TextEditingController searchController = TextEditingController();

  void updateSelectedOption(String? newValue) {
    selectedOption.value = newValue!;
  }

  void checkKeyboardVisibility() {
    update();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}