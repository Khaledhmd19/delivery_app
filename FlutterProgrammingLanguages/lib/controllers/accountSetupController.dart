import 'dart:io';

import 'package:delivery_app/main.dart';
import 'package:delivery_app/models/userModel.dart';
import 'package:delivery_app/services/auth-service.dart';
import 'package:delivery_app/views/favorites-screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AccountSetupController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final locationController = TextEditingController();

  var errorFirstName = RxnString();
  var errorLastName = RxnString();
  var errorLocation = RxnString();

  var selectedImage = Rx<File?>(null);

  bool isComplet1 = false;
  bool isComplet2 = false;
  bool isComplet3 = false;

  Map<String, dynamic> args = Get.arguments;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    }
  }

  Future<void> validateInput() async {
    String number = args['number'];
    int otp = args['otp'];

    if (firstNameController.text.trim().isEmpty) {
      errorFirstName.value = "This field can't be empty";
      isComplet1 = false;
    } else {
      errorFirstName.value = null;
      isComplet1 = true;
    }
    if (lastNameController.text.trim().isEmpty) {
      errorLastName.value = "This field can't be empty";
      isComplet2 = false;
    } else {
      errorLastName.value = null;
      isComplet2 = true;
    }
    if (locationController.text.trim().isEmpty) {
      errorLocation.value = "This field can't be empty";
      isComplet3 = false;
    } else {
      errorLocation.value = null;
      isComplet3 = true;
    }

    if (isComplet1 && isComplet2 && isComplet3) {
      bool status = await AuthService().register(User(
          number: number,
          otp: otp,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          location: locationController.text,
          image: ''));

      print(storage.getString('token'));
      if (status) {
        Get.to(() => Favorites());
      }
    }
    update();
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    locationController.dispose();
    super.onClose();
  }
}
