import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var isLoading = false.obs;
  var isLoggedIn = false.obs;
  var auth_token = ''.obs;

  @override
  void onInit() {
    super.onInit();
    checkAuthToken(); // Check for auth token on initialization
  }

  Future<void> checkAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? authToken = prefs.getString('auth_token');

    if (authToken != null && authToken.isNotEmpty) {
      // Auth token found, validate it
      await validateAuthToken(authToken);
    } else {
      // Auth token not found, go to login screen
      goToLoginScreen();
    }
  }

  Future<void> validateAuthToken(String authToken) async {
    // Call your validate token API here
    // Replace 'your_validate_token_api_endpoint' with your actual API endpoint
    try {
      isLoading(true);

      // Create Dio instance
      Dio dio = Dio();

      // Make API call
      var response = await dio.get('your_validate_token_api_endpoint', 
        options: Options(
          headers: {'Authorization': 'Bearer $authToken'},
        ),
      );

      // Check if the token is valid
      if (response.statusCode == 200) {
        // Token is valid, user is logged in
        isLoggedIn(true);
      } else {
        // Token is invalid or expired, go to login screen
        goToLoginScreen();
      }
    } catch (error) {
      // Error occurred while validating token, go to login screen
      goToLoginScreen();
    } finally {
      isLoading(false);
    }
  }

  Future<void> login() async {
    try {
      isLoading(true);

      // Call your login API here
      // Replace 'your_login_api_endpoint' with your actual API endpoint
      Dio dio = Dio();
      var response = await dio.post('your_login_api_endpoint', 
        data: {'email': emailController.text, 'password': passwordController.text},
      );

      // Get the auth token from headers
      String authToken = response.headers['auth-token'] as String;

      // Save the auth token to SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', authToken);

      // Set the auth token in the controller
      auth_token.value = authToken;

      // Validate the obtained token
      await validateAuthToken(authToken);
    } catch (error) {
      // Handle login error
      print("Error occurred during login: $error");
      GetSnackBar(message: error.toString(),);
    } finally {
      isLoading(false);
    }
  }

  void goToLoginScreen() {
    // Navigate to the login screen
    Get.offAllNamed('/login');
  }
}
