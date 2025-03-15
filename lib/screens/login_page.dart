import 'package:flutter/material.dart';
import './home_page.dart';
import './register_page.dart'; // Import Register Page

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mpinController = TextEditingController();
  bool _isMpinVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Backspace Arrow Icon
          onPressed: () {
            // Redirect to Register Page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const RegisterScreen()),
            );
          },
        ),
        title: const Text('Login'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
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
                  "Login",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Times New Roman',
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Connect with reliable service professionals at your convenience.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.black),
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

                // MPIN Input with Toggle Visibility
                TextFormField(
                  controller: mpinController,
                  obscureText: !_isMpinVisible,
                  decoration: InputDecoration(
                    labelText: "Your MPIN",
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
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // Log In Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "Log In",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Forgot MPIN
                GestureDetector(
                  onTap: () {
                    // TODO: Add Forgot MPIN logic here
                  },
                  child: const Text(
                    "Forgot MPIN?",
                    style: TextStyle(fontSize: 14, color: Colors.blue),
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
