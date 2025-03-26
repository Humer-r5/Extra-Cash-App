import 'package:extra_cash_app/screens/camera_page.dart';
import 'package:flutter/material.dart';
import 'book_success_screen.dart';
import 'home_page.dart';
import '../widgets/bottom_navbar.dart';
import 'profile_page.dart';
import 'notifications_screen.dart';

class TechnicianDetailsScreen extends StatefulWidget {
  final String name, email, location, bio;
  final double price;
  final String appointmentDate, appointmentTime;

  const TechnicianDetailsScreen({
    super.key,
    required this.name,
    required this.email,
    required this.location,
    required this.bio,
    required this.price,
    required this.appointmentDate,
    required this.appointmentTime,
  });

  @override
  State<TechnicianDetailsScreen> createState() => _TechnicianDetailsScreenState();
}

class _TechnicianDetailsScreenState extends State<TechnicianDetailsScreen> {
  int selectedIndex = 0;
  bool isPressed = false; // Track button state

  void onItemTapped(int index) {
    Widget nextScreen = const HomePage();
    if (index == 2) {
      nextScreen = const NotificationScreen();
    } 
    else if (index == 1) {
      nextScreen = CameraApp();
    }
    else if (index == 3) {
      nextScreen = const ProfilePage();
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => nextScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Bio Section (Now at the top)
            Text(
              "About ${widget.name}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(widget.bio, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),

            // ✅ Pricing and Schedule (Card contains pricing + Book button)
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "₦${widget.price} (21% Off)",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "📍 Location: ${widget.location}\n📅 ${widget.appointmentDate} - 🕒 ${widget.appointmentTime}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),

                    // ✅ Book Button inside the card
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isPressed = true; // Change color on press
                          });

                          // Navigate to booking success screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookSuccessScreen(
                                name: widget.name,
                                email: widget.email,
                                location: widget.location,
                              ),
                            ),
                          ).then((_) {
                            setState(() {
                              isPressed = false; // Reset button color after returning
                            });
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isPressed ? const Color.fromRGBO(255, 201, 180, 127) : Colors.black, // Color change on press
                          padding: const EdgeInsets.symmetric(vertical: 12), // Smaller button
                        ),
                        child: const Text(
                          "Book Now",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // ✅ Reviews Section
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
