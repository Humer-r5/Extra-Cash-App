import 'package:flutter/material.dart';
import 'login_page.dart'; // Import Login Screen
import 'home_page.dart'; // Import Home Page (Make sure the file exists)

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mpinController = TextEditingController();
  final TextEditingController confirmMpinController = TextEditingController();
  bool agreeToTerms = false;
  bool _isMpinVisible = false;
  bool _isConfirmMpinVisible = false;

  void handleSignUp() {
    if (_formKey.currentState!.validate() && agreeToTerms) {
      debugPrint("User Registered with Email: ${emailController.text}");

      // Navigate to Home Page after successful registration
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(), // Navigate to HomePage
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Create Account",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Connect with reliable service professionals at your convenience.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 20),

                // Email Input
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Your Email address",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    }
                    // Email validation using regex
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return "Enter a valid email address";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),

                // Create MPIN with Toggle Visibility
                TextFormField(
                  controller: mpinController,
                  obscureText: !_isMpinVisible,
                  decoration: InputDecoration(
                    labelText: "Create your Mpin",
                    prefixIcon: const Icon(Icons.vpn_key),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isMpinVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isMpinVisible = !_isMpinVisible;
                        });
                      },
                    ),
                  ),
                  validator:
                      (value) =>
                          value!.length == 4 ? null : "MPIN must be 4 digits",
                ),
                const SizedBox(height: 10),

                // Confirm MPIN with Toggle Visibility
                TextFormField(
                  controller: confirmMpinController,
                  obscureText: !_isConfirmMpinVisible,
                  decoration: InputDecoration(
                    labelText: "Confirm your Mpin",
                    prefixIcon: const Icon(Icons.vpn_key),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isConfirmMpinVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isConfirmMpinVisible = !_isConfirmMpinVisible;
                        });
                      },
                    ),
                  ),
                  validator:
                      (value) =>
                          value != mpinController.text
                              ? "MPIN does not match"
                              : null,
                ),
                const SizedBox(height: 10),

                // Terms & Conditions
                Row(
                  children: [
                    Checkbox(
                      value: agreeToTerms,
                      onChanged: (value) {
                        setState(() {
                          agreeToTerms = value!;
                        });
                      },
                    ),
                    const Text("I agree with Terms & Conditions"),
                  ],
                ),
                const SizedBox(height: 10),

                // Sign Up Button (Navigate to HomePage)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: handleSignUp,
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),

                // OR Divider
                const Text(
                  "— OR —",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 10),

                // Continue with Google
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Continue With Google",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),

                // Already Registered? Log In
                GestureDetector(
                  onTap: () {
                    // Navigate to Login Screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Already Registered? Log In",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
