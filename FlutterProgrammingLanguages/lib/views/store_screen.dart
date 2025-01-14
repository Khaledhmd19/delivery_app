import 'package:delivery_app/models/ProductsModel.dart';
import 'package:delivery_app/models/storeModel.dart';
import 'package:delivery_app/services/show-product-service.dart';
import 'package:delivery_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class StoreScreen extends StatelessWidget {
  StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    Map<String, dynamic> args = Get.arguments;
    Stores store = args['store'];

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
          store.title!,
          style: GoogleFonts.poppins(
            color: Color(0xff323232),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              store.description!,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xffB2B2B2),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Location',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff323232),
              ),
            ),
            Text(
              store.location!,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xffB2B2B2),
              ),
            ),
            const SizedBox(height: 24),
            // Text(
            //   'Description',
            //   style: GoogleFonts.poppins(
            //     fontSize: 16,
            //     fontWeight: FontWeight.w500,
            //     color: Color(0xff323232),
            //   ),
            // ),
            Text(
              'Products',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff323232),
              ),
            ),
            const SizedBox(height: 6),
            Expanded(
              child: FutureBuilder(
                  future: ShowProduct().getproducts(store.id!),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<ProductsModel> products = snapshot.data!;
                      return ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ProductCard(products: products[index],store: store,),
                            ],
                          );
                        },
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
            const SizedBox(height: 55),
          ],
        ),
      ),
    );
  }
}
