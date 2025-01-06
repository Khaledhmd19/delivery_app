import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <String>["Product 1", "Product 2", "Product 3"].obs;
  var totalAmount = 2400.0.obs;

  void addToCart(String product) {
    cartItems.add(product);
    updateTotal();
  }

  void removeFromCart(String product) {
    cartItems.remove(product);
    updateTotal();
  }

  void updateTotal() {
    totalAmount.value = cartItems.length * 800.0;
  }
}
