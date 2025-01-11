// import 'package:delivery_app/models/user_model.dart';
// import 'package:dio/dio.dart';

// class AuthService {
//   Dio dio = Dio();

//   Future<bool> logInPhoneNumber(User user) async {
//     try {
//       var response = await dio.post(
//           'http://192.168.137.151:8000/api/otp-request',
//           data: user.toMapPhonenumber());

//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }

//   Future<bool> logInOtp(User user) async {
//     try {
//       var response = await dio.post(
//           'http://192.168.137.151:8000/api/otp-verification',
//           data: user.toMapOtp());

//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }

//   Future<bool> AccountDetail(User user) async {
//     try {
//       var response = await dio.post('http://192.168.137.151:8000/api/register',
//           data: user.toMapPhonenumber());

//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }
// }
