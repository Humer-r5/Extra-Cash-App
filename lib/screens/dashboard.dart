import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'dart:math';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  // Randomized placeholder values for now
  final int numberOfOrders = Random().nextInt(300); // Random orders count
  final int rating = Random().nextInt(5) + 1; // Rating between 1 and 5
  final int experienceYears = Random().nextInt(10) + 1; // 1-10 years
  final String totalEarnings =
      "\$${(Random().nextDouble() * 2).toStringAsFixed(1)}M"; // Up to $2M

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800], // Dark background
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Back Button
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),

          // Profile Picture
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(
              'assets/profile_pic.jpg',
            ), // Use actual user image later
          ),

          const SizedBox(height: 10),

          // User Name Placeholder
          const Text(
            "User Name",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 20),

          // Info Cards Grid
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 1.5,
              children: [
                _buildInfoCard("No Of Orders", numberOfOrders.toString()),
                _buildInfoCard("Overall Rating", "⭐" * rating),
                _buildInfoCard("Experience", "$experienceYears yr +"),
                _buildInfoCard("Total Earnings", totalEarnings),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget for Info Cards
  Widget _buildInfoCard(String title, String value) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(value, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
