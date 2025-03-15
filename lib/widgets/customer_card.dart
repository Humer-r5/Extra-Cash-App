import 'package:flutter/material.dart';

class CustomerCard extends StatelessWidget {
  final String name, email, location, imagePath;
  final VoidCallback onCallPressed, onChatPressed;

  const CustomerCard({super.key, 
    required this.name,
    required this.email,
    required this.location,
    required this.imagePath,
    required this.onCallPressed,
    required this.onChatPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(imagePath),
                radius: 30,
              ),
              title: Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.email, size: 16, color: Colors.grey),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          email,
                          style: TextStyle(fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 16, color: Colors.grey),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          location,
                          style: TextStyle(fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.call),
                  label: Text("Call"),
                  onPressed: onCallPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                ),
                OutlinedButton.icon(
                  icon: Icon(Icons.chat),
                  label: Text("Chat"),
                  onPressed: onChatPressed,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
