import 'package:get/get.dart';
import 'package:delivery_app/views/orders_screen.dart';
import 'package:delivery_app/views/location_picker_screen.dart';
import 'package:delivery_app/views/credit_card_information_screen.dart';
import 'package:delivery_app/views/favorites_screen.dart';

class AccountScreenController extends GetxController {
  void navigateToOrders() {
    Get.to(() => OrdersScreen());
  }

  void navigateToLocation() {
    Get.to(() => LocationPickerScreen());
  }

  void navigateToPaymentCard() {
    // Get.to(() => CreditCardInformationScreen());
  }

  void navigateToContactUs() {}

  void navigateToAbout() {}

  void navigateToFavorites() {
    Get.to(() => FavoritesScreen());
  }

  void editUserInfo() {}

  void logOut() {}
}
