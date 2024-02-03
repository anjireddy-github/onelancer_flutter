import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelancer_flutter/controllers/auth_controller.dart';
import 'package:onelancer_flutter/theme/appTheme.dart';
import 'package:onelancer_flutter/theme/customTextStyles.dart';
import 'package:onelancer_flutter/ui/register/widgets/RegisterForm.dart';
import 'package:onelancer_flutter/widgets/customElevatedButton.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  AuthController _authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
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
                "Let's get Started",
                style: CustomTextStyles.titleMediumBluegray40001,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            RegisterForm(
              authController: _authController,
            ),
            const SizedBox(height: 16),
            Text(
              "Already had account?",
              style: CustomTextStyles.bodySmallBluegray600,
            ),
            const SizedBox(height: 16),
            CustomElevatedButton(
              text: "LOGIN",
              onPressed: () {
                _authController.errorText('');
                Navigator.of(context).pushNamed('/login');
              },
            ),
          ],
                ),
              ),
        ));
  }
}
