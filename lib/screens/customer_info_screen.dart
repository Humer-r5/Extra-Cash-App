import 'package:flutter/material.dart';
import 'chat_screen.dart';

class CustomerInfoScreen extends StatelessWidget {
  const CustomerInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Customer Info")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "About Customer",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Card(
              child: ListTile(
                leading: const CircleAvatar(backgroundImage: AssetImage("assets/profile.png")),
                title: const Text("Rose Customer"),
                subtitle: const Text("example@gmail.com\n1901 Thornridge Cir"),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {}, // No action for call
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
                        MaterialPageRoute(builder: (context) =>  ChatScreen()),
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
