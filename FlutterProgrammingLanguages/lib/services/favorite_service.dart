import 'dart:convert';

import 'package:delivery_app/main.dart';
import 'package:delivery_app/models/ProductsModel.dart';
import 'package:dio/dio.dart';

class FavoriteService {
  Dio dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:8000/api/'));


  
  Future<List<ProductsModel>> getFavorite() async {
     try {
      var response = await dio.get(
        "favorites",
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
        
        List<dynamic> data =responseData['products'];
        
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
  
  Future<bool> postFavorite(int id) async {
     try {
      print('poooooost');
      var response = await dio.post(
        "favorites/$id",
        options: Options(
          headers: {
            'Authorization': "Bearer ${storage.getString("token")}",
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Request successful');

        

        return true;
      } else {
        print('Request failed with status: ${response.statusCode}');
        return false;
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
      return false;
    }
  }


  Future<bool> deletFavorite(int id) async {
     try {
      print("deleeeeeeeeeeeeeeeeeeeeeete");
      var response = await dio.delete(
        "favorites/$id",
        options: Options(
          headers: {
            'Authorization': "Bearer ${storage.getString("token")}",
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Request successful');

        

        return true;
      } else {
        print('Request failed with status: ${response.statusCode}');
        return false;
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
      return false;
    }
  }

}