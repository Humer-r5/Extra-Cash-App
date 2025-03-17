import 'package:flutter/material.dart';

class YourWalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                fontSize: 18, // Slightly reduced font size
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12), // Reduced padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome Back!",
              style: TextStyle(fontSize: 14, color: Colors.grey), // Reduced size
            ),
            const SizedBox(height: 12),

            // Wallet Information Cards (Earnings, Services, etc.)
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 8, // Reduced spacing
              crossAxisSpacing: 8, // Reduced spacing
              childAspectRatio: 1.5, // Adjusted for smaller boxes
              children: [
                WalletCard(title: "Total Earning", amount: "₹1259", icon: Icons.account_balance_wallet),
                WalletCard(title: "Total Service", amount: "1589", icon: Icons.receipt),
                WalletCard(title: "Upcoming Services", amount: "15", icon: Icons.event),
                WalletCard(title: "Today's Service", amount: "05", icon: Icons.today),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Widget for Wallet Cards
class WalletCard extends StatelessWidget {
  final String title;
  final String amount;
  final IconData icon;

  const WalletCard({required this.title, required this.amount, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), // Reduced border radius
      child: Padding(
        padding: const EdgeInsets.all(10), // Reduced padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              amount,
              style: const TextStyle(
                fontSize: 16, // Reduced size
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: const TextStyle(fontSize: 11, color: Colors.grey), // Smaller text
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Icon(icon, color: Colors.blueAccent, size: 20), // Smaller icon
            ),
          ],
        ),
      ),
    );
  }
}
