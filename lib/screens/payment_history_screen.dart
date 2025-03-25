import 'package:flutter/material.dart';

class PaymentHistoryScreen extends StatelessWidget {
  final Map<String, String> booking;

  const PaymentHistoryScreen({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Payment History",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Payment Details
            Container(
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
                  const Text(
                    "Payment Details",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text("Payment Method: ${booking["paymentMethod"]}",
                      style: const TextStyle(fontSize: 14, color: Colors.grey)),
                  const SizedBox(height: 6),
                  Text("Amount Paid: ${booking["amount"]}",
                      style: const TextStyle(fontSize: 14, color: Colors.black)),
                  const SizedBox(height: 6),
                  Text("Date: ${booking["date"]}",
                      style: const TextStyle(fontSize: 14, color: Colors.black)),
                  const SizedBox(height: 6),
                  Text("Description: ${booking["description"]}",
                      style: const TextStyle(fontSize: 14, color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Confirmation Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  "Back to Bookings",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
