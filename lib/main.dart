import 'package:flutter/material.dart';
// Import Splash Screen
// import 'screens/forgot-mpin.dart'; // Import Splash Screen
import 'screens/technician_home_page.dart';

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

      //home:  ForgotMpinScreen(), // Show Splash Screen First
      home: TechnicianHomePage(), // Show Splash Screen First
    );
  }
}
