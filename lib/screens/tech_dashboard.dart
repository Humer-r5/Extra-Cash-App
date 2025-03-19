import 'package:flutter/material.dart';
// import 'profile_page.dart';
import 'dart:math';

class TechDashboardPage extends StatelessWidget {
  TechDashboardPage({super.key});

  // Randomized placeholder values for now
  final int numberOfOrders = Random().nextInt(300); // Random orders count
  final int rating = Random().nextInt(5) + 1; // Rating between 1 and 5
  final int experienceYears = Random().nextInt(10) + 1; // 1-10 years
  final String totalEarnings =
      "\$${(Random().nextDouble() * 2).toStringAsFixed(1)}M"; // Up to $2M

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Changed background to white
      body: Padding(
        padding: const EdgeInsets.only(top: 40), // Moves dashboard up
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Back Button
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),

            const SizedBox(height: 10),

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
                color: Colors.black, // Changed username color to black
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
      ),
    );
  }

  // Widget for Info Cards
  Widget _buildInfoCard(String title, String value) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 1), // Added border
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Ensuring text is visible
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent, // Highlighting values
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
