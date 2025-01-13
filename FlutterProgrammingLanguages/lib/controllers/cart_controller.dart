import 'package:delivery_app/models/ProductsModel.dart';
import 'package:delivery_app/models/storeModel.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  List<ProductsModel> cartItems = [];
  var totalAmount = 0.obs;

  void addStoreToProduct(Stores store) {}

  void addToCart(ProductsModel product) {
    if (cartItems.contains(product)) {
      if (product.stock! > product.productCount&&product.productCount>=0) {
        product.productCount++;
        totalAmount += product.price!;
      }
    } else {
      cartItems.add(product);
      totalAmount += product.price!;
    }
  }

  void removeFromCart(ProductsModel product) {
    if (cartItems.contains(product)) {
      if (product.stock! >= 0&& product.productCount>0) {
        product.productCount--;
        totalAmount -= product.price!;
      }
    } else {
      cartItems.remove(product);
      totalAmount -= product.price!;
    }
    
  }

  void removeProduct(ProductsModel product) {
    totalAmount -= product.price!*product.productCount;
    product.productCount = 0;
    cartItems.remove(product);

    
  }
}
