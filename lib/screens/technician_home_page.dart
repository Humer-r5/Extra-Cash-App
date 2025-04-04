import 'package:flutter/material.dart';
import 'tech_need_service.dart'; // Import TechNeedService page
import 'tech_profile_page.dart';
import 'tech_notifications.dart';
import 'tech_your_bookings.dart';
import 'tech_your_wallet.dart';
import './tech_chat_icon.dart';

// import "./tech_notifications.dart";
class TechnicianHomePage extends StatefulWidget {
  final List<String> selectedSkills; // Add this property
  const TechnicianHomePage({
    super.key,
    this.selectedSkills = const [], // Default to an empty list
  });

  @override
  _TechnicianHomePageState createState() => _TechnicianHomePageState();
}

class _TechnicianHomePageState extends State<TechnicianHomePage> {
  // List of services with `serviceType`
  final List<Map<String, dynamic>> serviceList = [
    {
      "imagePath": 'assets/technician_electrician.png',
      "text": 'NEED ELECTRICIAN',
      "serviceType": "electrician",
    },
    {
      "imagePath": 'assets/technician_ac_mechanic.jpg',
      "text": 'NEED AC MECHANIC',
      "serviceType": "ac_mechanic",
    },
    {
      "imagePath": 'assets/technician_packers&movers.png',
      "text": 'NEED PACKERS & MOVERS',
      "serviceType": "packers_movers",
    },
    {
      "imagePath": 'assets/technician_carpenter.jpeg',
      "text": 'NEED CARPENTER',
      "serviceType": "carpenter",
    },
    {
      "imagePath": 'assets/technician_plumber.png',
      "text": 'NEED PLUMBER',
      "serviceType": "plumber",
    },
  ];

  late List<Map<String, dynamic>> _filteredServiceList;

  // Search query controller
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredServiceList = _getReorderedServiceList(widget.selectedSkills);
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // Reorder the service list based on selected skills
  List<Map<String, dynamic>> _getReorderedServiceList(
    List<String> selectedSkills,
  ) {
    final prioritizedServices = <Map<String, dynamic>>[];
    final remainingServices = <Map<String, dynamic>>[];

    for (final service in serviceList) {
      if (selectedSkills.any(
        (skill) => service["text"].toString().toLowerCase().contains(
          skill.toLowerCase(),
        ),
      )) {
        prioritizedServices.add(service); // Add to prioritized list
      } else {
        remainingServices.add(service); // Add to remaining list
      }
    }

    return [...prioritizedServices, ...remainingServices]; // Combine lists
  }

  // Handle search input changes
  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase().trim();
    setState(() {
      _filteredServiceList =
          _getReorderedServiceList(widget.selectedSkills).where((service) {
            final text = service["text"].toString().toLowerCase();
            return text.contains(query);
          }).toList();
    });
  }

  // Navigate to TechNeedService with `serviceType`
  void navigateToTechNeedService(BuildContext context, String serviceType) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TechNeedService(serviceType: serviceType),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "EXTRA HUSTLE",
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
                    children: const [
                      Text(
                        "Abuja, Nigeria",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_down, size: 16),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Image.asset("assets/msg_icon.png", width: 24, height: 24),
              onPressed: () {
                // Navigate to chat screen in the future
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TechChatIcon()),
                ); // Navigate to chat screen in the future
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _searchController,
                onChanged: (value) {
                  _onSearchChanged(); // Trigger search logic on text change
                },
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon:
                      _searchController.text.isNotEmpty
                          ? IconButton(
                            icon: const Icon(Icons.cancel, color: Colors.grey),
                            onPressed: () {
                              _searchController.clear(); // Clear the search bar
                              _onSearchChanged(); // Reset the filtered list
                            },
                          )
                          : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TechYourBookings(),
                          ),
                        );
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TechYourWallet(),
                          ),
                        );
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
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Technicians Required",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              if (_filteredServiceList.isEmpty)
                const Center(
                  child: Text(
                    "Service Unavailable",
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  ),
                )
              else
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _filteredServiceList.length,
                  itemBuilder: (context, index) {
                    final service = _filteredServiceList[index];
                    return Column(
                      children: [
                        ServiceCard(
                          imagePath: service["imagePath"],
                          text: service["text"],
                          onTap:
                              () => navigateToTechNeedService(
                                context,
                                service["serviceType"],
                              ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    );
                  },
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        onTap: (index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TechProfilePage()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TechNotifications(),
              ),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Alerts',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// ServiceCard Widget
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
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              imagePath,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(text, style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
