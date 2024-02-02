import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelancer_flutter/controllers/auth_controller.dart';
import 'package:onelancer_flutter/theme/appTheme.dart';
import 'package:onelancer_flutter/theme/customTextStyles.dart';
import 'package:onelancer_flutter/widgets/customElevatedButton.dart';
import 'package:onelancer_flutter/widgets/customPinCodeField.dart';
import 'package:onelancer_flutter/widgets/customTextFormField.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  AuthController _authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Enter OTP",
              style: theme.textTheme.headlineMedium,
              ),
              SizedBox(height: 16,),
              Text("Email Sent to : " + _authController.emailController.text,
              style: CustomTextStyles.titleSmallBluegray40001,
              ),
              SizedBox(height: 24),
              CustomPinCodeTextField(
                context: context, 
                controller: _authController.otpController,
                onChanged: (value){
                  _authController.otpController.text = value;
                },
                ),
                SizedBox(height: 42),
              CustomElevatedButton(
                onPressed: () {
                //TODO : APi call
                Navigator.of(context).pushNamedAndRemoveUntil("/home",  (route) => false);
              }, text: "VERIFY"),
            ],
          ),
        ),
      ),
    );
  }
}