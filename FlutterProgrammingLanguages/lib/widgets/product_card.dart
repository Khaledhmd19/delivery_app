import 'package:delivery_app/controllers/product_card_controller.dart';
import 'package:delivery_app/views/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_icon/gradient_icon.dart';

class ProductCard extends StatelessWidget {
  ProductCard({super.key});

  final String _productName = 'iPhone 16 Pro';
  final String _productImageUrl = 'assets/iPhone_16_pro.png';
  final double _productPrice = 1200;
  final bool _isInStock = true;

  final ProductController _productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailsScreen());
      },
      child: Card(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(
            color: Color.fromARGB(255, 217, 217, 217),
            width: 1.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  _productImageUrl,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _productName,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff323232),
                      ),
                    ),
                    Text(
                      _isInStock ? 'In Stock' : 'Out of Stock',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: _isInStock
                            ? const Color(0xff3C975B)
                            : const Color(0xffc93535),
                      ),
                    ),
                    const SizedBox(height: 28),
                    Text(
                      '\$${_productPrice.toStringAsFixed(2)}',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff323232),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(() => IconButton(
                        onPressed: () {
                          _productController.toggleFavorite();
                        },
                        icon: _productController.isFavorite.value
                            ? GradientIcon(
                                offset: Offset(0, 0),
                                icon: Icons.favorite,
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 255, 141, 77),
                                    Color.fromARGB(255, 248, 124, 71),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              )
                            : GradientIcon(
                                offset: Offset(0, 0),
                                icon: Icons.favorite_border,
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 255, 141, 77),
                                    Color.fromARGB(255, 248, 124, 71),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                      )),
                  const SizedBox(height: 16),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 255, 141, 77),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      color: Colors.white,
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
