import 'package:flutter/material.dart';
// import 'customer_info_screen.dart';
import './login-continue-page.dart'; // Importing the login screen
import 'home_page.dart';
import '../widgets/bottom_navbar.dart';
import 'profile_page.dart';
// import 'customer_info_screen.dart'; // Import the CustomerInfoScreen
// import '../widgets/BottomNavBar .dart'; // Import the BottomNavBar widget
// import 'home_page.dart'; // Import the HomePage
// import 'profile_page.dart'; // Import the ProfilePage

class TechnicianDetailsScreen extends StatelessWidget {
  const TechnicianDetailsScreen({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            const SizedBox(height: 20),
            Card(
              child: ListTile(
                title: const Text("\$50  (21% Off)"),
                subtitle: const Text(
                  "Location: 1901 Thornridge Cir\n02 Feb, 2022 - 8:30 AM",
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
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
