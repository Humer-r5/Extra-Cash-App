import 'package:flutter/material.dart';
import 'book_success_screen.dart'; // Import the success screen
import 'home_page.dart';
import '../widgets/BottomNavBar .dart';
import 'profile_page.dart';
import 'notifications_screen.dart';

class TechnicianDetailsScreen extends StatelessWidget {
  const TechnicianDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0; // Default index for the bottom nav bar

    void onItemTapped(int index) {
      if (index == 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else if (index == 2) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const NotificationScreen()),
        );
      } else if (index == 3) {
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BookSuccessScreen(),
                        ),
                      );
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

            // Reviews
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
        currentIndex: selectedIndex, 
        onTap: onItemTapped, 
      ),
    );
  }
}
