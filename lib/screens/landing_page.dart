import 'package:flutter/material.dart';
import 'register_page.dart'; // Import the Register Screen

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Circular Logo
            ClipOval(
              child: Image.asset(
                'assets/ec_logo.png', // Replace with your actual logo image
                width: 150,
                height: 150,
                fit: BoxFit.cover, // Ensures the image fills the circular shape
              ),
            ),
            const SizedBox(height: 30),

            // App Name
            const Text(
              "EXTRA CASH",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Tagline
            const Text(
              "Quick & Reliable Services at Your Doorstep.",
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // Get Started Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: const Size(220, 50),
              ),
              onPressed: () {
                // Navigate to Register Screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterScreen(),
                  ),
                );
              },
              child: const Text(
                "Get Started",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
