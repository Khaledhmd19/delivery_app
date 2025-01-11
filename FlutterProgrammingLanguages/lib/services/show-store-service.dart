import 'dart:convert';
import 'package:delivery_app/main.dart';
import 'package:delivery_app/models/storeModel.dart';
import 'package:dio/dio.dart';

class ShowStore {
  var dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:8000/api/'));

  Future<List<Stores>> getStores() async {
    try {
      var response = await dio.get(
        "home/stores",
        options: Options(
          headers: {
            'Authorization': "Bearer ${storage.getString("token")}",
          },
        ),
      );

      // Check if the response is successful
      if (response.statusCode == 200) {
        print('Request successful');

        // Parse the response as a Map
        Map<String, dynamic> responseData;
        if (response.data is String) {
          responseData = jsonDecode(response.data);
        } else {
          responseData = response.data;
        }

        // Extract the 'stores' array from the response
        List<dynamic> data = responseData['stores'];

        print(data); // Debugging: Print the raw data

        // Convert JSON data to List<Stores>
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
}