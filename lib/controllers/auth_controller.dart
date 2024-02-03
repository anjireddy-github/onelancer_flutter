import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:onelancer_flutter/api/auth.dart';
import 'package:onelancer_flutter/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController(text: "mail@gmail.com");
  TextEditingController passwordController = TextEditingController(text: "Anji@1998");
  TextEditingController firstNameController = TextEditingController(text: "first");
  TextEditingController lastNameController = TextEditingController(text: "last");
  TextEditingController otpController = TextEditingController();
  var errorText = ''.obs;
  var email = "".obs;

  var isLoading = false.obs;
  var isLoggedIn = false.obs;
  var auth_token = ''.obs;
  var uid = '';

  var showPassword = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkAuthToken(); // Check for auth token on initialization
  }

  Future<void> checkAuthToken() async {
    isLoading(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? authToken = prefs.getString('auth_token');
    print(authToken);

    if (authToken != null && authToken.isNotEmpty) {
      // Auth token found, validate it
      // await validateAuthToken(authToken);
      auth_token(authToken);
      isLoggedIn(true);
      isLoading(false);
      Get.offAllNamed('/home');
    } else {
      Future.delayed(const Duration(seconds: 2)).then((_) {
        goToLoginScreen();
      });
    }
  }

  // Future<void> validateAuthToken(String authToken) async {
  //   // Call your validate token API here
  //   // Replace 'your_validate_token_api_endpoint' with your actual API endpoint
  //   try {
  //     isLoading(true);

  //     // Create Dio instance
  //     Dio dio = Dio();

  //     // Make API call
  //     var response = await dio.get(
  //       'your_validate_token_api_endpoint',
  //       options: Options(
  //         headers: {'Authorization': 'Bearer $authToken'},
  //       ),
  //     );

  //     // Check if the token is valid
  //     if (response.statusCode == 200) {
  //       // Token is valid, user is logged in
  //       isLoggedIn(true);
  //     } else {
  //       // Token is invalid or expired, go to login screen
  //       goToLoginScreen();
  //     }
  //   } catch (error) {
  //     // Error occurred while validating token, go to login screen
  //     goToLoginScreen();
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  Future<void> login() async {
    try {
      isLoading(true);
      errorText('');

      // Call your login API here
      // Replace 'your_login_api_endpoint' with your actual API endpoint
      UserLogInRequest user = UserLogInRequest(
          email: emailController.text, password: passwordController.text);
      var response = await AuthApiClient.login(user);

      print(response.headers['x-auth-token'][0]);
      // Get the auth token from headers
      String authToken = response.headers['x-auth-token'][0] as String;

      // Save the auth token to SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', authToken);

      // Set the auth token in the controller
      auth_token.value = authToken;

      isLoggedIn(true);
      isLoading(false);
      emailController.text = "";
      passwordController.text = "";
      Get.offAllNamed('/home');
    } catch (e) {
      print('Reached');
      if (e is DioException) {
        if (e.response?.statusCode == 401) {
          errorText(e.response?.data);
        }
      }
      // Handle login error
      print("Error occurred during login: $e");
      GetSnackBar(
        message: e.toString(),
      );
    } finally {
      isLoading(false);
    }
  }

  Future<void> register() async {
    try {
      isLoading(true);
      errorText('');
      UserRegisterRequest user = UserRegisterRequest(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          password: passwordController.text);
      var response = await AuthApiClient.register(user);

      print(response.headers['uid'][0]);
      // Get the auth token from headers
      uid = response.headers['uid'][0] as String;

      email(emailController.text);

      isLoading(false);
      Get.toNamed('/otp');
    } catch (e) {
      if (e is DioException) {
        
        if (e.response?.statusCode == 400) {
          errorText(e.response?.data);
        }
        if (e.response?.statusCode == 409) {
          errorText(e.response?.data);
        }
      }
      // Handle login error
      print("Error occurred during register: $e");
      GetSnackBar(
        message: e.toString(),
      );
    } finally {
      isLoading(false);
    }
  }

  Future<void> resetPassword() async {
    try {
      isLoading(true);
      errorText('');

      var response = await AuthApiClient.resetPassword(emailController.text);

      print(response.headers['uid'][0]);
      // Get the auth token from headers
      uid = response.headers['uid'][0] as String;

      email(emailController.text);

      isLoading(false);
      Get.toNamed('/otp');
    } catch (e) {
      if (e is DioException) {
        
        if (e.response?.statusCode == 400) {
          errorText(e.response?.data);
        }
        if (e.response?.statusCode == 409) {
          errorText(e.response?.data);
        }
        if (e.response?.statusCode == 401) {
          errorText(e.response?.data);
        }
      }
      // Handle login error
      print("Error occurred during register: $e");
      GetSnackBar(
        message: e.toString(),
      );
    } finally {
      isLoading(false);
    }
  }

  Future<void> logout() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('auth_token');

      otpController.text = "";
      Get.offAllNamed('/login');
    } catch (e) {
      print("Logout Error : ${e.toString()}");
    }
  }

  void goToLoginScreen() {
    // Navigate to the login screen
    Get.offAllNamed('/login');
  }
}
