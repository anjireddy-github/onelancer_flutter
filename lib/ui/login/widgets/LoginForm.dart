import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelancer_flutter/controllers/auth_controller.dart';
import 'package:onelancer_flutter/theme/appTheme.dart';
import 'package:onelancer_flutter/theme/customTextStyles.dart';
import 'package:onelancer_flutter/utils/validation_utils.dart';
import 'package:onelancer_flutter/widgets/customElevatedButton.dart';
import 'package:onelancer_flutter/widgets/customTextFormField.dart';

class LoginFormWidget extends StatelessWidget {
  final AuthController authController;

  const LoginFormWidget({super.key, required this.authController});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    bool showPassword = true;

    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
              controller: authController.emailController,
              hintText: "Email",
              textInputType: TextInputType.emailAddress,
              validator: ValidationUtils.validateEmail,
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
              borderDecoration: TextFormFieldStyleHelper.fillIndigo,
              fillColor: themeColors.indigo50,
            ),
            SizedBox(height: 16,),
            CustomTextFormField(
              controller: authController.passwordController,
              hintText: "Password",
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.visiblePassword,
              suffix: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconButton(
                  onPressed: (){
                    // setState(() {showPassword = !showPassword;});
                  },
                  icon: Icon(Icons.visibility,size: 24, color: themeColors.blueGray600,),
                ),
              ),
              suffixConstraints: BoxConstraints(maxHeight: 50),
              validator: ValidationUtils.validatePassword,
              obscureText: showPassword,
              contentPadding: EdgeInsets.only(left: 16,top: 15,bottom: 15),
              borderDecoration: TextFormFieldStyleHelper.fillIndigo,
              fillColor: themeColors.indigo50,
            ),
            SizedBox(height:20),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text("Forgot pass word - coming soon.")));
                },
                child: Text(
                  "Forgot password?",
                  style: CustomTextStyles.titleMediumBluegray40001Medium,
                ),
              ),
            ),
              SizedBox(height:16),
            CustomElevatedButton(
              text: "LOGIN",
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                      // authController.login();
                      Navigator.of(context).pushNamed('/otp');
                    }
              }
              ,
            ),
            
          ],
        ),
      ),
    );
  }
}
