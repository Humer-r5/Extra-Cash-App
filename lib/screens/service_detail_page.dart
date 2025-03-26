import 'package:flutter/material.dart';
import 'technician_details_screen.dart';
import '../widgets/technician_card.dart';
import '../data/technician_dummy_data.dart';

class ServiceDetailPage extends StatelessWidget {
  final String title, image;
  final Function(BuildContext, String)? showAuthDialog;

  const ServiceDetailPage({
    super.key,
    required this.title,
    required this.image,
    this.showAuthDialog,
  });

  @override
  Widget build(BuildContext context) {
    // Fetch technicians dynamically based on service title
    final List<Map<String, dynamic>> technicians =
        techniciansData[title.trim()] ?? [];

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
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                  const SizedBox(height: 8),

                  // Dynamically Render Technicians
                  if (technicians.isNotEmpty)
                    Column(
                      children: technicians.map((tech) {
                        return TechnicianCard(
                          name: tech["name"] ?? "Unknown",
                          email: tech["email"] ?? "No Email Available",
                          location: tech["location"] ?? "No Location Available",
                          bio: tech["bio"] ?? "No Bio Available",
                          onViewTap: () {
                            if (showAuthDialog != null) {
                              // Show authentication prompt for guests
                              showAuthDialog!(context, "Booking");
                            } else {
                              // Navigate to Technician Details for logged-in users
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TechnicianDetailsScreen(
                                    name: tech["name"] ?? "Unknown",
                                    email: tech["email"] ?? "No Email Available",
                                    location: tech["location"] ?? "No Location Available",
                                    bio: tech["bio"] ?? "No Bio Available",
                                    price: tech["price"] ?? 0.0, // Correct price from data
                                    appointmentDate: tech["appointmentDate"] ?? "N/A",
                                    appointmentTime: tech["appointmentTime"] ?? "N/A",
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
    );
  }
}
