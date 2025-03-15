import 'package:flutter/material.dart';
import './home_page.dart';
// import './register_page.dart'

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mpinController = TextEditingController();
  bool _isMpinVisible = false;

  bool _validateForm() {
    if (emailController.text.isEmpty ||
        !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid email')),
      );
      return false;
    }
    if (mpinController.text.length != 4) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('MPIN must be 4 digits')));
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
                decoration: const InputDecoration(
                  labelText: "Your Email address",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
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
                      _isMpinVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isMpinVisible = !_isMpinVisible;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Log In Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {
                  if (_validateForm()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
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
    );
  }
}
