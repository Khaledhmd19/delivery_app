import 'dart:io';
import 'package:delivery_app/views/prefrences_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AccountSetupCotroller extends GetxController {
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final locationController = TextEditingController();

  var errorFristName = RxnString();
  var errorLastName = RxnString();
  var errorLocation = RxnString();

  var selectedImage = Rx<File?>(null);

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    }
  }

  void validateInput() {
    if (firstNameController.text.trim().isEmpty) {
      errorFristName.value = "This field can't be empty";
    } else {
      errorFristName.value = null;
    }
    if (lastNameController.text.trim().isEmpty) {
      errorLastName.value = "This field can't be empty";
    } else {
      errorLastName.value = null;
    }
    if (locationController.text.trim().isEmpty) {
      errorLocation.value = "This field can't be empty";
    } else {
      errorLocation.value = null;
    }
    Get.to(() => Favorites());

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
