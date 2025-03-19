import 'package:flutter/material.dart';

class MPinScreen extends StatefulWidget {
  @override
  _MPinScreenState createState() => _MPinScreenState();
}

class _MPinScreenState extends State<MPinScreen> {
  bool isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            const Text(
              "Create Mpin",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Connect with reliable service professionals at your convenience.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 40),

            // Create MPIN Input
            _buildTextField("Create your Mpin"),
            const SizedBox(height: 16),

            // Confirm MPIN Input
            _buildTextField("Confirm your Mpin"),
            const SizedBox(height: 32),

            // Confirm Button
            GestureDetector(
              onTap: () {
                setState(() {
                  isButtonPressed = !isButtonPressed;
                });

                // Add logic for MPIN confirmation here
                print("MPIN Confirmed");
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isButtonPressed ? Color(0xFFC9B47F) : Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    "Confirm",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),

            // Already Registered? Login
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already Registered? ",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle login navigation
                    Navigator.pop(context); // Go back to the previous screen
                  },
                  child: const Text(
                    "Log In",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText) {
    return TextField(
      obscureText: true,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key, color: Colors.black54),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black38),
        filled: true,
        fillColor: Colors.grey[300],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}