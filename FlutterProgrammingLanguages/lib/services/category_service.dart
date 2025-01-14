import 'dart:convert';

import 'package:delivery_app/main.dart';
import 'package:delivery_app/models/category_model.dart';
import 'package:dio/dio.dart';

class CategoryService {
  var dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:8000/api/'));

  Future<List<Categories>> getCategory() async {
    try {
      // print(storage.getString("token"));
      var response = await dio.get(
        "categories",
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

        List<dynamic> data = responseData['categories'];

        print(data);

        List<Categories> categories = [];
        for (var i = 0; i < data.length; i++) {
          categories.add(Categories.fromJson(data[i]));
        }

        return categories;
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

  Future<bool> logInPhoneNumber(List<Categories> categories) async {
    try {
      final categoriesJson =
          categories.map((category) => category.toJson()).toList();

      var response = await dio.post('categories',
          data: jsonEncode({'categories': categoriesJson}),
          options: Options(
            headers: {'Authorization': "Bearer ${storage.getString("token")}"},
          ));
      if (response.statusCode == 200) {
        return true;
      } else {
        print('Failed to log in: ${response.statusCode}');
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
