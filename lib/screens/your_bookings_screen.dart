import 'package:flutter/material.dart';
import 'home_page.dart';
import '../widgets/bottom_navbar.dart';
import 'profile_page.dart';
import 'notifications_screen.dart';
import 'payment_history_screen.dart';

class YourBookingsScreen extends StatelessWidget {
  const YourBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> bookings = [
      {
        "paymentMethod": "Cash",
        "description": "Home AC repair service, including gas refill and general servicing.",
        "amount": "₦15,000",
        "date": "12 Mar, 2025",
      },
      {
        "paymentMethod": "Card",
        "description": "Plumbing service - Bathroom leakage fixing and pipe replacement.",
        "amount": "₦8,500",
        "date": "08 Mar, 2025",
      },
      {
        "paymentMethod": "UPI",
        "description": "Electrical wiring installation and troubleshooting service.",
        "amount": "₦12,300",
        "date": "04 Mar, 2025",
      },
      {
        "paymentMethod": "Bank Transfer",
        "description": "CCTV installation and maintenance service.",
        "amount": "₦18,200",
        "date": "01 Mar, 2025",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Bookings",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          final booking = bookings[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentHistoryScreen(booking: booking),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Payment Method
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Payment Method :",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      Text(
                        booking["paymentMethod"]!,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Description
                  Text(
                    booking["description"]!,
                    style: const TextStyle(color: Colors.black87, fontSize: 12),
                  ),
                  const SizedBox(height: 12),

                  // Amount & Date Box
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Amount
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Amount",
                              style: TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              booking["amount"]!,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        // Date
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              "Date",
                              style: TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              booking["date"]!,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0, // Set the appropriate index for the selected tab
        onTap: (index) {
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
        },
      ),
    );
  }
}
