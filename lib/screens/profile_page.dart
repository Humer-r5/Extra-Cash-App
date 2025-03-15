import 'package:flutter/material.dart';
import 'dart:ui';
import 'edit_profile.dart'; // Import EditProfilePage

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
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context); // Just closes the overlay
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 10,
                ), // Spacing between header and menu items
                // Profile Menu Items
                _buildMenuItem(Icons.dashboard, "Dashboard", context),
                _buildMenuItem(
                  Icons.edit,
                  "Edit Your Profile",
                  context,
                  onTap: () async {
                    final updatedName = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => EditProfilePage(currentName: userName),
                      ),
                    );

                    if (updatedName != null && updatedName.isNotEmpty) {
                      setState(() {
                        userName = updatedName; // Update the profile name
                      });
                    }
                  },
                ),
                _buildMenuItem(Icons.build, "Become A Technician", context),
                _buildMenuItem(
                  Icons.logout,
                  "Logout",
                  context,
                  iconColor: Colors.red,
                ),

                const SizedBox(height: 15), // More spacing at bottom
                // Settings at the bottom
                // ListTile(
                //   leading: const Icon(Icons.settings, color: Colors.black),
                //   title: const Text(
                //     "Settings",
                //     style: TextStyle(fontWeight: FontWeight.bold),
                //   ),
                //   onTap: () {},
                // ),
              ],
            ),
          ),
        ),
      ],
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
        onTap: onTap ?? () {},
      ),
    );
  }
}
