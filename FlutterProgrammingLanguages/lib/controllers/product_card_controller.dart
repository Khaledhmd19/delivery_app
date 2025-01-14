import 'package:delivery_app/models/ProductsModel.dart';
import 'package:delivery_app/services/favorite_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  bool favoriteRequest(ProductsModel product){
    if (product.isFavorite) {
                            product.isFavorite = false; 
                           var request = FavoriteService().deletFavorite(product.id!);
                          }else{
                             product.isFavorite = true; 
                           var request = FavoriteService().postFavorite(product.id!);
                          }
    update();
    return product.isFavorite;
  }
}
