import 'dart:convert';
import 'package:delivery_app/main.dart';
import 'package:delivery_app/models/ProductsModel.dart';
import 'package:dio/dio.dart';

class ShowProduct {
  var dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:8000/api/'));

  Future<List<ProductsModel>> getproducts(int storeId) async {
    try {
      var response = await dio.get(
        "stores/$storeId/products",
        options: Options(
          headers: {
            'Authorization': "Bearer ${storage.getString("token")}",
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Request successful');

        Map<String, dynamic> responseData;
        if (response.data is String) {
          responseData = jsonDecode(response.data);
        } else {
          responseData = response.data;
        }

        Map<String, dynamic> store = responseData['store'];
        List<dynamic> data = store['products'];

        print(data);

        List<ProductsModel> products = [];
        for (var i = 0; i < data.length; i++) {
          products.add(ProductsModel.fromJson(data[i]));
        }

        return products;
      } else {
        print('Request failed with status: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      if (e is DioException) {
        print('Dio error: ${e.message}');
        if (e.response != null) {
          print('Response data: ${e.response?.data}');
          print('Response status: ${e.response?.statusCode}');
        }
      } else {
        print('Unexpected error: $e');
      }
      return [];
    }
  }

  Future<ProductsModel?> getproductsDetails(int storeId, int productId) async {
    try {
      var response = await dio.get(
        "stores/$storeId/products/$productId",
        options: Options(
          headers: {
            'Authorization': "Bearer ${storage.getString("token")}",
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Request successful');

        Map<String, dynamic> responseData;
        if (response.data is String) {
          responseData = jsonDecode(response.data);
        } else {
          responseData = response.data;
        }

        Map<String, dynamic> data = responseData['product'];

        ProductsModel product = ProductsModel.fromJsonDetail(data);

        return product;
      } else {
        print('Request failed with status: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      if (e is DioException) {
        print('Dio error: ${e.message}');
        if (e.response != null) {
          print('Response data: ${e.response?.data}');
          print('Response status: ${e.response?.statusCode}');
        }
      } else {
        print('Unexpected error: $e');
      }
      return null;
    }
  }
}
