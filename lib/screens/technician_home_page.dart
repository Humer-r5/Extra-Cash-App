// import 'package:flutter/material.dart';

// // void main() {
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       theme: ThemeData(primarySwatch: Colors.deepPurple),
// //       home: const TechnicianHomePage(),
// //       debugShowCheckedModeBanner: false,
// //     );
// //   }
// // }

// class TechnicianHomePage extends StatelessWidget {
//   const TechnicianHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text(
//           "EXTRA CASH",
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontSize: 22,
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.more_vert, color: Colors.black),
//             onPressed: () {},
//           ),
//         ],
//         centerTitle: false,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Location Dropdown
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   "Current Location",
//                   style: TextStyle(fontSize: 14, color: Colors.grey),
//                 ),
//                 DropdownButton<String>(
//                   value: 'Abuja Nigeria',
//                   icon: const Icon(Icons.keyboard_arrow_down),
//                   underline: Container(),
//                   items:
//                       ['Abuja Nigeria', 'Lagos', 'Port Harcourt'].map((
//                         String value,
//                       ) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(
//                             value,
//                             style: const TextStyle(fontSize: 14),
//                           ),
//                         );
//                       }).toList(),
//                   onChanged: (value) {},
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),

//             // Search Bar
//             TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search',
//                 prefixIcon: const Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//                 fillColor: Colors.white,
//                 filled: true,
//                 contentPadding: const EdgeInsets.symmetric(
//                   vertical: 0,
//                   horizontal: 16,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),

//             // Horizontal Cards (Your Bookings & Your Wallet)
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: GestureDetector(
//                     onTap: () {
//                       // Handle "Your Bookings" tap
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const YourBookingsPage(),
//                         ),
//                       );
//                     },
//                     child: _buildFeatureCard(
//                       "assets/bookings.jpg",
//                       "Your Bookings",
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 Expanded(
//                   child: GestureDetector(
//                     onTap: () {
//                       // Handle "Your Wallet" tap
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const YourWalletPage(),
//                         ),
//                       );
//                     },
//                     child: _buildFeatureCard(
//                       "assets/wallet.jpg",
//                       "Your Wallet",
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 24),

//             // Service Section
//             const Center(
//               child: Text(
//                 "SERVICE REQUIRED",
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),

//             // Plumber Card
//             _buildServiceCard(
//               context,
//               "assets/technician_plumber.png",
//               "NEED PLUMBER",
//               () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const PlumberPage()),
//                 );
//               },
//             ),
//             const SizedBox(height: 20),

//             // Electrician Card
//             _buildServiceCard(
//               context,
//               "assets/Technician-Ac-Mechanic.png",
//               "NEED ELECTRICIAN",
//               () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const ElectricianPage(),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Feature Card
//   Widget _buildFeatureCard(String image, String title) {
//     return Container(
//       height: 100,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
//       ),
//       alignment: Alignment.bottomCenter,
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 8),
//         width: double.infinity,
//         color: Colors.black54,
//         child: Text(
//           title,
//           textAlign: TextAlign.center,
//           style: const TextStyle(color: Colors.white, fontSize: 16),
//         ),
//       ),
//     );
//   }

//   // Service Card
//   Widget _buildServiceCard(
//     BuildContext context,
//     String image,
//     String title,
//     VoidCallback onTap,
//   ) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Column(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(12),
//             child: Image.asset(
//               image,
//               height: 150,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Container(
//             padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
//             decoration: BoxDecoration(
//               color: Colors.black,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Text(
//               title,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Dummy Pages for Navigation
// class YourBookingsPage extends StatelessWidget {
//   const YourBookingsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(body: Center(child: Text("Your Bookings")));
//   }
// }

// class YourWalletPage extends StatelessWidget {
//   const YourWalletPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(body: Center(child: Text("Your Wallet")));
//   }
// }

// class PlumberPage extends StatelessWidget {
//   const PlumberPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(body: Center(child: Text("Plumber Page")));
//   }
// }

// class ElectricianPage extends StatelessWidget {
//   const ElectricianPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(body: Center(child: Text("Electrician Page")));
//   }
// }

// class Acmechanicpage extends StatelessWidget {
//   const Acmechanicpage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(body: Center(child: Text("Acmechanic Page")));
//   }
// }

// import 'package:flutter/material.dart';

// class TechnicianHomePage extends StatelessWidget {
//   const TechnicianHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text(
//           "EXTRA CASH",
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontSize: 22,
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.more_vert, color: Colors.black),
//             onPressed: () {},
//           ),
//         ],
//         centerTitle: false,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Location Dropdown
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   "Current Location",
//                   style: TextStyle(fontSize: 14, color: Colors.grey),
//                 ),
//                 DropdownButton<String>(
//                   value: 'Abuja Nigeria',
//                   icon: const Icon(Icons.keyboard_arrow_down),
//                   underline: Container(),
//                   items:
//                       ['Abuja Nigeria', 'Lagos', 'Port Harcourt'].map((
//                         String value,
//                       ) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(
//                             value,
//                             style: const TextStyle(fontSize: 14),
//                           ),
//                         );
//                       }).toList(),
//                   onChanged: (value) {},
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),

//             // Search Bar
//             TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search',
//                 prefixIcon: const Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//                 fillColor: Colors.white,
//                 filled: true,
//                 contentPadding: const EdgeInsets.symmetric(
//                   vertical: 0,
//                   horizontal: 16,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),

//             // Horizontal Cards (Your Bookings & Your Wallet)
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const YourBookingsPage(),
//                         ),
//                       );
//                     },
//                     child: _buildFeatureCard(
//                       "assets/bookings.jpg",
//                       "Your Bookings",
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 Expanded(
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const YourWalletPage(),
//                         ),
//                       );
//                     },
//                     child: _buildFeatureCard(
//                       "assets/wallet.jpg",
//                       "Your Wallet",
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 24),

//             // Service Section
//             const Center(
//               child: Text(
//                 "SERVICE REQUIRED",
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),

//             // Plumber Card
//             _buildServiceCard(
//               context,
//               "assets/technician_plumber.png",
//               "NEED PLUMBER",
//               () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const PlumberPage()),
//                 );
//               },
//             ),
//             const SizedBox(height: 20),

//             // Electrician Card
//             _buildServiceCard(
//               context,
//               "assets/Technician-Ac-Mechanic.png",
//               "NEED ELECTRICIAN",
//               () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const ElectricianPage(),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Feature Card
//   Widget _buildFeatureCard(String image, String title) {
//     return Container(
//       height: 100,
//       decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(12),
//         child: Stack(
//           children: [
//             Image.asset(
//               image,
//               width: double.infinity,
//               height: double.infinity,
//               fit: BoxFit.cover, // Ensures the image covers the whole container
//             ),
//             Container(
//               alignment: Alignment.bottomCenter,
//               padding: const EdgeInsets.symmetric(vertical: 8),
//               color: Colors.black54,
//               child: Text(
//                 title,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(color: Colors.white, fontSize: 16),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Service Card
//   Widget _buildServiceCard(
//     BuildContext context,
//     String image,
//     String title,
//     VoidCallback onTap,
//   ) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Column(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(12),
//             child: Image.asset(
//               image,
//               height: 50,
//               width: double.infinity,
//               fit: BoxFit.cover, // Ensures full coverage
//             ),
//           ),
//           const SizedBox(height: 8),
//           Container(
//             padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
//             decoration: BoxDecoration(
//               color: Colors.black,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Text(
//               title,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Dummy Pages for Navigation
// class YourBookingsPage extends StatelessWidget {
//   const YourBookingsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(body: Center(child: Text("Your Bookings")));
//   }
// }

// class YourWalletPage extends StatelessWidget {
//   const YourWalletPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(body: Center(child: Text("Your Wallet")));
//   }
// }

// class PlumberPage extends StatelessWidget {
//   const PlumberPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(body: Center(child: Text("Plumber Page")));
//   }
// }

// class ElectricianPage extends StatelessWidget {
//   const ElectricianPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(body: Center(child: Text("Electrician Page")));
//   }
// }

// import 'package:flutter/material.dart';
// // import "./technicain_bottomnav_page.dart";

// class _TechnicianHomePage extends StatefulWidget {
//   const _TechnicianHomePage({super.key});

//   @override
//   _TechnicianHomePageState createState() => _TechnicianHomePageState();
// }

// class _TechnicianHomePageState extends State<TechnicianHomePage> {
//   int _selectedIndex = 0;

//   final List<Widget> _pages = [
//     const HomePage(),
//     const AlertsPage(),
//     const ProfilePage(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_selectedIndex], // Display the selected page
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.black,
//         unselectedItemColor: Colors.grey,
//         onTap: _onItemTapped,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.notifications),
//             label: 'Alerts',
//           ),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//         ],
//       ),
//     );
//   }
// }

// // ✅ Home Page
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Home")),
//       body: const Center(
//         child: Text('Welcome to the Home Page', style: TextStyle(fontSize: 18)),
//       ),
//     );
//   }
// }

// // ✅ Alerts Page
// class AlertsPage extends StatelessWidget {
//   const AlertsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Alerts")),
//       body: const Center(
//         child: Text('No new alerts', style: TextStyle(fontSize: 18)),
//       ),
//     );
//   }
// }

// // ✅ Profile Page
// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Profile")),
//       body: const Center(
//         child: Text('User Profile', style: TextStyle(fontSize: 18)),
//       ),
//     );
//   }
// }

// class _TechnicianHomePageState extends State<TechnicianHomePage> {
//   final List<Map<String, String>> services = [
//     {"title": "Plumber", "image": "assets/technician_plumber.png"},
//     {"title": "Electrician", "image": "assets/technician_electrician.png"},
//     {"title": "Carpenter", "image": "assets/technician_carpenter.png"},
//     {
//       "title": "Packers & Movers",
//       "image": "assets/technician_packers&movers.png",
//     },
//     {"title": "AC Mechanic", "image": "assets/technician_ac_mechanic.png"},
//   ];

//   final TextEditingController _searchController = TextEditingController();
//   String _searchQuery = '';
//   final ScrollController _scrollController = ScrollController();

//   void _scrollToService(int index) {
//     _scrollController.animateTo(
//       index * 200.0, // Adjust based on card height
//       duration: const Duration(milliseconds: 500),
//       curve: Curves.easeInOut,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,

//       // App Bar
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         automaticallyImplyLeading: false,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Text(
//               "EXTRA CASH",
//               style: TextStyle(
//                 fontSize: 20,
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   const Text(
//                     "Current Location",
//                     style: TextStyle(fontSize: 12, color: Colors.grey),
//                   ),
//                   Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: const [
//                       Text(
//                         "Abuja, Nigeria",
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                       Icon(Icons.keyboard_arrow_down, size: 16),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             IconButton(
//               icon: const Icon(Icons.more_vert, color: Colors.black),
//               onPressed: () {},
//             ),
//           ],
//         ),
//       ),

//       // Body
//       body: SingleChildScrollView(
//         controller: _scrollController,
//         child: Column(
//           children: [
//             // Search Bar
//             Padding(
//               padding: const EdgeInsets.all(16),
//               child: TextField(
//                 controller: _searchController,
//                 onChanged: (value) {
//                   setState(() {
//                     _searchQuery = value;
//                   });
//                 },
//                 decoration: InputDecoration(
//                   hintText: "Search",
//                   prefixIcon: const Icon(Icons.search),
//                   suffixIcon:
//                       _searchQuery.isNotEmpty
//                           ? IconButton(
//                             icon: const Icon(Icons.cancel, color: Colors.grey),
//                             onPressed: () {
//                               _searchController.clear();
//                               setState(() {
//                                 _searchQuery = '';
//                               });
//                             },
//                           )
//                           : null,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                   filled: true,
//                   fillColor: Colors.grey[100],
//                 ),
//               ),
//             ),

//             // Horizontal Cards
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Row(
//                 children: [
//                   // Your Bookings Card
//                   Expanded(
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const YourBookingsScreen(),
//                           ),
//                         );import 'package:flutter/material.dart';

//                       },
//                       child: _buildFeatureCard(
//                         "assets/bookings.jpg",
//                         "Your Bookings",
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 16),

//                   // Your Wallet Card
//                   Expanded(
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const YourWalletScreen(),
//                           ),
//                         );
//                       },
//                       child: _buildFeatureCard(
//                         "assets/wallet.jpg",
//                         "Your Wallet",
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 24),

//             // Service Title
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               child: Align(
//                 alignment: Alignment.center,
//                 child: Text(
//                   "Services Offered",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),

//             // Display "Service Unavailable" if no match found
//             if (services.every(
//               (service) =>
//                   !service["title"]!.toLowerCase().contains(
//                     _searchQuery.toLowerCase(),
//                   ),
//             ))
//               const Padding(
//                 padding: EdgeInsets.symmetric(vertical: 10),
//                 child: Text(
//                   "Service Unavailable",
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.red,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),

//             // Services List
//             ListView.builder(
//               physics: const NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: services.length,
//               itemBuilder: (context, index) {
//                 final serviceTitle = services[index]["title"]!;
//                 if (_searchQuery.isEmpty ||
//                     serviceTitle.toLowerCase().contains(
//                       _searchQuery.toLowerCase(),
//                     )) {
//                   return GestureDetector(
//                     onTap: () {
//                       _scrollToService(index);
//                     },
//                     child: ServiceCard(
//                       title: serviceTitle,
//                       image: services[index]["image"]!,
//                       onExplore: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder:
//                                 (context) => ServiceDetailPage(
//                                   title: serviceTitle,
//                                   image: services[index]["image"]!,
//                                 ),
//                           ),
//                         );
//                       },
//                     ),
//                   );
//                 } else {
//                   return Container();
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Feature Card
//   Widget _buildFeatureCard(String image, String title) {
//     return Card(
//       clipBehavior: Clip.antiAlias,
//       child: Stack(
//         children: [
//           Image.asset(
//             image,
//             height: 120,
//             width: double.infinity,
//             fit: BoxFit.cover,
//           ),
//           Positioned.fill(
//             child: Center(
//               child: Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                   shadows: [
//                     Shadow(
//                       blurRadius: 6,
//                       color: Colors.black,
//                       offset: Offset(1, 2),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Dummy Screens
// class YourBookingsScreen extends StatelessWidget {
//   const YourBookingsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(body: Center(child: Text("Your Bookings")));
//   }
// }

// class YourWalletScreen extends StatelessWidget {
//   const YourWalletScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(body: Center(child: Text("Your Wallet")));
//   }
// }

// class ServiceDetailPage extends StatelessWidget {
//   final String title;
//   final String image;

//   const ServiceDetailPage({
//     super.key,
//     required this.title,
//     required this.image,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(title)),
//       body: Center(child: Image.asset(image)),
//     );
//   }
// }

// class ServiceCard extends StatelessWidget {
//   final String title;
//   final String image;
//   final VoidCallback onExplore;

//   const ServiceCard({
//     super.key,
//     required this.title,
//     required this.image,
//     required this.onExplore,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onExplore,
//       child: Card(
//         margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         clipBehavior: Clip.antiAlias,
//         child: Stack(
//           children: [
//             Image.asset(
//               image,
//               height: 120,
//               width: double.infinity,
//               fit: BoxFit.cover, // Ensure the image fits well
//             ),
//             Positioned.fill(
//               child: Container(
//                 color: Colors.black.withOpacity(
//                   0.5,
//                 ), // Dark overlay for contrast
//                 alignment: Alignment.center,
//                 child: Text(
//                   title,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     shadows: [
//                       Shadow(
//                         blurRadius: 4,
//                         color: Colors.black45,
//                         offset: Offset(1, 2),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class TechnicianHomePage extends StatelessWidget {
  TechnicianHomePage({super.key});

  final List<Map<String, dynamic>> serviceList = [
    {
      "imagePath": 'assets/technician_electrician.png',
      "text": 'NEED ELECTRICIAN',
      "onTap": () {},
    },
    {
      "imagePath": 'assets/technician_ac_mechanic.png',
      "text": 'NEED AC MECHANIC',
      "onTap": () {},
    },
    {
      "imagePath": 'assets/technician_packers&movers.png',
      "text": 'NEED PACKERS & MOVERS',
      "onTap": () {},
    },
    {
      "imagePath": 'assets/technician_carpenter.png',
      "text": 'NEED CARPENTER',
      "onTap": () {},
    },
    {
      "imagePath": 'assets/technician_plumber.png',
      "text": 'NEED PLUMBERS',
      "onTap": () {},
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "EXTRA CASH",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Current Location",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Abuja, Nigeria",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_down, size: 16),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Image.asset("assets/msg_icon.png", width: 24, height: 24),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const ChatScreen()),
                // );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => YourBookingsScreen(),
                      //   ),
                      // );
                    },
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.4),
                                BlendMode.darken,
                              ),
                              child: Image.asset(
                                "assets/bookings.jpg",
                                fit: BoxFit.cover,
                                height: 120,
                                width: double.infinity,
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Center(
                              child: Text(
                                "Your Bookings",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 6,
                                      color: Colors.black,
                                      offset: Offset(1, 2),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => YourWalletScreen(),
                      //   ),
                      // );
                    },
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.5),
                                BlendMode.darken,
                              ),
                              child: Image.asset(
                                "assets/wallet.jpg",
                                fit: BoxFit.cover,
                                height: 120,
                                width: double.infinity,
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Center(
                              child: Text(
                                "Your Wallet",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  letterSpacing: 0.8,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 6,
                                      color: Colors.black.withOpacity(0.6),
                                      offset: Offset(1, 2),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  "TECHNICIANS REQUIRED",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                physics:
                    const AlwaysScrollableScrollPhysics(), // Enable scrolling
                shrinkWrap: true, // Allow the ListView to fit within its parent
                itemCount: serviceList.length, // Number of items in the list
                itemBuilder: (context, index) {
                  final service =
                      serviceList[index]; // Get the data for the current index
                  return Column(
                    children: [
                      ServiceCard(
                        imagePath: service["imagePath"],
                        text: service["text"],
                        onTap: service["onTap"],
                      ),
                      SizedBox(height: 10), // Add spacing between cards
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Ensures all items are visible
        selectedItemColor: Colors.blue, // Color for the selected item
        unselectedItemColor: Colors.grey, // Color for unselected items
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Alert',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback onTap;

  const ServiceCard({
    super.key,
    required this.imagePath,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15), // Add border radius here
            child: Image.asset(
              imagePath,
              height: 180, // Reduced height (previously it was default)
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(text, style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
