// import 'package:flutter/material.dart';
// // import "./login_page.dart";

// class ForgotMpinScreen extends StatefulWidget {
//   @override
//   _ForgotMpinScreenState createState() => _ForgotMpinScreenState();
// }

// class _ForgotMpinScreenState extends State<ForgotMpinScreen> {
//   final _emailController = TextEditingController();

//   void getOtp() {
//     // Logic to get OTP
//     print("OTP sent to ${_emailController.text}");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const Text(
//                 'Forgot Mpin',
//                 style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               const Text(
//                 'Connect with reliable service professionals at your convenience.',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 14, color: Colors.grey),
//               ),
//               const SizedBox(height: 30),

//               // Email TextField
//               TextField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   labelText: "Your Email address",
//                   prefixIcon: Icon(Icons.email),
//                   border: OutlineInputBorder(),
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                 ),
//                 keyboardType: TextInputType.emailAddress,
//               ),
//               const SizedBox(height: 20),

//               // Get OTP Button
//               ElevatedButton(
//                 onPressed: getOtp,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.black,
//                   minimumSize: Size(double.infinity, 50),
//                 ),
//                 child: const Text(
//                   'Get OTP',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// // import "./login_page.dart";

// class ForgotMpinScreen extends StatefulWidget {
//   @override
//   _ForgotMpinScreenState createState() => _ForgotMpinScreenState();
// }

// class _ForgotMpinScreenState extends State<ForgotMpinScreen> {
//   final _emailController = TextEditingController();

//   void getOtp() {
//     // Logic to get OTP
//     print("OTP sent to ${_emailController.text}");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             // Navigate back to the Login screen
//             Navigator.pop(context);
//           },
//         ),
//         title: const Text('Forgot MPIN'),
//         backgroundColor: Colors.black,
//         foregroundColor: Colors.white,
//       ),
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const Text(
//                 'Forgot Mpin',
//                 style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               const Text(
//                 'Connect with reliable service professionals at your convenience.',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 14, color: Colors.grey),
//               ),
//               const SizedBox(height: 30),

//               // Email TextField
//               TextFormField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   labelText: "Your Email address",
//                   prefixIcon: Icon(Icons.email),
//                   border: OutlineInputBorder(),
//                   filled: true,
//                   fillColor: Colors.white,
//                 ),
//                 keyboardType: TextInputType.emailAddress,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   if (!RegExp(r'^[^@]+@gmail\.com$').hasMatch(value)) {
//                     return 'Please enter a valid Gmail address';
//                   }
//                   return null;
//                 },
//                 onChanged: (value) {
//                   if (value.contains('@gmail.com')) {
//                     final beforeAt = value.split('@gmail.com')[0];
//                     _emailController.text = '$beforeAt@gmail.com';
//                     _emailController.selection = TextSelection.fromPosition(
//                       TextPosition(offset: _emailController.text.length),
//                     );
//                   }
//                 },
//               ),
//               const SizedBox(height: 20),

//               // Get OTP Button
//               ElevatedButton(
//                 onPressed: getOtp,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.black,
//                   minimumSize: Size(double.infinity, 50),
//                 ),
//                 child: const Text(
//                   'Get OTP',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
// import 'confirm_otp_screen.dart'; // Import the Confirm OTP page

class ForgotMpinScreen extends StatefulWidget {
  @override
  _ForgotMpinScreenState createState() => _ForgotMpinScreenState();
}

class _ForgotMpinScreenState extends State<ForgotMpinScreen> {
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  final _emailController = TextEditingController();

  void getOtp() {
    if (_formKey.currentState!.validate()) {
      // If valid, navigate to Confirm OTP page
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => ConfirmOtpScreen(email: _emailController.text)),
      // );
    }
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
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[^@]+@gmail\.com$').hasMatch(value)) {
                      return 'Please enter a valid Gmail address';
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
