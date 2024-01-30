import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelancer_flutter/controllers/auth_controller.dart';
import 'package:onelancer_flutter/utils/validation_utils.dart';

class LoginFormWidget extends StatelessWidget {
  final AuthController authController;

  const LoginFormWidget({required this.authController});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: authController.emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: ValidationUtils.validateEmail,
            ),
            TextFormField(
              controller: authController.passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: ValidationUtils.validatePassword,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      authController.login();
                      // Navigator.of(context).pushNamed('/otp');
                    }
                  },
                  child: const Text('Login'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Back'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
