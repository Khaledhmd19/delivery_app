import 'package:delivery_app/main.dart';
import 'package:delivery_app/models/ProductsModel.dart';
import 'package:dio/dio.dart';


class ProductService {
  final Dio _dio = Dio();

  final token = storage.getString('token');

  Future<List<ProductsModel>> searchProducts(String query) async {
    try {
      _dio.options.headers['Authorization'] =
          'Bearer ${storage.getString('token')}';
      _dio.options.headers['Accept'] = 'application/json';
      final response = await _dio.get(
        'http://10.0.2.2:8000/api/search/products',
        queryParameters: {'query': query},
      );
      print(query);
      if (response.statusCode == 200) {
        final data = response.data['products'] as List<dynamic>;
        return data.map((json) => ProductsModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load search results');
      }
    } catch (e) {
      throw Exception('Failed to load search results: $e');
    }
  }
}
