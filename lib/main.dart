import 'package:extra_cash_app/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'screens/landing_page.dart'; // Import Splash Screen
import 'screens/technician_register1.dart';
import 'screens/technician_register2.dart';

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
      home: const HomePage(), // Show Splash Screen First
    );
  }
}
