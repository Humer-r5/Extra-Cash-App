import 'package:flutter/material.dart';
import 'dart:ui';
import 'edit_profile.dart'; // Import EditProfilePage
import 'become_technician.dart';
import 'register_page.dart';
import 'home_page.dart';
import 'user_dashboard.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userName = "Your Profile"; // Default name

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Blurred Background Effect
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.3), // Semi-transparent overlay
            ),
          ),
        ),

        // Profile Overlay
        Positioned(
          top: 20, // Moved further up
          left: 10,
          right: 60,
          child: Material(
            // ✅ Added Material widget here
            type: MaterialType.transparency, // Keeps the background transparent
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Profile Header
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                        255,
                        242,
                        165,
                        49,
                      ), // Exact color from reference image
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage("assets/profile_pic.jpg"),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          userName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(), // Pushes back arrow to the rightmost corner
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            ); // Navigates back to the home page
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ), // Spacing between header and menu items
                  // Profile Menu Items
                  _buildMenuItem(
                    Icons.dashboard,
                    "Dashboard",
                    context,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DashboardPage(),
                        ),
                      );
                    },
                  ),

                  _buildMenuItem(
                    Icons.edit,
                    "Edit Your Profile",
                    context,
                    onTap: () async {
                      final updatedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  EditProfilePage(currentName: userName),
                        ),
                      );

                      if (updatedName != null && updatedName.isNotEmpty) {
                        setState(() {
                          userName = updatedName; // Update the profile name
                        });
                      }
                    },
                  ),
                  _buildMenuItem(
                    Icons.build,
                    "Become A Technician",
                    context,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  const InputDesignScreen(), // Ensure this is imported correctly
                        ),
                      );
                    },
                  ), // ✅ Fixed issue here

                  _buildMenuItem(
                    Icons.logout,
                    "Logout",
                    context,
                    iconColor: Colors.red,
                    onTap: () {
                      _showLogoutConfirmationDialog(context);
                    },
                  ), // ✅ No errors now

                  const SizedBox(height: 15), // More spacing at bottom
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Function to show logout confirmation dialog
  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white, // Pure white background
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Rounded corners
          ),
          title: const Text(
            "Logout",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black, // High contrast text
            ),
          ),
          content: const Text(
            "Are you sure, you want to log out?",
            style: TextStyle(fontSize: 16, color: Colors.black87),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text(
                "Cancel",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
              child: const Text(
                "Yes",
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  // Menu Item Builder for Consistency
  Widget _buildMenuItem(
    IconData icon,
    String title,
    BuildContext context, {
    Color iconColor = Colors.black,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8), // Increased spacing
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        onTap: onTap ?? () {}, // This ensures no error when onTap is null
      ),
    );
  }
}
