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
  AuthController authController = Get.find();

  @override
  void initState() {
    super.initState();
    authController.otpController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Enter OTP",
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 16,
              ),
              Obx(() => Text(
                    "Email Sent to : ${authController.email}",
                    style: CustomTextStyles.titleSmallBluegray40001,
                  )),
              const SizedBox(height: 16),
              Obx(() => Align(alignment: Alignment.topLeft, child: Text(authController.errorText.value, style: CustomTextStyles.titleSmallRed700,))),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Obx(() =>
                CustomPinCodeTextField(
                  context: context,
                  isDisabled : authController.isLoading.value,
                  controller: authController.otpController, onChanged: (String ) {

                   },
                )),
              ),
              const SizedBox(height: 42),
              Obx(() =>
              CustomElevatedButton(
                isDisabled: authController.isLoading.value,
                  isLoading: authController.isLoading.value,
                  onPressed: () {
                    if(authController.otpController.text.length < 6){
                      authController.errorText("Enter valid otp");
                    }else{
                      authController.verify_otp();
                    }
                  },
                  text: "VERIFY")),
            ],
          ),
        ),
      ),
    );
  }
}
