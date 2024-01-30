import 'package:dio/dio.dart';
import 'package:onelancer_flutter/api/networkInfo.dart';
import 'package:onelancer_flutter/api/network_interceptor.dart';
import 'package:onelancer_flutter/errors/exections.dart';
import 'package:onelancer_flutter/model/user.dart';
import 'package:onelancer_flutter/utils/logger.dart';

class ApiClient {
  factory ApiClient() {
    return _apiClient;
  }

  ApiClient._internal();

  var url = "http://localhost:8080";

  static final ApiClient _apiClient = ApiClient._internal();

  final _dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 60),
  ))
    ..interceptors.add(NetworkInterceptor());

  ///method can be used for checking internet connection
  ///returns [bool] based on availability of internet
  Future isNetworkConnected() async {
    if (!await NetworkInfo().isConnected()) {
      throw NoInternetException('No Internet Found!');
    }
  }

  /// is `true` when the response status code is between 200 and 299
  ///
  /// user can modify this method with custom logics based on their API response
  bool _isSuccessCall(Response response) {
    if (response.statusCode != null) {
      return response.statusCode! >= 200 && response.statusCode! <= 299;
    }
    return false;
  }

  //Authentication requests
  //register
  Future<String> registerUser({required UserSignUpRequest data}) async {
    Response res = await _dio.post("$url/auth/signup", data: data);
    if (_isSuccessCall(res)) {
      return res.data;
    } else {
      Logger.log(res.data);
      throw Exception(['Server Exception Occurred!', res.statusCode]);
    }
  }
}
