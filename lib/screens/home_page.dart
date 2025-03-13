import 'package:flutter/material.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePageContent(),
    Center(child: Text("Add Feature Coming Soon")),
    Center(child: Text("Alerts Coming Soon")),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
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

// Home Page Content
class HomePageContent extends StatefulWidget {
  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  final List<Map<String, String>> services = [
    {"title": "Plumber", "image": "assets/plumber.png"},
    {"title": "Electrician", "image": "assets/electrician.png"},
    {"title": "Carpenter", "image": "assets/carpenter.png"},
    {"title": "Packers & Movers", "image": "assets/packers&movers.png"},
    {"title": "AC Mechanic", "image": "assets/ac_mechanic.png"},
  ];

  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  final ScrollController _scrollController = ScrollController();

  void _scrollToService(int index) {
    _scrollController.animateTo(
      index * 200.0, // Assuming each card has a height of around 200
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

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
        controller: _scrollController,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),
            ),
            // Your Bookings and Your Wallet Side by Side
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  // Your Bookings
                  Expanded(
                    child: Card(
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/bookings.jpg",
                            fit: BoxFit.cover,
                            height: 120, // Adjust height as per your image
                            width: double.infinity,
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
                  SizedBox(width: 16), // Space between the two cards
                  // Your Wallet
                  Expanded(
                    child: Card(
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/wallet.jpg",
                            fit: BoxFit.cover,
                            height: 120, // Adjust height as per your image
                            width: double.infinity,
                          ),
                          Positioned.fill(
                            child: Center(
                              child: Text(
                                "Your Wallet",
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
                ],
              ),
            ),
            // Choose Service Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                final serviceTitle = services[index]["title"]!;
                if (_searchQuery.isEmpty ||
                    serviceTitle.toLowerCase().contains(
                      _searchQuery.toLowerCase(),
                    )) {
                  return GestureDetector(
                    onTap: () {
                      _scrollToService(index);
                    },
                    child: ServiceCard(
                      title: serviceTitle,
                      image: services[index]["image"]!,
                      onExplore: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => ServiceDetailPage(
                                  title: serviceTitle,
                                  image: services[index]["image"]!,
                                ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Container(); // Return an empty container if the service does not match the search query
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Service Card
class ServiceCard extends StatelessWidget {
  final String title, image;
  final VoidCallback onExplore;

  const ServiceCard({
    super.key,
    required this.title,
    required this.image,
    required this.onExplore,
  });

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
              onPressed: onExplore,
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

// Service Detail Page (Shows details of selected service)
class ServiceDetailPage extends StatelessWidget {
  final String title, image;

  const ServiceDetailPage({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              image,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Get Expert $title Services",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Professional $title services for all your needs. "
                    "Our skilled technicians ensure quality service and customer satisfaction.",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Active Technicians",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TechnicianCard(name: "TECHY 1"),
                  TechnicianCard(name: "TECHY 2"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Technician Card
class TechnicianCard extends StatelessWidget {
  final String name;

  const TechnicianCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage("assets/profile.png"),
        ),
        title: Text(name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("example@gmail.com"),
            Text("1901 Thornridge Cir, New York"),
          ],
        ),
        trailing: ElevatedButton(onPressed: () {}, child: const Text("View")),
      ),
    );
  }
}
