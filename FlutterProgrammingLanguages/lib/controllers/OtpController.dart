import 'package:delivery_app/main.dart';
import 'package:delivery_app/models/userModel.dart';
import 'package:delivery_app/services/auth-service.dart';
import 'package:delivery_app/views/main_screen.dart';
import 'package:delivery_app/views/success-screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtbController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final textController = TextEditingController();
  var errorText = RxnString();
  String number = Get.arguments;

  Future<void> validateInput() async {
    int otp = int.parse(textController.text);

    if (textController.text.trim().isEmpty) {
      errorText.value = "This field can't be empty";
    } else {
      errorText.value = null;
      print(number);
      bool status = await AuthService().logInOtp(
        User(number: number, otp: otp),
      );

      if (status) {
        if (isNew.getBool('is_new')!) {
          Get.to(() => SuccessScreen(), arguments: {
          'number': number,
          'otp': otp,
        });
        }else{
          Get.off(()=>MainScreen());
        }
        
      }
    }

    update();
  }

  @override
  void onClose() {
    //textController.dispose();
    super.onClose();
  }
}
