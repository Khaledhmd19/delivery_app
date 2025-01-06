import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  var pageController = PageController().obs; 
  var currentPage = 0.obs; 

  void changePage(int pageIndex) {
    currentPage.value = pageIndex;
    pageController.value.jumpToPage(pageIndex);
  }
}
