import 'package:delivery_app/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xffCECECE),
            size: 30,
          ),
        ),
        backgroundColor: Color(0xffffffff),
        centerTitle: true,
        title: Text(
          'Product Details',
          style: GoogleFonts.poppins(
            color: Color(0xff323232),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 32,
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/iPhone_16_pro.png',
                  width: 300,
                  height: 300,
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: Text(
                  'iPhone 16 pro',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff323232),
                  ),
                ),
              ),
              Center(
                child: Text(
                  '\$1200',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffB2B2B2),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Store',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff323232),
                ),
              ),
              Text(
                'Apple store',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffB2B2B2),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Description',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff323232),
                ),
              ),
              Text(
                'ksdagf asdkghksa gaskjghsakd ghks ksagh ksdag skad gsa gskadg hsdkjg skdaghksadhg ksdagf asdkghksa gaskjghsakd ghks ksagh ksdag skad gsa gskadg hsdkjg skdaghksadhg',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffB2B2B2),
                ),
              ),
              const SizedBox(height: 60),
              Center(
                child: MainButton(
                  onPressed: () {},
                  buttonText: 'Add To Cart',
                  buttonSize: Size(
                    300,
                    55,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
