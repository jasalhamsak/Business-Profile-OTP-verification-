import 'package:flutter/material.dart';

import 'Presentation/HomeScreen/components/HomeScreen.dart';
import 'Presentation/LoginScreen/Presentation/LoginScreen.dart';
import 'Presentation/LoginScreen/Presentation/OTPpage.dart';
import 'Presentation/SplashScreen/Splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      home: Splash(

      ),
    );
  }
}
