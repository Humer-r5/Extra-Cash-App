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

// import 'package:flutter/material.dart';
// import 'login_page.dart'; // Import Login Screen
// import 'home_page.dart'; // Import Home Page (Make sure the file exists)

// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({super.key});

//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController =
//       TextEditingController();
//   bool agreeToTerms = false;
//   bool _isPasswordVisible = false;
//   bool _isConfirmPasswordVisible = false;

//   void handleSignUp() {
//     if (_formKey.currentState!.validate()) {
//       if (!agreeToTerms) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('You must agree to the Terms and Conditions'),
//             backgroundColor: Colors.red,
//           ),
//         );
//         return;
//       }
//       debugPrint("User Registered with Email: ${emailController.text}");

//       // Navigate to Home Page after successful registration
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => HomePage()),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Form(
//             key: _formKey,
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     "Create Account",
//                     style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 10),
//                   const Text(
//                     "Connect with reliable service professionals at your convenience.",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 14, color: Colors.grey),
//                   ),
//                   const SizedBox(height: 20),

//                   // Email Input
//                   TextFormField(
//                     controller: emailController,
//                     decoration: InputDecoration(
//                       labelText: "Your Email address",
//                       prefixIcon: const Icon(Icons.email),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "Please enter your email";
//                       }
//                       // Email validation using regex
//                       if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                         return "Enter a valid email address";
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 10),

//                   // Password Input
//                   TextFormField(
//                     controller: passwordController,
//                     obscureText: !_isPasswordVisible,
//                     decoration: InputDecoration(
//                       labelText: "Create your Password",
//                       prefixIcon: const Icon(Icons.lock),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           _isPasswordVisible
//                               ? Icons.visibility
//                               : Icons.visibility_off,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             _isPasswordVisible = !_isPasswordVisible;
//                           });
//                         },
//                       ),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "Please enter your password";
//                       }
//                       if (value.length < 8) {
//                         return "Password must be at least 8 characters";
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 10),

//                   // Confirm Password Input
//                   TextFormField(
//                     controller: confirmPasswordController,
//                     obscureText: !_isConfirmPasswordVisible,
//                     decoration: InputDecoration(
//                       labelText: "Confirm your Password",
//                       prefixIcon: const Icon(Icons.lock),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           _isConfirmPasswordVisible
//                               ? Icons.visibility
//                               : Icons.visibility_off,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             _isConfirmPasswordVisible =
//                                 !_isConfirmPasswordVisible;
//                           });
//                         },
//                       ),
//                     ),
//                     validator: (value) {
//                       if (value != passwordController.text) {
//                         return "Passwords do not match";
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 10),

//                   // Terms & Conditions
//                   Row(
//                     children: [
//                       Checkbox(
//                         value: agreeToTerms,
//                         onChanged: (value) {
//                           setState(() {
//                             agreeToTerms = value!;
//                           });
//                         },
//                       ),
//                       const Text("I agree with Terms & Conditions"),
//                     ],
//                   ),
//                   const SizedBox(height: 10),

//                   // Sign Up Button
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.black,
//                       minimumSize: const Size(double.infinity, 50),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     onPressed: handleSignUp,
//                     child: const Text(
//                       "Sign Up",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                   const SizedBox(height: 10),

//                   // OR Divider
//                   const Text(
//                     "— OR —",
//                     style: TextStyle(fontSize: 16, color: Colors.grey),
//                   ),
//                   const SizedBox(height: 10),

//                   // Continue with Google
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.red,
//                       minimumSize: const Size(double.infinity, 50),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     onPressed: () {},
//                     child: const Text(
//                       "Continue With Google",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                   const SizedBox(height: 20),

//                   // Already Registered? Log In
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const LoginScreen(),
//                         ),
//                       );
//                     },
//                     child: const Text(
//                       "Already Registered? Log In",
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.blue,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'home_page.dart';

// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({super.key});

//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController =
//       TextEditingController();
//   bool agreeToTerms = false;
//   bool _isPasswordVisible = false;
//   bool _isConfirmPasswordVisible = false;

//   // Save data to local storage
//   Future<void> saveUserData() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('email', emailController.text);
//     await prefs.setString('password', passwordController.text);
//   }

//   void handleSignUp() async {
//     if (_formKey.currentState!.validate()) {
//       if (!agreeToTerms) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('You must agree to the Terms and Conditions'),
//             backgroundColor: Colors.red,
//           ),
//         );
//         return;
//       }

//       await saveUserData(); // Save to local storage

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Registration Successful'),
//           backgroundColor: Colors.green,
//         ),
//       );

//       // Navigate to Home Page after successful registration
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => HomePage()),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Form(
//             key: _formKey,
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   const Text(
//                     "Create Account",
//                     style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 10),

//                   // Email Input
//                   TextFormField(
//                     controller: emailController,
//                     decoration: const InputDecoration(
//                       labelText: "Your Email address",
//                       prefixIcon: Icon(Icons.email),
//                       border: OutlineInputBorder(),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "Please enter your email";
//                       }
//                       if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                         return "Enter a valid email address";
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 10),

//                   // Password Input
//                   TextFormField(
//                     controller: passwordController,
//                     obscureText: !_isPasswordVisible,
//                     decoration: InputDecoration(
//                       labelText: "Create your Password",
//                       prefixIcon: const Icon(Icons.lock),
//                       border: const OutlineInputBorder(),
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           _isPasswordVisible
//                               ? Icons.visibility
//                               : Icons.visibility_off,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             _isPasswordVisible = !_isPasswordVisible;
//                           });
//                         },
//                       ),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "Please enter your password";
//                       }
//                       if (value.length < 8) {
//                         return "Password must be at least 8 characters";
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 10),

//                   // Confirm Password Input
//                   TextFormField(
//                     controller: confirmPasswordController,
//                     obscureText: !_isConfirmPasswordVisible,
//                     decoration: InputDecoration(
//                       labelText: "Confirm your Password",
//                       prefixIcon: const Icon(Icons.lock),
//                       border: const OutlineInputBorder(),
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           _isConfirmPasswordVisible
//                               ? Icons.visibility
//                               : Icons.visibility_off,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             _isConfirmPasswordVisible =
//                                 !_isConfirmPasswordVisible;
//                           });
//                         },
//                       ),
//                     ),
//                     validator: (value) {
//                       if (value != passwordController.text) {
//                         return "Passwords do not match";
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 10),

//                   // Terms & Conditions
//                   Row(
//                     children: [
//                       Checkbox(
//                         value: agreeToTerms,
//                         onChanged: (value) {
//                           setState(() {
//                             agreeToTerms = value!;
//                           });
//                         },
//                       ),
//                       const Text("I agree with Terms & Conditions"),
//                     ],
//                   ),
//                   const SizedBox(height: 10),

//                   // Sign Up Button
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.black,
//                       minimumSize: const Size(double.infinity, 50),
//                     ),
//                     onPressed: handleSignUp,
//                     child: const Text(
//                       "Sign Up",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'home_page.dart';
// // import './login_page.dart';

// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({super.key});

//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController mpinController = TextEditingController();
//   final TextEditingController confirmMpinController = TextEditingController();
//   bool agreeToTerms = false;
//   bool _isMpinVisible = false;
//   bool _isConfirmMpinVisible = false;

//   // Save registration data to local storage
//   Future<void> saveUserData() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('email', emailController.text);
//     await prefs.setString('mpin', mpinController.text);
//     debugPrint("User Registered: Email - ${emailController.text}");
//   }

//   void handleSignUp() async {
//     if (_formKey.currentState!.validate()) {
//       if (!agreeToTerms) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('You must agree to the Terms and Conditions'),
//             backgroundColor: Colors.red,
//           ),
//         );
//         return;
//       }

//       // Save data to local storage
//       await saveUserData();

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Registration Successful'),
//           backgroundColor: Colors.green,
//         ),
//       );

//       // Navigate to Home Page after successful registration
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const HomePage()),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Form(
//             key: _formKey,
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     "Create Account",
//                     style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 10),
//                   const Text(
//                     "Connect with reliable service professionals at your convenience.",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 14, color: Colors.grey),
//                   ),
//                   const SizedBox(height: 20),

//                   // Email Input
//                   TextFormField(
//                     controller: emailController,
//                     decoration: const InputDecoration(
//                       labelText: "Your Email address",
//                       prefixIcon: Icon(Icons.email),
//                       border: OutlineInputBorder(),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "Enter a valid email";
//                       }
//                       if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                         return "Enter a valid email address";
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 10),

//                   // Create MPIN
//                   TextFormField(
//                     controller: mpinController,
//                     obscureText: !_isMpinVisible,
//                     decoration: InputDecoration(
//                       labelText: "Create your Mpin",
//                       prefixIcon: const Icon(Icons.vpn_key),
//                       border: const OutlineInputBorder(),
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           _isMpinVisible
//                               ? Icons.visibility
//                               : Icons.visibility_off,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             _isMpinVisible = !_isMpinVisible;
//                           });
//                         },
//                       ),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.length < 4) {
//                         return "MPIN must be 4 digits";
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 10),

//                   // Confirm MPIN
//                   TextFormField(
//                     controller: confirmMpinController,
//                     obscureText: !_isConfirmMpinVisible,
//                     decoration: InputDecoration(
//                       labelText: "Confirm your Mpin",
//                       prefixIcon: const Icon(Icons.vpn_key),
//                       border: const OutlineInputBorder(),
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           _isConfirmMpinVisible
//                               ? Icons.visibility
//                               : Icons.visibility_off,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             _isConfirmMpinVisible = !_isConfirmMpinVisible;
//                           });
//                         },
//                       ),
//                     ),
//                     validator: (value) {
//                       if (value != mpinController.text) {
//                         return "MPIN does not match";
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 10),

//                   // Terms and Conditions
//                   Row(
//                     children: [
//                       Checkbox(
//                         value: agreeToTerms,
//                         onChanged: (value) {
//                           setState(() {
//                             agreeToTerms = value!;
//                           });
//                         },
//                       ),
//                       const Text("I agree with Terms & Conditions"),
//                     ],
//                   ),
//                   const SizedBox(height: 10),

//                   // Sign Up Button
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.black,
//                       minimumSize: const Size(double.infinity, 50),
//                     ),
//                     onPressed: handleSignUp,
//                     child: const Text(
//                       "Sign Up",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'login_page.dart';

// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({super.key});

//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController mpinController = TextEditingController();
//   final TextEditingController confirmMpinController = TextEditingController();
//   bool agreeToTerms = false;
//   bool _isMpinVisible = false;
//   bool _isConfirmMpinVisible = false;

//   Future<void> _saveUserData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? existingEmail = prefs.getString('email');

//     if (existingEmail == emailController.text) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('User already exists. Please log in.'),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return;
//     }

//     await prefs.setString('email', emailController.text);
//     await prefs.setString('mpin', mpinController.text);

//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text('Registration successful!'),
//         backgroundColor: Colors.green,
//       ),
//     );

//     // Navigate to login page after successful registration
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => const LoginScreen()),
//     );
//   }

//   void handleSignUp() {
//     if (_formKey.currentState!.validate() && agreeToTerms) {
//       _saveUserData();
//     } else if (!agreeToTerms) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('You must agree to the Terms and Conditions'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text(
//                   "Create Account",
//                   style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 10),
//                 const Text(
//                   "Connect with reliable service professionals at your convenience.",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 14, color: Colors.grey),
//                 ),
//                 const SizedBox(height: 20),

//                 // Email Input
//                 TextFormField(
//                   controller: emailController,
//                   decoration: const InputDecoration(
//                     labelText: "Your Email address",
//                     prefixIcon: Icon(Icons.email),
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return "Please enter your email";
//                     }
//                     if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                       return "Enter a valid email address";
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 10),

//                 // Create MPIN with Toggle Visibility
//                 TextFormField(
//                   controller: mpinController,
//                   obscureText: !_isMpinVisible,
//                   decoration: InputDecoration(
//                     labelText: "Create your Mpin",
//                     prefixIcon: const Icon(Icons.vpn_key),
//                     border: const OutlineInputBorder(),
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         _isMpinVisible
//                             ? Icons.visibility
//                             : Icons.visibility_off,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           _isMpinVisible = !_isMpinVisible;
//                         });
//                       },
//                     ),
//                   ),
//                   validator:
//                       (value) =>
//                           value!.length < 4 ? "MPIN must be 4 digits" : null,
//                 ),
//                 const SizedBox(height: 10),

//                 // Confirm MPIN with Toggle Visibility
//                 TextFormField(
//                   controller: confirmMpinController,
//                   obscureText: !_isConfirmMpinVisible,
//                   decoration: InputDecoration(
//                     labelText: "Confirm your Mpin",
//                     prefixIcon: const Icon(Icons.vpn_key),
//                     border: const OutlineInputBorder(),
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         _isConfirmMpinVisible
//                             ? Icons.visibility
//                             : Icons.visibility_off,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           _isConfirmMpinVisible = !_isConfirmMpinVisible;
//                         });
//                       },
//                     ),
//                   ),
//                   validator:
//                       (value) =>
//                           value != mpinController.text
//                               ? "MPIN does not match"
//                               : null,
//                 ),
//                 const SizedBox(height: 10),

//                 // Terms & Conditions Checkbox
//                 Row(
//                   children: [
//                     Checkbox(
//                       value: agreeToTerms,
//                       onChanged: (value) {
//                         setState(() {
//                           agreeToTerms = value!;
//                         });
//                       },
//                     ),
//                     const Text("I agree with Terms & Conditions"),
//                   ],
//                 ),
//                 const SizedBox(height: 10),

//                 // Sign Up Button
//                 ElevatedButton(
//                   onPressed: handleSignUp,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.black,
//                     minimumSize: const Size(double.infinity, 50),
//                   ),
//                   child: const Text(
//                     "Sign Up",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
