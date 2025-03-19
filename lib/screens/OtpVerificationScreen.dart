import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../screens/mpin_reset_screen.dart'; // Import MPIN Reset Screen

class OtpVerificationScreen extends StatefulWidget {
  final String email; // Receive email from Forgot MPIN screen

  const OtpVerificationScreen({super.key, required this.email});

  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  bool isClicked = false; // Track button click
  String otpCode = ""; // Store OTP entered by user
  bool showInvalidInputError = false; // Track invalid input error

  void onButtonClick() {
    setState(() {
      isClicked = true; // Change button color
    });

    // Simulate API call delay
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isClicked = false; // Reset button color after delay
      });

      // Navigate to MPIN Reset Screen after OTP verification
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MPinScreen()),
      );
    });
  }

  void validateOtp(String code) {
    if (RegExp(r'^[0-9]*$').hasMatch(code)) {
      // ✅ If input is valid, store OTP and hide errors
      setState(() {
        otpCode = code;
        showInvalidInputError = false;
      });
    } else {
      // ❌ If input contains invalid characters, show error
      setState(() {
        showInvalidInputError = true;
      });
    }
  }

  void onResendOtp() {
    // 🔹 You can add OTP resend logic here later
    print("Resend OTP clicked!");
  }

  @override
  Widget build(BuildContext context) {
    bool isButtonDisabled = showInvalidInputError || otpCode.length < 4;

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

            // Display the user's email instead of "demo@gmail.com"
            Text(
              widget.email,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            // OTP Input Boxes
            OtpTextField(
              numberOfFields: 4,
              borderColor: Colors.black,
              fieldWidth: 60, // Square Box
              borderRadius: BorderRadius.circular(8), // Adjust Border Radius
              showFieldAsBox: true,
              keyboardType: TextInputType.number, // ✅ Only allow numbers
              focusedBorderColor: Colors.blue,
              onCodeChanged: (String code) {
                validateOtp(code); // Validate user input
              },
              onSubmit: (String code) {
                validateOtp(code); // Validate OTP on submission
              },
            ),

            const SizedBox(height: 10),

            // ❌ Show "Invalid input" error if non-numeric characters are entered
            if (showInvalidInputError)
              const Text(
                "Invalid input. Please enter only numbers",
                style: TextStyle(color: Colors.red, fontSize: 14),
              ),

            const SizedBox(height: 40),

            // Continue Button (Disabled if errors exist)
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isButtonDisabled
                      ? Colors.grey // 🔴 Disabled button if errors exist
                      : (isClicked ? const Color.fromARGB(255, 201, 180, 127) : Colors.black),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: isButtonDisabled ? null : onButtonClick, // Disable button if errors exist
                child: const Text(
                  "Continue",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // 🔹 Resend OTP Link (Future functionality)
            GestureDetector(
              onTap: onResendOtp, // Call function on tap
              child: const Text(
                "Resend OTP",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue, // Make it look like a link
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
