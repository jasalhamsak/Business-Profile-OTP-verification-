import 'package:businessprofile_otp_verification/Presentation/HomeScreen/Presentation/HomeScreen.dart';
import 'package:flutter/material.dart';

import 'Presentation/LoginScreen/Presentation/LoginScreen.dart';
import 'Presentation/LoginScreen/Presentation/OTPpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Loginscreen(

      ),
    );
  }
}
