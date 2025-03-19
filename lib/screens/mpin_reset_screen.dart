import 'package:flutter/material.dart';
import 'success_screen.dart';
import 'login_page.dart';

class MPinScreen extends StatefulWidget {
  const MPinScreen({super.key});

  @override
  _MPinScreenState createState() => _MPinScreenState();
}

class _MPinScreenState extends State<MPinScreen> {
  final TextEditingController mpinController = TextEditingController();
  final TextEditingController confirmMpinController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Form key for validation

  bool _isMpinVisible = false;
  bool _isConfirmMpinVisible = false;
  bool isButtonEnabled = false;

  void _validateForm() {
    setState(() {
      isButtonEnabled = _formKey.currentState!.validate();
    });
  }

  void _onConfirm() {
    if (_formKey.currentState!.validate()) {
      // If form is valid, navigate to success screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SuccessScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _formKey, // Attach form key
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              const Text(
                "Create MPIN",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Connect with reliable service professionals at your convenience.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 40),

              // Create MPIN Input
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
                      _isMpinVisible ? Icons.visibility : Icons.visibility_off,
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
                  if (int.tryParse(value) == null) {
                    return 'MPIN must be numeric';
                  }
                  return null;
                },
                onChanged: (value) => _validateForm(),
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
                  if (value.length != 4) {
                    return "MPIN must be 4 digits";
                  }
                  if (value != mpinController.text) {
                    return "MPIN does not match";
                  }
                  return null;
                },
                onChanged: (value) => _validateForm(),
              ),
              const SizedBox(height: 32),

              // Confirm Button
              GestureDetector(
                onTap: isButtonEnabled ? _onConfirm : null,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: isButtonEnabled ? Colors.black : Colors.grey,
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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
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
      ),
    );
  }
}
