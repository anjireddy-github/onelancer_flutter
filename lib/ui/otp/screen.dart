import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Enter OTP"),
          PinCodeTextField(appContext: context, length: 6),
          ElevatedButton(onPressed: () {
            //TODO : APi call
            Navigator.of(context).pushNamedAndRemoveUntil("/home",  (route) => false);
          }, child: Text("Verify")),
        ],
      ),
    );
  }
}