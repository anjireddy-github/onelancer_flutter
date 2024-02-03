import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:onelancer_flutter/LandingPage.dart';
import 'package:onelancer_flutter/controllers/auth_controller.dart';
import 'package:onelancer_flutter/theme/appTheme.dart';
import 'package:onelancer_flutter/ui/ForgotPassword.dart';
import 'package:onelancer_flutter/ui/Proposal/writeProposal.dart';
import 'package:onelancer_flutter/ui/home/screen.dart';
import 'package:onelancer_flutter/ui/login/screen.dart';
import 'package:onelancer_flutter/ui/message/chatScreen.dart';
import 'package:onelancer_flutter/ui/message/screen.dart';
import 'package:onelancer_flutter/ui/onboarding/screen.dart';
import 'package:onelancer_flutter/ui/otp/screen.dart';
import 'package:onelancer_flutter/ui/register/screen.dart';
import 'package:onelancer_flutter/ui/splash/screen.dart';
import 'package:onelancer_flutter/ui/uploadJob/screen.dart';
// import 'package:onelancer_flutter/screens/entryPoint/entry_point.dart';
// import 'package:onelancer_flutter/screens/home/home_screen.dart';
// import 'package:onelancer_flutter/screens/onboding/onboding_screen.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());

    return GetMaterialApp(
      title: 'Open Freelancer',
      initialRoute: '/forgot',
      theme: theme,
      routes: {
        "/": (context) => const SplashScreen(),
        "/onboarding": (context) => const OnboardingScreen(),
        "/login": (context) => const LoginScreen(),
        "/register": (context) => const RegisterScreen(),
        "/forgot": (context) => const ForgotPassword(),
        // "/update_password: ()
        "/otp": (context) => const OtpScreen(),
        "/home": (context) => const HomeScreen(),
        "/chat" : (context) => const ChatScreen(),
      },
      debugShowCheckedModeBanner: false,
      // home: const SplashScreen(),
    );
  }
}