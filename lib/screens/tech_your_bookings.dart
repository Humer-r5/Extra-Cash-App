import 'package:flutter/material.dart';
// import 'home_page.dart';
// import '../widgets/bottom_navbar.dart';
// import 'profile_page.dart';
// import 'camera_page.dart';
// import 'notifications_screen.dart';
import 'tech_payment_history.dart';

class TechYourBookings extends StatelessWidget {
  const TechYourBookings({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy booking data
    final List<Map<String, dynamic>> bookings = [
      {
        "service": "AC Repair",
        "technician": "John Doe",
        "date": "March 28, 2025",
        "amount": 1258.0,
        "paymentMethod": "Cash",
        "description": "AC cooling issue fixed with gas refill.",
      },
      {
        "service": "Plumbing",
        "technician": "Alice Smith",
        "date": "April 1, 2025",
        "amount": 1850.0,
        "paymentMethod": "Credit Card",
        "description": "Fixed leaking pipe and replaced tap.",
      },
      {
        "service": "Electrical Repair",
        "technician": "Michael Brown",
        "date": "April 5, 2025",
        "amount": 2100.0,
        "paymentMethod": "Bank Transfer",
        "description": "Replaced faulty wiring in living room.",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Bookings", style: TextStyle(color: Colors.black)),
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
              // Navigate to PaymentHistoryScreen with respective details
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TechPaymentHistory(
                    service: booking["service"],
                    technician: booking["technician"],
                    date: booking["date"],
                    amount: booking["amount"],
                    paymentMethod: booking["paymentMethod"],
                    description: booking["description"],
                  ),
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
                      const Text("Payment Method:", style: TextStyle(color: Colors.grey, fontSize: 14)),
                      Text(
                        booking["paymentMethod"],
                        style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Description
                  Text(
                    booking["description"],
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
                            const Text("Amount", style: TextStyle(color: Colors.grey, fontSize: 12)),
                            const SizedBox(height: 4),
                            Text(
                              "₦${booking["amount"].toStringAsFixed(2)}",
                              style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        // Date
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text("Date", style: TextStyle(color: Colors.grey, fontSize: 12)),
                            const SizedBox(height: 4),
                            Text(booking["date"], style: const TextStyle(color: Colors.black, fontSize: 14)),
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
      // bottomNavigationBar: BottomNavBar(
      //   currentIndex: 0, // Set the appropriate index for the selected tab
      //   onTap: (index) {
      //     if (index == 0) {
      //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
      //     } else if (index == 1) {
      //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CameraApp()));
      //     } else if (index == 2) {
      //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const NotificationScreen()));
      //     } else if (index == 3) {
      //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
      //     }
      //   },
      // ),
    );
  }
}
