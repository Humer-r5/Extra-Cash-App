import 'package:flutter/material.dart';

class TechnicianCard extends StatelessWidget {
  final String name, email, location;
  final VoidCallback onViewTap;

  const TechnicianCard({
    super.key,
    required this.name,
    required this.email,
    required this.location,
    required this.onViewTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(backgroundImage: AssetImage("assets/profile.png")),
        title: Text(name),
        subtitle: Text("$email\n$location"),
        trailing: ElevatedButton(
          onPressed: onViewTap,
          child: const Text("View"),
        ),
      ),
    );
  }
}
