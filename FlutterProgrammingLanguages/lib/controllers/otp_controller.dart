// import 'package:delivery_app/models/user_model.dart';
// import 'package:delivery_app/services/auth_service.dart';
// import 'package:delivery_app/views/account_setup_screen.dart';
// import 'package:delivery_app/views/success_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class OtbController extends GetxController {
//   final formKey = GlobalKey<FormState>();
//   final textController = TextEditingController();
//   var errorText = RxnString();
//   String number = Get.arguments;
  

  
//   Future<void> validateInput() async {
//     int otp = int.parse(textController.text);
    
//     if (textController.text.trim().isEmpty) {
//       errorText.value = "This field can't be empty";
      
//     } else {
//       errorText.value = null;
//       print(number);
//       bool status = await AuthService().logInOtp(
//         User(number: number, otp: otp),
//       );
    
     
//       if (status) {
//         Get.to(const SuccessScreen());
//       }
//     }
//     Get.to(() => AccountSetup());
  
//     update();
    
//   }

//   @override
//   void onClose() {
//     //textController.dispose();
//     super.onClose();
//   }
// }
