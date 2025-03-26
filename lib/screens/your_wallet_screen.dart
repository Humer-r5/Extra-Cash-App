import 'package:flutter/material.dart';
import 'home_page.dart';
import '../widgets/bottom_navbar.dart';
import 'profile_page.dart';
import 'notifications_screen.dart';
import 'camera_page.dart';

class YourWalletScreen extends StatelessWidget {
  const YourWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(width: 8),
            const Text(
              "Hello User",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome Back!",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),

            // Expanded to prevent overflow issues
            Expanded(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: screenWidth < 600 ? 2 : 3, // Adaptive layout
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: screenWidth < 600 ? 1.8 : 2.2, // Adjusted for responsiveness
                children: [
                  const WalletCard(
                    title: "Total Earning",
                    amount: "₹1259",
                    icon: Icons.account_balance_wallet,
                  ),
                  const WalletCard(
                    title: "Total Service",
                    amount: "1589",
                    icon: Icons.receipt,
                  ),
                  const WalletCard(
                    title: "Upcoming Services",
                    amount: "15",
                    icon: Icons.event,
                  ),
                  const WalletCard(
                    title: "Today's Service",
                    amount: "05",
                    icon: Icons.today,
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
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => CameraApp()),
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
        },
      ),
    );
  }
}

// Custom Widget for Wallet Cards
class WalletCard extends StatelessWidget {
  final String title;
  final String amount;
  final IconData icon;

  const WalletCard({
    super.key,
    required this.title,
    required this.amount,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              amount,
              style: TextStyle(
                fontSize: screenWidth < 600 ? 18 : 20, // Responsive font size
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 4),
            Flexible(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: screenWidth < 600 ? 12 : 14, // Adjusted for readability
                  color: Colors.grey,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Icon(icon, color: Colors.blueAccent, size: 22),
            ),
          ],
        ),
      ),
    );
  }
}
