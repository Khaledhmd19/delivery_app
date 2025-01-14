import 'package:delivery_app/controllers/introduction_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionSreen extends StatelessWidget {
  IntroductionSreen({super.key});

  final IntroductionController controller = Get.put(IntroductionController());

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.52,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Center(
            child: SmoothPageIndicator(controller: controller.pageController, count: 3,
            effect: const WormEffect(
              dotHeight: 8.0,
              dotWidth: 8.0,
              dotColor: Color.fromARGB(255, 219, 216, 216),
              activeDotColor:  Color(0xffF87C47),
            ),),
          ),
          const SizedBox(height: 25.0,),
          SizedBox(
            height: screenHeight * 0.16,
            child: PageView(
              controller: controller.pageController,
              onPageChanged: (index){
                controller.isFinal(index);
              },
              children: [
                Container(
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Find Products You Love',
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Browse a wide variety of categories and\ndiscover what you need, all in one place',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xffB6B6B6),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Fast Delivery',
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Get your orders delivered to your\ndoorstep swiftly and reliably, every time',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xffB6B6B6),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Secure and Easy Payments',
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Enjoy hassle-free transactions with\nmultiple safe payment options',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xffB6B6B6),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: ElevatedButton(
                onPressed:
                    (){controller.pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);},
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffF87C47),
                    minimumSize: const Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    )),
                child: GetBuilder<IntroductionController>(
                  builder: (context) {
                    return Text(controller.isFinalPage?
                      "Get Started":'Next',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    );
                  }
                )),
          ),
        ],
      ),
    );
  }
}
