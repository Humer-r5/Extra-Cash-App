import 'package:flutter/material.dart';
import 'dart:ui';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
                    color: const Color(
                      0xFFD4A373,
                    ), // Exact color from reference image
                    borderRadius: BorderRadius.vertical(
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
                      const Text(
                        "TECHXPLORERS",
                        style: TextStyle(
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
                _buildMenuItem(Icons.dashboard, "Dashboard"),
                _buildMenuItem(Icons.edit, "Edit Your Profile"),
                _buildMenuItem(Icons.build, "Become A Technician"),
                _buildMenuItem(Icons.logout, "Logout", iconColor: Colors.red),

                const SizedBox(height: 15), // More spacing at bottom
                // Settings at the bottom
                ListTile(
                  leading: const Icon(Icons.settings, color: Colors.black),
                  title: const Text(
                    "Settings",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {},
                ),
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
    String title, {
    Color iconColor = Colors.black,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8), // Increased spacing
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        onTap: () {},
      ),
    );
  }
}
