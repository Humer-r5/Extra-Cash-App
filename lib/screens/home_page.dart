import 'package:flutter/material.dart';
import 'profile_page.dart'; // Import Profile Page

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // List of pages for navigation
  final List<Widget> _pages = [
    HomePageContent(),
    Center(child: Text("Add Feature Coming Soon")),
    Center(child: Text("Alerts Coming Soon")),
    const ProfilePage(), // Profile Page
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Change screen based on selected tab
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Alerts",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

// Extracted HomePage Content
class HomePageContent extends StatelessWidget {
  final List<Map<String, String>> services = [
    {"title": "Plumber", "image": "assets/plumber.png"},
    {"title": "Electrician", "image": "assets/electrician.png"},
    {"title": "Carpenter", "image": "assets/carpenter.png"},
    {"title": "Packers & Movers", "image": "assets/packers&movers.png"},
    {"title": "AC Mechanic", "image": "assets/ac_mechanic.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  fillColor: Colors.grey[500],
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
                  const SizedBox(width: 16),
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
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
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
    );
  }
}

// FeatureCard (Your Bookings & Your Wallet)
class FeatureCard extends StatelessWidget {
  final String title, image;

  const FeatureCard({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                image,
                width: double.infinity,
                height: 130,
                fit: BoxFit.cover,
              ),
            ),
          ),
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

// Service Card
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
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4),
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
