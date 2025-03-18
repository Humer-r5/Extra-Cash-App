import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../screens/mpin_reset_screen.dart'; // Import the MPinScreen

class OtpVerificationScreen extends StatefulWidget {
  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  bool isClicked = false; // Track button click

  void onButtonClick() {
    setState(() {
      isClicked = true; // Change button color
    });

    // Simulate API call delay
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        isClicked = false; // Reset button color after delay
      });

      // Navigate to MPinScreen after OTP verification
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MPinScreen()),
      );
    });

    // Add your OTP verification logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, // Remove back button
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Enter verification code",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Sent 4 Digit Verification Code To Your Email",
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            const Text(
              "demo.gmail.com",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            // OTP Input Boxes
            OtpTextField(
              numberOfFields: 4,
              borderColor: Colors.black,
              fieldWidth: 60, // Square Box
              borderRadius: BorderRadius.circular(8), // Adjust Border Radius
              showFieldAsBox: true,
              focusedBorderColor: Colors.blue,
              onSubmit: (String code) {
                print("Entered OTP: $code");
              },
            ),

            const SizedBox(height: 40),

            // Continue Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      isClicked ? const Color.fromARGB(255, 201, 180, 127) : Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: onButtonClick,
                child: const Text(
                  "Continue",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}