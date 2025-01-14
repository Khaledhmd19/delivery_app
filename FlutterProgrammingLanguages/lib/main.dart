import 'package:delivery_app/controllers/search_screen_controller.dart';
import 'package:delivery_app/views/main_screen.dart';
import 'package:delivery_app/views/phone-number-screen.dart';
import 'package:delivery_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences storage;
late SharedPreferences isNew;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  storage = await SharedPreferences.getInstance();
  isNew = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delivery App',
      home: storage.getString('token') == null ? PhoneNumber() : MainScreen()
      ,
      initialBinding: BindingsBuilder(() {
        Get.put(SearchScreenController());
      }),
    );
  }
}
