import 'package:delivery_app/controllers/account_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:gradient_elevated_button/gradient_elevated_button.dart';
import 'package:gradient_icon/gradient_icon.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

  final AccountScreenController controller = Get.put(AccountScreenController());

  final List<Map<String, dynamic>> tileData = [
    {
      'title': 'My Orders',
      'icon': Icons.shopping_bag,
      'onTap': (AccountScreenController c) => c.navigateToOrders(),
    },
    {
      'title': 'Delivery Address',
      'icon': Icons.location_on,
      'onTap': (AccountScreenController c) => c.navigateToLocation(),
    },
    {
      'title': 'Payment Card',
      'icon': Icons.payment,
      'onTap': (AccountScreenController c) => c.navigateToPaymentCard(),
    },
    {
      'title': 'Contact Us',
      'icon': Icons.phone,
      'onTap': (AccountScreenController c) => c.navigateToContactUs(),
    },
    {
      'title': 'About',
      'icon': Icons.help_outline,
      'onTap': (AccountScreenController c) => c.navigateToAbout(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: const Color(0xffffffff),
        title: Text(
          'My Account',
          style: GoogleFonts.poppins(
            color: const Color(0xff323232),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: GradientIcon(
              offset: const Offset(0, 0),
              icon: Icons.light_mode,
              gradient: const LinearGradient(
                colors: [
                  Color(0xffFF8D4D),
                  Color(0xffF87C47),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              controller.navigateToFavorites();
            },
            icon: GradientIcon(
              offset: const Offset(0, 0),
              icon: Icons.favorite,
              gradient: const LinearGradient(
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/profile_picture_placeholder.svg',
                    width: 90,
                    height: 90,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'User Name',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff323232),
                        ),
                      ),
                      const SizedBox(height: 4),
                      GestureDetector(
                        onTap: () {
                          controller.editUserInfo();
                        },
                        child: Row(
                          children: [
                            Text(
                              'Edit My Info',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xffB2B2B2),
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.edit,
                              size: 18,
                              color: Color(0xffFF8D4D),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: tileData.map(
                  (tile) {
                    return Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            tile['icon'],
                            color: const Color(0xff323232),
                          ),
                          title: Text(
                            tile['title'],
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff323232),
                            ),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Color(0xff323232),
                          ),
                          onTap: () => tile['onTap'](controller),
                        ),
                        const Divider(thickness: 1, color: Color(0xffECECEC)),
                      ],
                    );
                  },
                ).toList(),
              ),
            ),
            const SizedBox(height: 46),
            GradientElevatedButton.icon(
              icon: const Icon(
                Icons.logout_outlined,
                color: Color(0xffffffff),
                size: 30,
              ),
              onPressed: () {
                controller.logOut();
              },
              style: GradientElevatedButton.styleFrom(
                fixedSize: const Size(320, 52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundGradient: const LinearGradient(
                  colors: [
                    Color(0xffFF8D4D),
                    Color(0xffF87C47),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              label: Text(
                'Log Out',
                style: GoogleFonts.poppins(
                  color: const Color(0xffffffff),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
