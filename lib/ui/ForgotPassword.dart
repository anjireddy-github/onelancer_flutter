import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelancer_flutter/controllers/auth_controller.dart';
import 'package:onelancer_flutter/theme/appTheme.dart';
import 'package:onelancer_flutter/theme/customTextStyles.dart';
import 'package:onelancer_flutter/utils/validation_utils.dart';
import 'package:onelancer_flutter/widgets/customElevatedButton.dart';
import 'package:onelancer_flutter/widgets/customTextFormField.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter your registered email address",
                  style: CustomTextStyles.titleMediumBluegray40001,
                ),
              ),
              SizedBox(height: 16,),
              Obx(() => Align(alignment: Alignment.topLeft, child: Text(authController.errorText.value, style: CustomTextStyles.titleSmallRed700,))),
              
              SizedBox(height: 8,),
              CustomTextFormField(
                controller: authController.emailController,
                hintText: "Email",
                textInputType: TextInputType.emailAddress,
                validator: ValidationUtils.validateEmail,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                borderDecoration: TextFormFieldStyleHelper.fillIndigo,
                fillColor: themeColors.indigo50,
              ),
              SizedBox(height: 24,),
            
              CustomElevatedButton(
                text: "SEND OTP",
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                        // authController.resetPassword();
                  }
                }
              )
            ]),
          ),
        ),
      ),
    );
  }
}