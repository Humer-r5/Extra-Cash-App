import 'package:flutter/material.dart';
import 'technician_info_screen.dart';
import 'dart:async';

class BookSuccessScreen extends StatefulWidget {
  final String name, email, location;

  const BookSuccessScreen({
    super.key,
    required this.name,
    required this.email,
    required this.location,
  });

  @override
  _BookSuccessScreenState createState() => _BookSuccessScreenState();
}

class _BookSuccessScreenState extends State<BookSuccessScreen> {
  double scale = 0.0;
  double opacity = 0.0;
  bool showBlueCheck = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        scale = 1.0;
      });
    });

    Future.delayed(const Duration(milliseconds: 1200), () {
      setState(() {
        scale = 0.0;
      });
    });

    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        showBlueCheck = false;
        scale = 1.0;
      });
    });

    Future.delayed(const Duration(milliseconds: 2000), () {
      setState(() {
        opacity = 1.0;
      });
    });

    // ✅ Navigate to Technician Info screen with dynamic data
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => TechnicianInfoScreen(
            name: widget.name,
            email: widget.email,
            location: widget.location,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: scale),
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOutBack,
              builder: (context, value, child) {
                return Transform.scale(scale: value, child: child);
              },
              child: _buildCheckmark(showBlueCheck ? Colors.blue : Colors.green),
            ),
            const SizedBox(height: 20),
            AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(milliseconds: 600),
              child: const Text(
                "Booking Confirmed!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
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
