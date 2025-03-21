import 'package:flutter/material.dart';
import 'technician_home_page.dart';

class TechNotificationScreen extends StatelessWidget {
  const TechNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> notifications = [
      {
        "name": "Sylvan Strosin",
        "message": "It is a long established fact that...",
        "time": "2:30 PM",
        "image": "assets/user1.jpg",
        "unreadCount": 0,
      },
      {
        "name": "Cleveland Schiller",
        "message": "It is a long established fact that...",
        "time": "5:15 PM",
        "image": "assets/user2.jpg",
        "unreadCount": 0,
      },
      {
        "name": "Bella Donnelly",
        "message": "It is a long established fact",
        "time": "2:00 PM",
        "image": "assets/user3.jpg",
        "unreadCount": 3,
      },
      {
        "name": "Marquise Morissette",
        "message": "It is a long established fact...",
        "time": "6:45 PM",
        "image": "assets/user4.jpg",
        "unreadCount": 0,
      },
      {
        "name": "Cooper McCullough",
        "message": "It is a long established",
        "time": "12:25 PM",
        "image": "assets/user5.jpg",
        "unreadCount": 4,
      },
      {
        "name": "Fabian Torp",
        "message": "It is a long established fact that...",
        "time": "10:00 PM",
        "image": "assets/user6.jpg",
        "unreadCount": 0,
      },
      {
        "name": "Lloyd Rodriguez",
        "message": "It is a long established fact that...",
        "time": "4:40 PM",
        "image": "assets/user7.jpg",
        "unreadCount": 0,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const TechnicianHomePage(),
              ),
              (route) => false, // Removes all previous routes from the stack
            );
          },
        ),
        title: const Text(
          "Notifications", // Added Title for Notifications
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
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      item["time"],
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    if (item["unreadCount"] > 0)
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Colors.purple,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          item["unreadCount"].toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const Divider(),
            ],
          );
        },
      ),
    );
  }
}
