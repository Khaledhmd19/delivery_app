import 'package:delivery_app/views/location_picker_screen.dart';
import 'package:delivery_app/views/credit_card_information_screen.dart';
import 'package:delivery_app/views/favorites_screen.dart';
import 'package:delivery_app/views/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_elevated_button/gradient_elevated_button.dart';
import 'package:gradient_icon/gradient_icon.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  final List<Map<String, dynamic>> tileData = const [
    {
      'title': 'My Orders',
      'icon': Icons.shopping_bag,
      'onTap': _navigateToOrders,
    },
    {
      'title': 'Delivery Address',
      'icon': Icons.location_on,
      'onTap': _navigateToLocation,
    },
    {
      'title': 'Payment Card',
      'icon': Icons.payment,
      'onTap': _navigateToPaymentCard,
    },
    {
      'title': 'Contact Us',
      'icon': Icons.phone,
      'onTap': _navigateToContactUs,
    },
    {
      'title': 'About',
      'icon': Icons.help_outline,
      'onTap': _navigateToAbout,
    },
  ];

  static void _navigateToOrders() {
    Get.to(OrdersScreen());
  }

  static void _navigateToLocation() {
    Get.to(LocationPickerScreen());
  }

  static void _navigateToPaymentCard() {
    // Get.to(CreditCardInformationScreen());
  }

  static void _navigateToContactUs() {}

  static void _navigateToAbout() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Color(0xffffffff),
        title: Text(
          'My Account',
          style: GoogleFonts.poppins(
            color: Color(0xff323232),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: GradientIcon(
              offset: Offset(0, 0),
              icon: Icons.light_mode,
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
          IconButton(
            onPressed: () {
              Get.to(FavoritesScreen());
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/profile_picture_placeholder.svg',
                  width: 90,
                  height: 90,
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User Name',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff323232),
                      ),
                    ),
                    SizedBox(height: 4),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Text(
                            'Edit My Info',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffB2B2B2),
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(
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
                          color: Color(0xff323232),
                        ),
                        title: Text(
                          tile['title'],
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff323232),
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color(0xff323232),
                        ),
                        onTap: tile['onTap'],
                      ),
                      Divider(thickness: 1, color: Color(0xffECECEC)),
                    ],
                  );
                },
              ).toList(),
            ),
          ),
          const SizedBox(
            height: 46,
          ),
          GradientElevatedButton.icon(
            icon: Icon(
              Icons.logout_outlined,
              color: Color(0xffffffff),
              size: 30,
            ),
            onPressed: () {},
            style: GradientElevatedButton.styleFrom(
              fixedSize: Size(320, 52),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundGradient: LinearGradient(
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
                color: Color(0xffffffff),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
