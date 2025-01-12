import 'package:delivery_app/main.dart';
import 'package:delivery_app/views/otp-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:delivery_app/models/userModel.dart';
import 'package:delivery_app/services/auth-service.dart';
import 'package:get/get.dart';

class PhoneNumberController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final textController = TextEditingController();
  var errorText = RxnString();
  String number = "";

  Future<void> validateInput() async {
    String number = textController.text;

    if (textController.text.trim().isEmpty) {
      errorText.value = "This field can't be empty";
    } else {
      errorText.value = null;

      bool status = await AuthService().logInPhoneNumber(
        User(number: textController.text),
      );
      if (status) {
        Get.to(() => OtbCode(), arguments: number);
      }
    }
    print(storage.getString('token'));
    update();
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}

class UserModel {}
