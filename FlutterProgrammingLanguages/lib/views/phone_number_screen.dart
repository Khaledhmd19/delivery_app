import 'package:delivery_app/controllers/phone_number_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneNumber extends StatelessWidget {
  PhoneNumber({super.key});
  final PhoneNumberController controller = Get.put(PhoneNumberController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(border: Border.all()),
                  height: 200,
                  width: double.infinity,
                  child: Text("Hello"),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  "OTP Verifcation",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Enter your phone number to send \none time password",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[500],
                    )),
                const SizedBox(
                  height: 20,
                ),
                Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        GetBuilder<PhoneNumberController>(builder: (_) {
                          return TextFormField(
                            controller: controller.textController,
                            decoration: InputDecoration(
                                labelText: "Phone number",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                hintText: "0937137231",
                                errorText: controller.errorText.value),
                            keyboardType: TextInputType.phone,
                          );
                        }),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
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
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}
