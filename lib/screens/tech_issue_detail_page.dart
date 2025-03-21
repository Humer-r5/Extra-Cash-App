import 'package:flutter/material.dart';

class TechIssueDetailPage extends StatefulWidget {
  final Map<String, dynamic> issue;
  final Function onDecline; // Callback function to remove the issue from the list

  const TechIssueDetailPage({
    super.key,
    required this.issue,
    required this.onDecline,
  });

  @override
  _TechIssueDetailPageState createState() => _TechIssueDetailPageState();
}

class _TechIssueDetailPageState extends State<TechIssueDetailPage> {
  bool isAccepted = false; // Tracks whether the issue is accepted

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 🖼 Image Display
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                widget.issue["image"],
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),

            // 📝 Issue Title
            Text(
              widget.issue["title"],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // 👤 Customer Details
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(widget.issue["image"]),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.issue["name"],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.email,
                                size: 16,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  widget.issue["email"],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                size: 16,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  widget.issue["address"],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ✅ Accept & ❌ Decline Buttons (Only if not accepted)
            if (!isAccepted)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // ✅ Accept Button (Now on the LEFT side)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isAccepted = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    child: const Text(
                      "Accept",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  // ❌ Decline Button (Now on the RIGHT side)
                  ElevatedButton(
                    onPressed: () {
                      widget.onDecline(); // Remove the issue from the list
                      Navigator.pop(context); // Go back to previous page
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    child: const Text(
                      "Decline",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),

            // 💬 Chat Button (Only appears after accepting)
            if (isAccepted)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Navigate to chat screen (add the correct navigation)
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  icon: const Icon(
                    Icons.chat_bubble_outline,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "Chat",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
