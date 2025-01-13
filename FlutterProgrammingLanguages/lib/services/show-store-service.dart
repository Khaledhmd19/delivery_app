import 'dart:convert';
import 'package:delivery_app/main.dart';
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
}