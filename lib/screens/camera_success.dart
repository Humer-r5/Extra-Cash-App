import 'package:flutter/material.dart';
import 'dart:async';
import 'home_page.dart';

class CameraSuccessScreen extends StatefulWidget {
  const CameraSuccessScreen({super.key});

  @override
  _CameraSuccessScreenState createState() => _CameraSuccessScreenState();
}

class _CameraSuccessScreenState extends State<CameraSuccessScreen> {
  double scale = 0.0; // Scale for animation
  double opacity = 0.0; // Opacity for success text
  bool showBlueCheck = true; // Control checkmark switching

  @override
  void initState() {
    super.initState();

    // Step 1: Expand first (blue checkmark)
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        scale = 1.0;
      });
    });

    // Step 2: Shrink blue checkmark, switch to green
    Future.delayed(Duration(milliseconds: 1200), () {
      setState(() {
        scale = 0.0; // Shrink animation
      });
    });

    Future.delayed(Duration(milliseconds: 1500), () {
      setState(() {
        showBlueCheck = false; // Switch to green checkmark
        scale = 1.0; // Expand again
      });
    });

    // Step 3: Fade-in text
    Future.delayed(Duration(milliseconds: 2000), () {
      setState(() {
        opacity = 1.0;
      });
    });

    // Step 4: Navigate to login screen
    Future.delayed(Duration(milliseconds: 3000), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated Checkmark (Blue → Green)
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: scale),
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOutBack,
              builder: (context, value, child) {
                return Transform.scale(scale: value, child: child);
              },
              child: _buildCheckmark(showBlueCheck ? Colors.blue : Colors.green),
            ),

            // Success Text (Fade-in)
            AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(milliseconds: 600),
              child: const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Issue Successfully Posted",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckmark(Color color) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: const Icon(Icons.check, color: Colors.white, size: 50),
    );
  }
}
