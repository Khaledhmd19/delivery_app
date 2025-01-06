import 'package:delivery_app/views/favorites_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app/widgets/cart_product_card.dart';
import 'package:delivery_app/widgets/main_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_icon/gradient_icon.dart';
import 'package:delivery_app/controllers/cart_controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.put(CartController());

    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Color(0xffffffff),
        title: Text(
          'My Cart',
          style: GoogleFonts.poppins(
            color: Color(0xff323232),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
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
        children: [
          Expanded(
            child: Obx(() => ListView.builder(
                  itemCount: controller.cartItems.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        if (index != 0) const SizedBox(height: 0),
                        CartProductCard(),
                      ],
                    );
                  },
                )),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MainButton(
                  buttonText: 'Checkout',
                  buttonSize: Size(270, 50),
                ),
                const SizedBox(width: 4),
                Obx(() => Column(
                      children: [
                        Text(
                          'Total',
                          style: GoogleFonts.poppins(
                            color: Color(0xff323232),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '\$${controller.totalAmount.value}',
                          style: GoogleFonts.poppins(
                            color: Color(0xffFF8D4D),
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
