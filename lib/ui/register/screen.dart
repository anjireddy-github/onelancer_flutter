import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextField(
            decoration: InputDecoration(labelText: "First Name"),
          ),
          const TextField(
            decoration: InputDecoration(labelText: "Last name"),
          ),
          const TextField(
            decoration: InputDecoration(labelText: "Email"),
          ),
          const TextField(
            decoration: InputDecoration(labelText: "Password"),
            obscureText: true,
          ),
          const TextField(
            decoration: InputDecoration(labelText: "Re-Password"),
            obscureText: true,
          ),
          ElevatedButton(onPressed: () {
            // TODO: Implement registration logic here
            Navigator.of(context).pushNamed("/otp");
          }, child: const Text("Register")),
        ],
      ),
    );
  }
}
