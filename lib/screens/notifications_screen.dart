import 'package:flutter/material.dart';
import 'home_page.dart';
import 'notification_detail_screen.dart'; // Import the new screen

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> notifications = [
      {
        "name": "Sylvan Strosin",
        "message":
            "It is a long-established fact that a reader will be distracted by the readable content of a page when looking at its layout...",
        "time": "2:30 PM",
        "image": "assets/user1.jpg",
      },
      {
        "name": "Cleveland Schiller",
        "message":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry...",
        "time": "5:15 PM",
        "image": "assets/user2.jpg",
      },
      {
        "name": "Bella Donnelly",
        "message":
            "It is a long-established fact that a reader will be distracted...",
        "time": "2:00 PM",
        "image": "assets/user3.jpg",
      },
      {
        "name": "Marquise Morissette",
        "message":
            "Contrary to popular belief, Lorem Ipsum is not simply random text...",
        "time": "6:45 PM",
        "image": "assets/user4.jpg",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
              (route) => false,
            );
          },
        ),
        title: const Text(
          "Notifications",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final item = notifications[index];
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(item["image"]),
                ),
                title: Text(
                  item["name"],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  item["message"],
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Text(
                  item["time"],
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                onTap: () {
                  // Navigate to the detail screen with respective data
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationDetailScreen(
                        name: item["name"],
                        message: item["message"],
                      ),
                    ),
                  );
                },
              ),
              const Divider(),
            ],
          );
        },
      ),
    );
  }
}
