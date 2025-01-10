import 'package:delivery_app/controllers/prefrences_controller.dart';
import 'package:delivery_app/views/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/widgets/prefrence_card.dart';
import 'package:get/get.dart';

class Favorites extends StatelessWidget {
  Favorites({super.key});

  final FavoritesController controller = Get.put(FavoritesController());

  List<String> categories = [
    'Clothes',
    'Food',
    'Health',
    'Books',
    'Laptops',
    'Toys'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Last step!',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              'Tell us what you’re interested in',
              style: TextStyle(color: Color(0xffB6B6B6), fontSize: 16.0),
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 450,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return GetBuilder<FavoritesController>(builder: (_) {
                    return GestureDetector(
                      onTap: () {
                        controller.toggleFavorites(categories[index]);
                      },
                      child: controller.isExist(categories[index])
                          ? InterestedCategoriesSelected(
                              name: categories[index],
                            )
                          : InterestedCategories(name: categories[index]),
                    );
                  });
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => MainScreen());
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
          ],
        ),
      ),
    );
  }
}
