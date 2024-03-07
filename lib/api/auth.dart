import 'package:get/get_connect.dart';
import 'package:onelancer_flutter/api/apiClient.dart';
import 'package:onelancer_flutter/model/user.dart';
import 'package:http/http.dart';
import 'package:dio/dio.dart' as dio;

class AuthApiClient {
   static Future<dio.Response> login(UserLogInRequest data) async {

    final response = await apiClient.post("/auth/login", data: data);
    return response;
  }

  static Future<dio.Response> register(UserRegisterRequest data) async {
    final response = await apiClient.post("/auth/signup", data: data);
    return response;
  }

  static Future<dio.Response> verify_otp(VerifyOtpRequest data) async {
    final response = await apiClient.post("/auth/verify_otp", data: data);
    return response;
  }

  static Future<dio.Response> verifyToken() async {
    final response = await apiClient.get("/verify_token");
    return response;
  }

  // static Future<http.Response> register(UserRegisterRequest data) async {
  //   var apiClient = Client();
  //   final response = await apiClient.post("/auth/signup", data: data);
  //   return response;
  // }

  // // static Future<http.Response> verifyToken(String token) async {
  // //   final response = await apiClient.post("/auth/login", data: data);
  // //   return response;
  // // }

  // static Future<http.Response> verifyOtp(String uid, String otp) async {
  //   final response = await apiClient.post(
  //     "/auth/verify_otp",
  //     data: {'otp': otp},
  //     headers: {'uid': uid},
  //   );
  //   return response;
  // }

  // static Future<http.Response> resetPassword(String email) async {
  //   final response =
  //       await apiClient.post("/auth/reset_password", data: {'email': email});
  //   return response;
  // }

  // static Future<http.Response> updatePassword(String password) async {
  //   final response = await apiClient.post(
  //       "/auth/update_password", data: {'password': password});
  //   return response;
  // }
}




// import 'package:dio/dio.dart';
// import 'package:onelancer_flutter/api/apiClient.dart';
// import 'package:onelancer_flutter/model/user.dart';

// class AuthApiClient {
//   static login(UserLogInRequest data) async {
//     return (await apiClient.post("/auth/login", data: data));
//   }

//   static register(UserRegisterRequest data) async {
//     Response res = await apiClient.post("/auth/signup", data: data);
//     return res;
//   }

//   // static  verifyToken(String token ) async {
//   //   Response res = await apiClient.post("/auth/login", data: data);
//   //   return res;
//   // }

//   static verifyOtp(String uid, String otp) async {
//     Response res = await apiClient.post("/auth/verify_otp",
//         data: {'otp': otp}, options: Options(headers: {'uid': uid}));
//     return res;
//   }

//   static resetPassword(String email) async {
//     Response res =
//         await apiClient.post("/auth/reset_password", data: {'email': email});
//     return res;
//   }

//   static updatePassword(String password) async {
//     Response res = await apiClient
//         .post("/auth/update_password", data: {'password': password});
//     return res;
//   }
// }
