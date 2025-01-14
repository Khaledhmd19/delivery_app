import 'dart:convert';

import 'package:delivery_app/main.dart';
import 'package:delivery_app/models/userModel.dart';
import 'package:dio/dio.dart';

String token = '';

class AuthService {
  Dio dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:8000/api/'));

  Future<bool> logInPhoneNumber(User user) async {
    try {
      var response =
          await dio.post('otp-request', data: user.toMapPhonenumber());
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

  Future<bool> logInOtp(User user) async {
    try {
      var response = await dio.post('otp-verification', data: user.toMapOtp());
      isNew.setBool('is_new',response.data['is_new']);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> register(User user) async {
    try {
      var response = await dio.request(
        'register',
        options: Options(
          method: 'POST',
        ),
        data: user.toMap(),
      );

      
       storage.setString('token',response.data["token"]);
      
      if (response.statusCode == 200) {
       
        print(json.encode(response.data));
      } else {
        print(response.statusMessage);
      }

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
