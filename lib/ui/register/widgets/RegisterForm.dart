import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:onelancer_flutter/controllers/auth_controller.dart';
import 'package:onelancer_flutter/theme/appTheme.dart';
import 'package:onelancer_flutter/theme/customTextStyles.dart';
import 'package:onelancer_flutter/utils/validation_utils.dart';
import 'package:onelancer_flutter/widgets/customElevatedButton.dart';
import 'package:onelancer_flutter/widgets/customTextFormField.dart';

class RegisterForm extends StatelessWidget {
  final AuthController authController;

  const RegisterForm({super.key, required this.authController});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Obx(() => Align(alignment: Alignment.topLeft, child: Text(authController.errorText.value, style: CustomTextStyles.titleSmallRed700,))),
        Obx(() =>
        CustomTextFormField(
          controller: authController.firstNameController,
          readOnly: authController.isLoading.value,
          hintText: "First Name",
          textInputType: TextInputType.text,
          validator: ValidationUtils.validateText,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          borderDecoration: TextFormFieldStyleHelper.fillIndigo,
          fillColor: themeColors.indigo50,
        )),
        const SizedBox(
          height: 16,
        ),
        Obx(() =>
        CustomTextFormField(
          controller: authController.lastNameController,
          readOnly: authController.isLoading.value,
          hintText: "Last Name",
          textInputType: TextInputType.text,
          validator: ValidationUtils.validateText,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          borderDecoration: TextFormFieldStyleHelper.fillIndigo,
          fillColor: themeColors.indigo50,
        )),
        const SizedBox(
          height: 16,
        ),
        Obx(() =>
        CustomTextFormField(
          controller: authController.emailController,
          readOnly: authController.isLoading.value,
          hintText: "Email",
          textInputType: TextInputType.emailAddress,
          validator: ValidationUtils.validateEmail,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          borderDecoration: TextFormFieldStyleHelper.fillIndigo,
          fillColor: themeColors.indigo50,
        )),
        const SizedBox(
          height: 16,
        ),
        Obx(() =>
        CustomTextFormField(
          controller: authController.passwordController,
          readOnly: authController.isLoading.value,
          hintText: "Password",
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          suffix: InkWell(
            onTap: () {
              // setState(() {showPassword = !showPassword;});
            },
            child: Container(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                onPressed: (){
                  authController.showPassword(!authController.showPassword.value);
                },
                icon: Icon(authController.showPassword.value?Icons.visibility_off:Icons.visibility,size: 24, color: themeColors.blueGray600,),
              ),
            ),
          ),
          suffixConstraints: const BoxConstraints(maxHeight: 50),
          validator: ValidationUtils.validatePassword,
          obscureText: !authController.showPassword.value,
          contentPadding: const EdgeInsets.only(left: 16, top: 15, bottom: 15),
          borderDecoration: TextFormFieldStyleHelper.fillIndigo,
          fillColor: themeColors.indigo50,
        )),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Terms and Conditions - coming soon!")));
            },
            child: Text(
              "Terms and conditions*",
              style: CustomTextStyles.titleSmallPrimary,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Obx(() =>
        CustomElevatedButton(
          isDisabled: authController.isLoading.value,
          isLoading: authController.isLoading.value,
          text: "REGISTER",
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              authController.register();
            }
          },
        )),
      ]),
    );
  }
}
