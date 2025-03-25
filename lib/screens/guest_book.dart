import 'package:flutter/material.dart';
import 'home_page.dart';
import '../widgets/bottom_navbar.dart';
import 'profile_page.dart';
import 'notifications_screen.dart';
import 'register_page.dart';

class GuestBookScreen extends StatelessWidget {
  const GuestBookScreen({super.key});

  void _showLoginRegisterPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Login or Register",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text("Please login or register to book a service"),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // Close the popup
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                        );
                      },
                      child: const Text("Register"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // Close the popup
                        // Add your login navigation here
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0; // Default index for the bottom nav bar

    void onItemTapped(int index) {
      if (index == 0) {
        // Navigate to HomePage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else if (index == 2) {
        // Navigate to notification page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const NotificationScreen()),
        );
      } else if (index == 3) {
        // Navigate to ProfilePage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ProfilePage()),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Technician Details")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Pricing and Schedule
            Card(
              child: ListTile(
                title: const Text("₦500 (21% Off)"),
                subtitle: const Text(
                  "Location: 1901 Thornridge Cir\n02 Feb, 2022 - 8:30 AM",
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Booking Button
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _showLoginRegisterPopup(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text(
                      "Book",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Reviews (Moved to End)
            const Text(
              "Reviews",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage("assets/profile.png"),
              ),
              title: const Text("Donna Bins"),
              subtitle: const Text("Very prompt with delivery."),
              trailing: const Text("4.5 ⭐"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: selectedIndex, // Pass the current index
        onTap: onItemTapped, // Pass the navigation logic
      ),
    );
  }
}
