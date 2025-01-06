import 'package:delivery_app/views/favorites_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_icon/gradient_icon.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Color(0xffffffff),
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
      body: Center(
        child: Text('Orders Screen'),
      ),
    );
  }
}
