import 'package:flutter/material.dart';
import 'technician_details_screen.dart';
import '../widgets/technician_card.dart';
import '../data/technician_dummy_data.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'notifications_screen.dart';
import '../widgets/bottom_navbar.dart';
import 'camera_page.dart';

class ServiceDetailPage extends StatefulWidget {
  final String title, image;
  final Function(BuildContext, String)? showAuthDialog;

  const ServiceDetailPage({
    super.key,
    required this.title,
    required this.image,
    this.showAuthDialog,
  });

  @override
  _ServiceDetailPageState createState() => _ServiceDetailPageState();
}

class _ServiceDetailPageState extends State<ServiceDetailPage> {
  int selectedIndex = 0; // Default index for the bottom nav bar

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });

    Widget nextScreen;
    if (index == 0) {
      nextScreen = const HomePage();
    } else if (index == 1) {
      nextScreen = CameraApp();
    } else if (index == 2) {
      nextScreen = const NotificationScreen();
    } else if (index == 3) {
      nextScreen = const ProfilePage();
    } else {
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => nextScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Fetch technicians dynamically based on service title
    final List<Map<String, dynamic>> technicians =
        techniciansData[widget.title.trim()] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
              widget.image,
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
                    "Get Expert ${widget.title} Services",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Professional ${widget.title} services for all your needs. "
                    "Our skilled technicians ensure quality service and customer satisfaction.",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Active Technicians",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  // Dynamically Render Technicians
                  if (technicians.isNotEmpty)
                    Column(
                      children:
                          technicians.map((tech) {
                            return TechnicianCard(
                              name: tech["name"] ?? "Unknown",
                              email: tech["email"] ?? "No Email Available",
                              location:
                                  tech["location"] ?? "No Location Available",
                              bio: tech["bio"] ?? "No Bio Available",
                              onViewTap: () {
                                if (widget.showAuthDialog != null) {
                                  // Show authentication prompt for guests
                                  widget.showAuthDialog!(context, "Booking");
                                } else {
                                  // Navigate to Technician Details for logged-in users
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => TechnicianDetailsScreen(
                                            name: tech["name"] ?? "Unknown",
                                            email:
                                                tech["email"] ??
                                                "No Email Available",
                                            location:
                                                tech["location"] ??
                                                "No Location Available",
                                            bio:
                                                tech["bio"] ??
                                                "No Bio Available",
                                            price: tech["price"] ?? 0.0,
                                            appointmentDate:
                                                tech["appointmentDate"] ??
                                                "N/A",
                                            appointmentTime:
                                                tech["appointmentTime"] ??
                                                "N/A",
                                          ),
                                    ),
                                  );
                                }
                              },
                            );
                          }).toList(),
                    )
                  else
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "No technicians available for this service.",
                          style: TextStyle(color: Colors.red, fontSize: 16),
                        ),
                      ),
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
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => CameraApp()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const NotificationScreen(),
              ),
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
