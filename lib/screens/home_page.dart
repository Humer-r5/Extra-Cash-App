import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> services = [
    {"title": "Plumber", "image": "assets/plumber.png"},
    {"title": "Electrician", "image": "assets/electrician.png"},
    {"title": "Carpenter", "image": "assets/carpenter.png"},
    {"title": "Packers & Movers", "image": "assets/packers&movers.png"},
    {"title": "AC Mechanic", "image": "assets/ac_mechanic.png"},
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background remains white
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("EXTRA CASH"),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Row(
              children: [Icon(Icons.location_on), Text("Abuja, Nigeria")],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200], // Light background for search
                ),
              ),
            ),
            // "Your Bookings" and "Your Wallet"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: FeatureCard(
                      title: "Your Bookings",
                      image: "assets/bookings.jpg",
                    ),
                  ),
                  const SizedBox(width: 16), // Added gap between the two
                  Expanded(
                    child: FeatureCard(
                      title: "Your Wallet",
                      image: "assets/wallet.jpg",
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Services List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Choose Service",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: services.length,
              itemBuilder: (context, index) {
                return ServiceCard(
                  title: services[index]["title"]!,
                  image: services[index]["image"]!,
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

// FeatureCard (Your Bookings & Your Wallet) - Styled like ServiceCard
class FeatureCard extends StatelessWidget {
  final String title, image;

  const FeatureCard({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          // Darkened Image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4), // Dark Overlay
                BlendMode.darken,
              ),
              child: Image.asset(
                image,
                width: double.infinity,
                height: 130,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Title on Image
          Positioned.fill(
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
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
    );
  }
}

// Service Card (Darkened Image + Title Overlay)
class ServiceCard extends StatelessWidget {
  final String title, image;

  const ServiceCard({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Stack(
            children: [
              // Darkened Image
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4), // Dark Overlay
                    BlendMode.darken,
                  ),
                  child: Image.asset(
                    image,
                    width: double.infinity,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Title Overlay
              Positioned.fill(
                child: Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
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
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {},
              child: const Text(
                "EXPLORE",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Bottom Navigation Bar (Black Icons)
class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.black, // Selected icon color
      unselectedItemColor: Colors.black, // Unselected icon color
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: "Alerts",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}
