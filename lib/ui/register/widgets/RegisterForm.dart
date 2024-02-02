import 'package:flutter/material.dart';
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
    bool showPassword = false;
    return Form(
      key: _formKey,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        CustomTextFormField(
          controller: authController.firstNameController,
          hintText: "First Name",
          textInputType: TextInputType.text,
          validator: ValidationUtils.validateText,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          borderDecoration: TextFormFieldStyleHelper.fillIndigo,
          fillColor: themeColors.indigo50,
        ),
        const SizedBox(
          height: 16,
        ),
        CustomTextFormField(
          controller: authController.lastNameController,
          hintText: "Last Name",
          textInputType: TextInputType.text,
          validator: ValidationUtils.validateText,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          borderDecoration: TextFormFieldStyleHelper.fillIndigo,
          fillColor: themeColors.indigo50,
        ),
        const SizedBox(
          height: 16,
        ),
        CustomTextFormField(
          controller: authController.emailController,
          hintText: "Email",
          textInputType: TextInputType.emailAddress,
          validator: ValidationUtils.validateEmail,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          borderDecoration: TextFormFieldStyleHelper.fillIndigo,
          fillColor: themeColors.indigo50,
        ),
        const SizedBox(
          height: 16,
        ),
        CustomTextFormField(
          controller: authController.passwordController,
          hintText: "Password",
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          suffix: InkWell(
            onTap: () {
              // setState(() {showPassword = !showPassword;});
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(30, 13, 16, 13),
              child: const Icon(
                Icons.visibility,
                size: 24,
              ),
            ),
          ),
          suffixConstraints: const BoxConstraints(maxHeight: 50),
          validator: ValidationUtils.validatePassword,
          obscureText: showPassword,
          contentPadding: const EdgeInsets.only(left: 16, top: 15, bottom: 15),
          borderDecoration: TextFormFieldStyleHelper.fillIndigo,
          fillColor: themeColors.indigo50,
        ),
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
        CustomElevatedButton(
          text: "REGISTER",
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              // authController.register();
              Navigator.of(context).pushNamed('/otp');
            }
          },
        ),
      ]),
    );
  }
}
