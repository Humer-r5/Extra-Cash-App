import 'package:flutter/material.dart';
import 'screens/landing_page.dart'; // Import Splash Screen
// import 'screens/forgot-mpin.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EXTRA CASH',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
     // home:  ForgotMpinScreen(), // Show Splash Screen First
     
     home:  SplashScreen(), // Show Splash Screen First
    );
  }
}
