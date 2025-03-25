import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String userName;

  const ChatScreen({super.key, required this.userName});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  List<Map<String, dynamic>> chatMessages = [];

  @override
  void initState() {
    super.initState();
    chatMessages = getChatMessages(widget.userName); // Load messages dynamically
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    setState(() {
      chatMessages.add({
        "text": _messageController.text,
        "isSender": true, // Message sent by the user
      });
    });

    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(widget.userName, style: const TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Chat Messages
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: chatMessages.length,
              itemBuilder: (context, index) {
                var message = chatMessages[index];
                return ChatBubble(text: message["text"], isSender: message["isSender"]);
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
                    controller: _messageController,
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
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Chat Bubble Widget
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

// Function to get chat messages for a specific user
List<Map<String, dynamic>> getChatMessages(String userName) {
  Map<String, List<Map<String, dynamic>>> chatData = {
    "Technician": [
      {"text": "Hello! How can I help you?", "isSender": false},
      {"text": "I need help with AC repair.", "isSender": true},
    ],
    "John Doe": [
      {"text": "Hey, when can we schedule the service?", "isSender": false},
      {"text": "How about tomorrow morning?", "isSender": true},
    ],
    "Jane Smith": [
      {"text": "Thank you for your help!", "isSender": false},
      {"text": "You're welcome!", "isSender": true},
    ],
    "Robert Williams": [
      {"text": "I'll be there in 15 minutes.", "isSender": false},
      {"text": "Okay, see you soon!", "isSender": true},
    ],
    "Emily Johnson": [
      {"text": "Is there any update on my request?", "isSender": false},
      {"text": "I’ll check and update you shortly.", "isSender": true},
    ],
  };

  return chatData[userName] ?? [];
}
