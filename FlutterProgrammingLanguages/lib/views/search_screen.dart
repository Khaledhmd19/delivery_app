import 'package:delivery_app/widgets/store_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_icon/gradient_icon.dart';
import 'package:delivery_app/controllers/search_screen_controller.dart';
import 'package:delivery_app/widgets/product_card.dart';
import 'package:delivery_app/views/favorites_screen.dart';

class SearchScreen extends StatelessWidget {
  final SearchScreenController _searchController = Get.find();

  @override
  Widget build(BuildContext context) {
    final String dropDownValue = _searchController.selectedOption.value;
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Color(0xffffffff),
        title: Text(
          'Find What You Like',
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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => DropdownButton<String>(
                    value: _searchController.selectedOption.value,
                    onChanged: (String? newValue) {
                      _searchController.updateSelectedOption(newValue);
                    },
                    items: <String>['Products', 'Stores']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffDDDDDD),
                          ),
                        ),
                      );
                    }).toList(),
                    underline: Container(),
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Color(0xffFF8D4D),
                    ),
                    dropdownColor: Colors.white,
                  ),
                ),
                TextField(
                  controller: _searchController.searchController,
                  decoration: InputDecoration(
                    hintText: 'What are you looking for?',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.search, color: Colors.grey),
                      onPressed: () {
                        if (_searchController.selectedOption.value ==
                            'Products') {
                          _searchController.searchProducts(
                            _searchController.searchController.text,
                          );
                        } else {
                          _searchController.searchStores(
                            _searchController.searchController.text,
                          );
                        }
                      },
                    ),
                  ),
                  onSubmitted: (query) {
                    print(_searchController.selectedOption.value);
                    if (_searchController.selectedOption.value == 'Stores') {
                      _searchController.searchStores(query);
                    } else {
                      _searchController.searchProducts(query);
                    }
                  },
                  onTap: () {
                    _searchController.checkKeyboardVisibility();
                  },
                ),
                const SizedBox(height: 5),
                Expanded(
                  child: Obx(() {
                    if (_searchController.isLoading.value) {
                      return Center(child: CircularProgressIndicator());
                    } else if (_searchController.getDropDownValue().isEmpty) {
                      return Center(
                        child: Text(
                          'No products found',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Color(0xffB2B2B2),
                          ),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: _searchController.getDropDownValue().length,
                        itemBuilder: (context, index) {
                          return _searchController.selectedOption.value ==
                                  "Products"
                              ? ProductCard(
                                  products: _searchController
                                      .getDropDownValue()[index],
                                )
                              : StoreCard(store: _searchController.stores.value[index]);
                        },
                      );
                    }
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
