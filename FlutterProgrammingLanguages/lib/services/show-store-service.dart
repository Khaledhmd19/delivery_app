import 'dart:convert';
import 'package:delivery_app/main.dart';
import 'package:delivery_app/models/ProductsModel.dart';
import 'package:delivery_app/models/storeModel.dart';
import 'package:dio/dio.dart';

class ShowStore {
  var dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:8000/api/'));

  Future<List<Stores>> getStores() async {
    try {
      print(storage.getString("token"));
      var response = await dio.get(
        "home/stores",
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

        List<dynamic> data = responseData['stores'];

        print(data);

        List<Stores> stores = [];
        for (var i = 0; i < data.length; i++) {
          stores.add(Stores.fromJson(data[i]));
        }

        return stores;
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

  Future<List<Stores>> searchStores(String query) async {
    try {
      dio.options.headers['Authorization'] =
          'Bearer ${storage.getString('token')}';
      dio.options.headers['Accept'] = 'application/json';
      final response = await dio.get(
        'http://10.0.2.2:8000/api/search/stores',
        queryParameters: {'query': query},
      );
      print(query);
      if (response.statusCode == 200) {
        final data = response.data['stores'] as List<dynamic>;
        return data.map((json) => Stores.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load search results');
      }
    } catch (e) {
      throw Exception('Failed to load search results: $e');
    }
  }
}
