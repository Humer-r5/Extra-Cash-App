import 'package:flutter/material.dart';
import 'tech_need_service.dart'; // Import TechNeedService page
import 'tech_profile_page.dart';

class TechnicianHomePage extends StatelessWidget {
  TechnicianHomePage({super.key});

  final List<Map<String, dynamic>> serviceList = [
    {
      "imagePath": 'assets/technician_electrician.png',
      "text": 'NEED ELECTRICIAN',
      "onTap": () {}, // Existing function remains
    },
    {
      "imagePath": 'assets/technician_ac_mechanic.png',
      "text": 'NEED AC MECHANIC',
      "onTap": () {}, // Existing function remains
    },
    {
      "imagePath": 'assets/technician_packers&movers.png',
      "text": 'NEED PACKERS & MOVERS',
      "onTap": () {}, // Existing function remains
    },
    {
      "imagePath": 'assets/technician_carpenter.png',
      "text": 'NEED CARPENTER',
      "onTap": () {}, // Existing function remains
    },
    {
      "imagePath": 'assets/technician_plumber.png',
      "text": 'NEED PLUMBERS',
      "onTap": () {}, // Existing function remains
    },
  ];

  void navigateToTechNeedService(
    BuildContext context,
    VoidCallback existingFunction,
  ) {
    existingFunction(); // Execute existing function logic
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TechNeedService()),
    );
  }

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
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search',
                  filled: true,
                  fillColor: const Color.fromARGB(255, 241, 240, 240),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to Bookings Page
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
                        // Navigate to Wallet Page
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
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "TECHNICIANS REQUIRED",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ListView.builder(
                physics:
                    const NeverScrollableScrollPhysics(), // Disable scrolling for this ListView
                shrinkWrap: true, // Allow it to fit within the parent
                itemCount: serviceList.length,
                itemBuilder: (context, index) {
                  final service = serviceList[index];
                  return Column(
                    children: [
                      ServiceCard(
                        imagePath: service["imagePath"],
                        text: service["text"],
                        onTap:
                            () => navigateToTechNeedService(
                              context,
                              service["onTap"],
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
        currentIndex: 0, // Update dynamically if needed
        onTap: (index) {
          // if (index == 2) {
          // When Profile is tapped
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TechProfilePage()),
          );
        },
        //  else if (index == 1) {
        //     // When Dashboard is tapped
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => TechDashboardPage()),
        //     );
        //   }
        // },
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
