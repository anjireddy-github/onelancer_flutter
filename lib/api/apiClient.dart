import 'package:dio/dio.dart';
import 'package:onelancer_flutter/api/networkInfo.dart';
import 'package:onelancer_flutter/api/network_interceptor.dart';
import 'package:onelancer_flutter/constants.dart';
import 'package:onelancer_flutter/errors/exections.dart';

class ApiClient {
  final Dio dio;

  ApiClient()
      : dio = Dio(BaseOptions(
          baseUrl: BACKEND_URL,
          connectTimeout: const Duration(seconds: 100),
          contentType: 'application/json',
        )) {
    dio.interceptors.add(NetworkInterceptor());
  }

  /// Method for checking internet connection
  Future<void> checkNetworkConnection() async {
    if (!await NetworkInfo().isConnected()) {
      throw NoInternetException('No Internet Found!');
    }
  }

  /// Checks if the response status code is between 200 and 299
  ///
  /// Users can modify this method with custom logic based on their API response
  bool isSuccessCall(Response response) {
    return response.statusCode != null &&
        response.statusCode! >= 200 &&
        response.statusCode! <= 299;
  }
}

Dio get apiClient => ApiClient().dio;
