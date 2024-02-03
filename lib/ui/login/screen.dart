import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelancer_flutter/controllers/auth_controller.dart';
import 'package:onelancer_flutter/theme/appTheme.dart';
import 'package:onelancer_flutter/theme/customTextStyles.dart';
import 'package:onelancer_flutter/ui/login/widgets/LoginForm.dart';
import 'package:onelancer_flutter/widgets/customElevatedButton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Welcome to Open Freelancer",
                  style: theme.textTheme.headlineMedium,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Login to your account",
                  style: CustomTextStyles.titleMediumBluegray40001,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              LoginFormWidget(authController: _authController),
              const SizedBox(height: 16),
              Text(
                "OR",
                style: CustomTextStyles.titleMediumBluegray40001,
              ),
              const SizedBox(height: 16),
              CustomElevatedButton(
                text: "REGISTER",
                onPressed: () {
                  _authController.errorText('');
                  Navigator.of(context).pushNamed('/register');
                },
              ),
            ],
          )),
    );
  }
}
