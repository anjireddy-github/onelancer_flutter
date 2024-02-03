import 'package:dio/dio.dart';
import 'package:onelancer_flutter/api/apiClient.dart';
import 'package:onelancer_flutter/model/user.dart';

class AuthApiClient {
  static login(UserLogInRequest data) async {
    Response res = await apiClient.post("/auth/login", data: data);
    return res;
  }

  static register(UserRegisterRequest data) async {
    Response res = await apiClient.post("/auth/signup", data: data);
    return res;
  }

  // static  verifyToken(String token ) async {
  //   Response res = await apiClient.post("/auth/login", data: data);
  //   return res;
  // }

  static verifyOtp(String uid, String otp) async {
    Response res = await apiClient.post("/auth/verify_otp",
        data: {'otp': otp}, options: Options(headers: {'uid': uid}));
    return res;
  }

  static  resetPassword(String email ) async {
    Response res = await apiClient.post("/auth/reset_password", data: {'email' : email});
    return res;
  }

  static  updatePassword(String password ) async {
    Response res = await apiClient.post("/auth/update_password", data: {'password' : password});
    return res;
  }
}
