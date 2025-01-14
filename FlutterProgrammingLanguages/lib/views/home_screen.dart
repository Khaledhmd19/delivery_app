import 'package:delivery_app/models/ProductsModel.dart';
import 'package:delivery_app/models/storeModel.dart';
import 'package:delivery_app/services/favorite_service.dart';
import 'package:delivery_app/services/show-store-service.dart';
import 'package:delivery_app/views/favorites_screen.dart';
import 'package:delivery_app/widgets/product_card.dart';
import 'package:delivery_app/widgets/store_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_icon/gradient_icon.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:delivery_app/controllers/home_controller.dart'; 



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final String userLocation = 'Current Location';

  @override
  Widget build(BuildContext context) {
    final HomeController controller =
        Get.put(HomeController()); // Initialize the controller

    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Color(0xffffffff),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delivering To',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Color(0xffc5c5c5),
              ),
            ),
            Text(
              userLocation,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xff757575),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: ()async {
              List<ProductsModel> response = await FavoriteService().getFavorite();
              Get.to(()=>FavoritesScreen(),arguments: response);
            },
            icon: GradientIcon(
              offset: Offset(0, 0),
              icon: Icons.favorite,
              gradient: LinearGradient(
                colors: [
                  Color(0xffFF8D4D),
                  Color(0xffF87C47),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'You Might Like',
                  style: GoogleFonts.poppins(
                    color: Color(0xff323232),
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Obx(() => SizedBox(
                    height: 130,
                    child: PageView(
                      controller: controller.pageController.value,
                      children: [
                        // ProductCard(),
                        // ProductCard(),
                        // ProductCard(),
                        // ProductCard(),
                        // ProductCard(),
                      ],
                    ),
                  )),
              SizedBox(height: 8),
              Obx(() => SmoothPageIndicator(
                    controller: controller.pageController.value,
                    count: 5,
                    effect: WormEffect(
                      dotWidth: 9,
                      dotHeight: 9,
                      spacing: 12,
                      activeDotColor: Color(0xffFF8D4D),
                      dotColor: Color(0xffD9D9D9),
                    ),
                  )),
              const SizedBox(height: 12),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Our Stores',
                  style: GoogleFonts.poppins(
                    color: Color(0xff323232),
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: FutureBuilder<List<Stores>?>(
                    future: ShowStore().getStores(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Stores> store = snapshot.data!;
                        return  ListView.builder(
                            itemCount: store.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  if (index != 0) const SizedBox(height: 12),
                                  StoreCard(
                                    store: store[index],
                                  ),
                                ],
                              );
                            },
                          )
                        ;
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
