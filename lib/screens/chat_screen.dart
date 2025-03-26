import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String technicianName;
  final String technicianEmail;

  const ChatScreen({
    super.key,
    required this.technicianName,
    required this.technicianEmail,
  });

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // ✅ Dummy chat data for different technicians
  final Map<String, List<Map<String, dynamic>>> chatMessages = {
    "John Doe": [
      {"text": "Hello! How can I assist you?", "isSender": false},
      {"text": "I need help with my AC repair.", "isSender": true},
      {"text": "Sure! What issue are you facing?", "isSender": false},
    ],
    "Jane Smith": [
      {"text": "Hi there! What service do you need?", "isSender": false},
      {"text": "Can you fix my washing machine?", "isSender": true},
      {"text": "Yes! When would you like me to come?", "isSender": false},
    ],
  };

  // Store the current technician's chat messages
  late List<Map<String, dynamic>> messages;

  @override
  void initState() {
    super.initState();
    // ✅ Load chat for the selected technician (default empty if not found)
    messages = chatMessages[widget.technicianName] ?? [];
  }

  // Function to send a message
  void sendMessage(String text) {
    if (text.isNotEmpty) {
      setState(() {
        messages.add({"text": text, "isSender": true}); // Add user message
      });

      // Simulate a technician response after a delay
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          messages.add({
            "text": "Got it! I'll assist you soon.",
            "isSender": false,
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController messageController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Go back
          },
        ),
        title: Text(widget.technicianName, style: const TextStyle(color: Colors.black)), // ✅ Technician's Name
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ChatBubble(
                  text: messages[index]["text"],
                  isSender: messages[index]["isSender"],
                );
              },
            ),
          ),
          // Chat Input Field
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blue),
                  onPressed: () {
                    sendMessage(messageController.text);
                    messageController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ✅ Chat Bubble Widget
class ChatBubble extends StatelessWidget {
  final String text;
  final bool isSender;

  const ChatBubble({super.key, required this.text, required this.isSender});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSender ? Colors.blue[100] : Colors.grey[300],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(text, style: const TextStyle(fontSize: 14)),
      ),
    );
  }
}
