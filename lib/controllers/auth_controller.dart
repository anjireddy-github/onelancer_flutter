import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:onelancer_flutter/api/auth.dart';
import 'package:onelancer_flutter/api/store.dart';
import 'package:onelancer_flutter/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/src/response.dart';

class AuthController extends GetxController {
  TextEditingController emailController =
      TextEditingController(text: "anjireddy5889@gmail.com");
  TextEditingController passwordController =
      TextEditingController(text: "12345@Aa6");
  TextEditingController firstNameController =
      TextEditingController(text: "first");
  TextEditingController lastNameController =
      TextEditingController(text: "last");
  TextEditingController otpController = TextEditingController();
  var errorText = ''.obs;
  var email = "".obs;

  var isLoading = false.obs;
  var isLoggedIn = false.obs;
  var auth_token = ''.obs;
  var uid = '';

  var showPassword = false.obs;

  final authApiClient = AuthApiClient();

  @override
  void onInit() {
    super.onInit();
    checkAuthToken(); // Check for auth token on initialization
  }

  Future<void> checkAuthToken() async {
    isLoading(true);

    String? authToken = await Store.getAuthToken();
    if (authToken != null  && authToken.isNotEmpty) {

      //verify Auth Token
      try {
        var response  = await AuthApiClient.verifyToken();
        uid = response.data["_id"] as String;
      }catch(e) {
print("Error in Verifying Token : $e");      }


      auth_token(authToken);
      isLoggedIn(true);
      isLoading(false);
      Get.offAllNamed('/home');
    } else {
      Future.delayed(const Duration(seconds: 2)).then((_) {
        isLoading(false);
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
      if (response.statusCode == 200) {
        // Get the auth token from body
        String authToken = response.data['token'] as String;

        // Save the auth token to SharedPreferences
        await Store.addAuthToken(authToken);

        // Set the auth token in the controller
        auth_token.value = authToken;
        uid = response.data['_id'] as String;

        isLoggedIn(true);
        isLoading(false);
        emailController.text = "";
        passwordController.text = "";
        Get.offAllNamed('/home');
      }
      else{
        errorText(response.data);
      }
    } catch (e) {
      print('Reached');
      if (e is DioException) {
        if (e.response?.statusCode == 401) {
          errorText(e.response?.data);
        }
        if (e.response?.statusCode == 400) {
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

      uid = response.data['uid'] as String;

      email(emailController.text);
      isLoading(false);
      Get.toNamed('/otp');
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 400) {
          errorText(e.response?.data);
        }
        if (e.response?.statusCode == 404) {
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

  Future<void> verify_otp() async {
    isLoading(true);
    errorText('');
    try {
      var response = await AuthApiClient.verify_otp(new VerifyOtpRequest(uid: uid, otp: otpController.text));

      String authToken = response.data['token'] as String;

      // Save the auth token to SharedPreferences
      await Store.addAuthToken(authToken);

      // Set the auth token in the controller
      auth_token(authToken);

      isLoggedIn(true);
      isLoading(false);

      emailController.text = "";
      passwordController.text = "";
      firstNameController.text = "";
      lastNameController.text = "";
      otpController.text = "";
      Get.offAllNamed('/home');
    } catch (e) {
      if (e is DioException) {
        errorText(e.response?.data["msg"]);
      }
      print("Error occurred during verify otp: $e");
    } finally {
      isLoading(false);
    }
  }

  // Future<void> resetPassword() async {
  //   try {
  //     isLoading(true);
  //     errorText('');
  //
  //     var response = await AuthApiClient.resetPassword(emailController.text);
  //
  //     print(response);
  //     // Get the auth token from headers
  //     uid = response.headers?['uid'] as String;
  //
  //     email(emailController.text);
  //
  //     isLoading(false);
  //     Get.toNamed('/otp');
  //   } catch (e) {
  //     if (e is DioException) {
  //       print(e.response);
  //
  //       if (e.response?.statusCode == 400) {
  //         errorText(e.response?.data);
  //       }
  //       if (e.response?.statusCode == 409) {
  //         errorText(e.response?.data);
  //       }
  //       if (e.response?.statusCode == 404) {
  //         errorText(e.response?.data);
  //       }
  //     }
  //     // Handle login error
  //     print("Error occurred during Reset password: $e");
  //     GetSnackBar(
  //       message: e.toString(),
  //     );
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  Future<void> logout() async {
    try {
      await Store.removeAuthToken();
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
