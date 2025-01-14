import 'package:delivery_app/views/account-setup-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args = Get.arguments;
    String number = args['number'];
    int otp = args['otp'];

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              FontAwesomeIcons.circleCheck,
              size: 100.0,
              color: Color.fromARGB(255, 248, 124, 71),
            )
                .animate()
                .rotate(duration: Duration(milliseconds: 1500))
                .fadeIn(duration: Duration(milliseconds: 2000))
                .moveY(begin: 50),
            const SizedBox(
              height: 40.0,
            ),
            const Text(
              "Success!",
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            const Text(
              "Congratulations! You have been\nsuccessfully authenticated",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xB6B6B6b6),
                fontSize: 16.0,
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => AccountSetup(), arguments: {
                      'number': number,
                      'otp': otp,
                    });
                  },
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
          ],
        ),
      ),
    );
  }
}
