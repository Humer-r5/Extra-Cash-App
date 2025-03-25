import 'package:flutter/material.dart';
import '../screens/OtpVerificationScreen.dart'; // Import the OTP Verification Page

class ForgotMpinScreen extends StatefulWidget {
  const ForgotMpinScreen({super.key});

  @override
  _ForgotMpinScreenState createState() => _ForgotMpinScreenState();
}

class _ForgotMpinScreenState extends State<ForgotMpinScreen> {
  final List<String> supportedDomains = [
    '@gmail.com',
    '@yahoo.com',
    '@yahoo.co.uk',
    '@yahoo.in',
    '@outlook.com',
    '@hotmail.com',
    '@live.com',
    '@icloud.com',
    '@aol.com',
    '@protonmail.com',
    '@proton.me',
    '@office365.com',
    '@exchange.com',
    '@yourcompany.com',
    '@zoho.com',
    '@fastmail.com',
    '@fastmail.fm',
    '@yandex.com',
    '@yandex.ru',
  ];

  final _formKey = GlobalKey<FormState>(); // Form key for validation
  final _emailController = TextEditingController();

  void getOtp() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) => OtpVerificationScreen(
                email: _emailController.text,
              ), // Pass email
        ),
      );
    }
  }

  @override
  void dispose() {
    _emailController
        .dispose(); // Dispose of the controller to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Forgot MPIN'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey, // Assign form key
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Forgot Mpin',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Connect with reliable service professionals at your convenience.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 30),

                // Email TextFormField with Validation
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Your Email address",
                    prefixIcon: const Icon(Icons.email),
                    border: const OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }

                    // Regular expression to check proper email format
                    final emailRegex = RegExp(
                      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                    );

                    if (!emailRegex.hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }

                    // Extract the domain from the email
                    String domain = value.substring(value.indexOf('@'));

                    // Check if the domain is in the supported list
                    if (!supportedDomains.contains(domain)) {
                      return 'Email domain not supported';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Get OTP Button
                ElevatedButton(
                  onPressed: getOtp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: const Text(
                    'Get OTP',
                    style: TextStyle(color: Colors.white),
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
