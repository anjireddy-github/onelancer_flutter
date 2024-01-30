import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Let's get started!"),
          Text("Select the way that you want to continue."),
          ElevatedButton(onPressed: () {
            Navigator.of(context)
          .pushNamed('/login');
          }, child: Text("Login")),
          ElevatedButton(onPressed: () {
            Navigator.of(context)
          .pushNamed('/register');
          }, child: Text("Register")),
          Text("or"),
          ElevatedButton(onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Comming Soon")));
          }, child: Text("Continue with Google"))
        ],
      )),
    );
  }
}
