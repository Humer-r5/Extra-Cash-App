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
  bool _showTermsError = false;

  void handleSignUp() {
    if (_formKey.currentState!.validate()) {
      if (!agreeToTerms) {
        setState(() {
          _showTermsError = true; // Show red color
        });
        return;
      }

      debugPrint("User Registered with Email: ${emailController.text}");

      // Navigate to Home Page after successful registration
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(), // Navigate to HomePage
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
                  decoration: InputDecoration(
                    labelText: "Your Email address",
                    prefixIcon: const Icon(Icons.email),
                    border: const OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[^@]+@gmail\.com$').hasMatch(value)) {
                      return 'Please enter valid Email';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    // Prevent typing after "@gmail.com"
                    if (value.contains('@gmail.com') &&
                        value.substring(value.indexOf('@gmail.com')) !=
                            '@gmail.com') {
                      emailController.text = value.substring(
                        0,
                        value.indexOf('@gmail.com') + 10,
                      );
                      emailController.selection = TextSelection.fromPosition(
                        TextPosition(offset: emailController.text.length),
                      );
                    }
                  },
                ),
                const SizedBox(height: 10),
                // Create MPIN with Toggle Visibility
                TextFormField(
                  controller: mpinController,
                  obscureText: !_isMpinVisible,
                  keyboardType: TextInputType.number,
                  maxLength: 4, // Restrict to 4 digits
                  decoration: InputDecoration(
                    labelText: "Create your MPIN",
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your MPIN';
                    }
                    if (value.length != 4) {
                      return 'MPIN must be 4 digits';
                    } else if (int.tryParse(value) == null) {
                      // Ensures it's a valid integer
                      return 'MPIN must be numeric';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),

                // Confirm MPIN
                TextFormField(
                  controller: confirmMpinController,
                  obscureText: !_isConfirmMpinVisible,
                  keyboardType: TextInputType.number,
                  maxLength: 4, // Restrict to 4 digits
                  decoration: InputDecoration(
                    labelText: "Confirm your MPIN",
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please confirm your MPIN";
                    }
                    if (value != mpinController.text) {
                      return "MPIN does not match";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),

                // Terms & Conditions Checkbox
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: agreeToTerms,
                      onChanged: (value) {
                        setState(() {
                          agreeToTerms = value!;
                          _showTermsError = !agreeToTerms; // Update error state
                        });
                      },
                    ),
                    // const Text("I agree with "),
                    Text(
                      "I agree with Terms & Conditions",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color:
                            _showTermsError
                                ? Colors.red
                                : Colors.blue, // Dynamic color
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Sign Up Button
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
                  onPressed: () {}, // TODO: Implement Google Sign-In
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
