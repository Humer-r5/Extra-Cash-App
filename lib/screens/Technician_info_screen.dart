import 'package:flutter/material.dart';
import 'chat_screen.dart';

class TechnicianInfoScreen extends StatelessWidget {
  final String name, email, location;
  
  const TechnicianInfoScreen({
    super.key,
    required this.name,
    required this.email,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Technician Info")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Updated heading
            const Text(
              "About Technician",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // ✅ Technician Info Card
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage("assets/profile.png"), // Placeholder image
                ),
                title: Text(name),
                subtitle: Text("$email\n📍 $location"),
              ),
            ),
            const SizedBox(height: 20),

            // ✅ Action Buttons: Call & Chat
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Call functionality can be implemented later
                    },
                    icon: const Icon(Icons.call),
                    label: const Text("Call"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatScreen(
                            technicianName: name, // ✅ Pass technician's name
                            technicianEmail: email, // ✅ Pass technician's email
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.chat),
                    label: const Text("Chat"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
