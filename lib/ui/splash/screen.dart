import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Duration duration = const Duration(seconds: 2);
  @override 
  void initState() {
    super.initState();
    Future.delayed(duration).then((_) {
    //   Navigator.of(context)
    //       .pushReplacementNamed('/onboarding');
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Text("OpenFreelancer"),
      ),
    );
  }
}