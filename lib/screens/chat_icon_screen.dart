import 'package:flutter/material.dart';
import './dynamic_chat_screen.dart';

class ChatIconScreen extends StatefulWidget {
  const ChatIconScreen({super.key});

  @override
  _ChatIconScreenState createState() => _ChatIconScreenState();
}

class _ChatIconScreenState extends State<ChatIconScreen> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> filteredMessages = messages;

  @override
  void initState() {
    super.initState();
    searchController.addListener(_filterMessages);
  }

  void _filterMessages() {
    setState(() {
      String query = searchController.text.toLowerCase();
      filteredMessages =
          messages.where((msg) {
            return msg["name"].toLowerCase().contains(query);
          }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        title: const Text("Technician"),
        actions: [],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Messages List
          Expanded(
            child:
                filteredMessages.isEmpty
                    ? const Center(
                      child: Text(
                        "No user found",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                    : ListView.builder(
                      itemCount: filteredMessages.length,
                      itemBuilder: (context, index) {
                        var user = filteredMessages[index];
                        return MessageTile(
                          profileImage: user["profileImage"],
                          name: user["name"],
                          message: user["message"],
                          time: user["time"],
                          unreadCount: user["unreadCount"],
                          onTap: () {
                            // Navigate to Chat Screen with user data
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        ChatScreen(userName: user["name"]),
                              ),
                            );
                          },
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }
}

// Dummy Messages List
final List<Map<String, dynamic>> messages = [
  {
    "profileImage": "assets/technician1.jpg",
    "name": "Technician",
    "message": "Good morning, did you sleep well?",
    "time": "Today",
    "unreadCount": 1,
  },
  {
    "profileImage": "assets/profile1.jpg",
    "name": "John Doe",
    "message": "Can we schedule the service tomorrow?",
    "time": "Yesterday",
    "unreadCount": 2,
  },
  {
    "profileImage": "assets/profile2.jpg",
    "name": "Jane Smith",
    "message": "Thank you for your help!",
    "time": "10:30 AM",
    "unreadCount": 0,
  },
  {
    "profileImage": "assets/profile3.jpg",
    "name": "Robert Williams",
    "message": "I'll be there in 15 minutes.",
    "time": "8:45 AM",
    "unreadCount": 3,
  },
  {
    "profileImage": "assets/profile4.jpg",
    "name": "Emily Johnson",
    "message": "Is there any update on my request?",
    "time": "Monday",
    "unreadCount": 0,
  },
];

// Message Tile Widget
class MessageTile extends StatelessWidget {
  final String profileImage;
  final String name;
  final String message;
  final String time;
  final int unreadCount;
  final VoidCallback onTap;

  const MessageTile({
    super.key,
    required this.profileImage,
    required this.name,
    required this.message,
    required this.time,
    required this.unreadCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: AssetImage(profileImage)),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(message, maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          if (unreadCount > 0)
            Container(
              margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.all(4), // Reduced size
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Text(
                unreadCount.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10, // Reduced font size
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
      onTap: onTap, // Navigate to chat on tap
    );
  }
}
