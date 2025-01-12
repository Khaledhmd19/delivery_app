import 'package:delivery_app/controllers/OtpController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtbCode extends StatelessWidget {
  OtbCode({super.key});

  final OtbController controller = Get.put(OtbController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Verification Code",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              "We have sent the verification code\nto your Whatsapp account",
              style: TextStyle(color: Colors.grey[400], fontSize: 16.0),
            ),
            const SizedBox(
              height: 20.0,
            ),
            PinCodeTextField(
              controller: controller.textController,
              keyboardType: TextInputType.number,
              appContext: context,
              length: 4,
              onChanged: (value) {
                print(value);
              },
              pinTheme: PinTheme(
                  selectedColor:  const Color(0xffF87C47),
                  selectedFillColor:  const Color(0xffF87C47),
                  inactiveColor: Colors.grey,
                  activeColor: const Color(0xffF87C47),
                  fieldHeight: 60,
                  fieldWidth: 60,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8.0)),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 0, right: 0),
                child: ElevatedButton(
                    onPressed: controller.validateInput,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffF87C47),
                        minimumSize: const Size(double.infinity, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        )),
                    child: Text(
                      "Continue",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
