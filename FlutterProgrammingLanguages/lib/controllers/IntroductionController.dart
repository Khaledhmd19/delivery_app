
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroductionController extends GetxController {
  final pageController = PageController();

  bool isFinalPage = false;
  

  void isFinal(int index) {
    isFinalPage = index == 2;
    update();
  }

}
