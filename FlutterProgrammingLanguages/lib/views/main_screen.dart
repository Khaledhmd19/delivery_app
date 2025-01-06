import 'package:delivery_app/views/cart_screen.dart';
import 'package:delivery_app/views/home_screen.dart';
import 'package:delivery_app/views/orders_screen.dart';
import 'package:delivery_app/views/profile_screen.dart';
import 'package:delivery_app/views/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:get/get.dart';
import 'package:delivery_app/controllers/main_controller.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MainController controller = Get.put(MainController());

    final List<Widget> pages = [
      HomeScreen(),
      SearchScreen(),
      CartScreen(),
      ProfileScreen(),
      OrdersScreen(),
    ];

    return Scaffold(
      body: Obx(() => pages[controller.selectedIndex.value]),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(0.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              onTabChange: controller.onItemTapped,
              rippleColor: Colors.grey[100]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Color(0xffFF8D4D),
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 600),
              tabBackgroundColor: Color.fromARGB(31, 255, 142, 77),
              color: Color(0xff323232),
              textStyle: GoogleFonts.poppins(
                color: Color(0xffFF8D4D),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              tabs: [
                GButton(
                  icon: Icons.home_outlined,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: Icons.shopping_cart_outlined,
                  text: 'Cart',
                ),
                GButton(
                  icon: Icons.person_outline,
                  text: 'Profile',
                ),
                GButton(
                  icon: Icons.shopping_bag_outlined,
                  text: 'Orders',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
