// service_detail_page.dart
import 'package:flutter/material.dart';
import '../widgets/technician_card.dart'; // Import the TechnicianCard widget
import 'technician_details_screen.dart'; // Import the TechnicianDetailsScreen
import 'home_page.dart';
import '../widgets/BottomNavBar .dart';
import 'profile_page.dart';

class ServiceDetailPage extends StatelessWidget {
  final String title, image;

  const ServiceDetailPage({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              image,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Get Expert $title Services",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Professional $title services for all your needs. "
                    "Our skilled technicians ensure quality service and customer satisfaction.",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Active Technicians",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TechnicianCard(
                    name: "TECHY 1",
                    email: "techy1@example.com",
                    location: "1901 Thornridge Cir, New York",
                    onViewTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TechnicianDetailsScreen(),
                        ),
                      );
                    },
                  ),
                  TechnicianCard(
                    name: "TECHY 2",
                    email: "techy2@example.com",
                    location: "1420 Maple St, California",
                    onViewTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TechnicianDetailsScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0, // Set the appropriate index for the selected tab
        onTap: (index) {
          // Handle navigation for the bottom nav bar
          // Example: Use Navigator to push/pop screens as needed
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          } else if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          }
        },
      ),
    );
  }
}