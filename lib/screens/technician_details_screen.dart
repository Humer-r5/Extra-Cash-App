// import 'package:flutter/material.dart';
// import 'customer_info_screen.dart';

// class TechnicianDetailsScreen extends StatelessWidget {
//   const TechnicianDetailsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Technician Details")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "Reviews",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             ListTile(
//               leading: const CircleAvatar(
//                 backgroundImage: AssetImage("assets/profile.png"),
//               ),
//               title: const Text("Donna Bins"),
//               subtitle: const Text("Very prompt with delivery."),
//               trailing: const Text("4.5 ⭐"),
//             ),
//             const SizedBox(height: 20),
//             Card(
//               child: ListTile(
//                 title: const Text("\$50  (21% Off)"),
//                 subtitle: const Text(
//                   "Location: 1901 Thornridge Cir\n02 Feb, 2022 - 8:30 AM",
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Row(
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const CustomerInfoScreen(),
//                         ),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor:
//                           Colors.green, // Set button background to green
//                     ),
//                     child: const Text(
//                       "Book",
//                       style: TextStyle(
//                         color: Colors.white,
//                       ), // Ensure text is visible
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
// import 'customer_info_screen.dart';
import './login-continue-page.dart'; // Importing the login screen

class TechnicianDetailsScreen extends StatelessWidget {
  const TechnicianDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Technician Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Reviews",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage("assets/profile.png"),
              ),
              title: const Text("Donna Bins"),
              subtitle: const Text("Very prompt with delivery."),
              trailing: const Text("4.5 ⭐"),
            ),
            const SizedBox(height: 20),
            Card(
              child: ListTile(
                title: const Text("\$50  (21% Off)"),
                subtitle: const Text(
                  "Location: 1901 Thornridge Cir\n02 Feb, 2022 - 8:30 AM",
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text(
                      "Book",
                      style: TextStyle(color: Colors.white),
                    ),
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
