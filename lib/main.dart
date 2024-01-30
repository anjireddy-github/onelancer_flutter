import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:onelancer_flutter/LandingPage.dart';
import 'package:onelancer_flutter/controllers/auth_controller.dart';
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
    AuthController _controller = Get.put(AuthController());

    return MaterialApp(
      title: 'Open Freelancer',
      initialRoute: '/login',
      routes: {
        "/": (context) => const SplashScreen(),
        "/onboarding": (context) => const OnboardingScreen(),
        "/login": (context) => const LoginScreen(),
        "/register": (context) => const RegisterScreen(),
        "/otp": (context) => const OtpScreen(),
        "/home": (context) => const HomeScreen(),
        "/chat" : (context) => const ChatScreen(),
      },
      debugShowCheckedModeBanner: false,
      // home: const SplashScreen(),
    );
  }
}

// const defaultInputBorder = OutlineInputBorder(
//   borderRadius: BorderRadius.all(Radius.circular(16)),
//   borderSide: BorderSide(
//     color: Color(0xFFDEE3F2),
//     width: 1,
//   ),
// );


      // localizationsDelegates: const [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: const [
      //   Locale('en', 'US'), // English
      //   // Add more locales as needed
      // ],
      // theme: ThemeData(
      //   scaffoldBackgroundColor: const Color(0xFFEEF1F8),
      //   primarySwatch: Colors.blue,
      //   fontFamily: "Intel",
      //   elevatedButtonTheme: ElevatedButtonThemeData(
      //     style: ElevatedButton.styleFrom(foregroundColor: Colors.white),
      //   ),
      //   inputDecorationTheme: const InputDecorationTheme(
      //     filled: true,
      //     fillColor: Colors.white,
      //     errorStyle: TextStyle(height: 0),
      //     border: defaultInputBorder,
      //     enabledBorder: defaultInputBorder,
      //     focusedBorder: defaultInputBorder,
      //     errorBorder: defaultInputBorder,
      //   ),
      // ),