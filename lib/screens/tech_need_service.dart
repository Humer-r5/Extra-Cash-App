import 'package:flutter/material.dart';
import 'tech_issue_detail_page.dart';

class TechNeedService extends StatefulWidget {
  const TechNeedService({super.key});

  @override
  _TechNeedServiceState createState() => _TechNeedServiceState();
}

class _TechNeedServiceState extends State<TechNeedService> {
  List<Map<String, dynamic>> issues = [
    {
      "image": "assets/technician_plumber.png",
      "title": "Water Leakage",
      "name": "Rose Customer",
      "email": "rose@gmail.com",
      "address": "123 Main Street, NY"
    },
    {
      "image": "assets/technician_electrician.png",
      "title": "Electric Issue",
      "name": "John Doe",
      "email": "john.doe@gmail.com",
      "address": "456 Park Avenue, CA"
    },
    {
      "image": "assets/technician_plumber.png",
      "title": "Plumbing Problem",
      "name": "Emily Smith",
      "email": "emily.smith@gmail.com",
      "address": "789 Broadway, TX"
    },
    {
      "image": "assets/technician_ac_mechanic.png",
      "title": "AC Not Cooling",
      "name": "Michael Brown",
      "email": "michael.brown@gmail.com",
      "address": "101 Lincoln Street, FL"
    },
    {
      "image": "assets/technician_electrician.png",
      "title": "Heater Malfunction",
      "name": "Sophia Wilson",
      "email": "sophia.wilson@gmail.com",
      "address": "205 Ocean Drive, LA"
    },
    {
      "image": "assets/technician_electrician.png",
      "title": "Internet Not Working",
      "name": "David Johnson",
      "email": "david.johnson@gmail.com",
      "address": "300 Mountain View, SF"
    },
  ];

  // Function to remove an issue when declined
  void removeIssue(Map<String, dynamic> issue) {
    setState(() {
      issues.remove(issue);
    });
  }

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
        title: const Text(
          "Reported Issues",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: issues.isEmpty
            ? const Center(
                child: Text(
                  "No reported issues available.",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two items per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7, // Adjusted for better proportions
                ),
                itemCount: issues.length,
                itemBuilder: (context, index) {
                  final issue = issues[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TechIssueDetailPage(
                            issue: issue,
                            onDecline: () => removeIssue(issue), // Callback
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 🖼 Image taking 65% of the card
                          Expanded(
                            flex: 65, // 65% of the height
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                              child: Image.asset(
                                issue["image"],
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // 📌 Remaining 35% for text details
                          Expanded(
                            flex: 35, // 35% of the height
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    issue["title"],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 16,
                                        backgroundImage: AssetImage(issue["image"]),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              issue["name"],
                                              style: const TextStyle(
                                                  fontSize: 14, fontWeight: FontWeight.bold),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              issue["email"],
                                              style: const TextStyle(
                                                  fontSize: 12, color: Colors.grey),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Icon(Icons.location_on, size: 14, color: Colors.grey),
                                      const SizedBox(width: 4),
                                      Expanded(
                                        child: Text(
                                          issue["address"],
                                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
