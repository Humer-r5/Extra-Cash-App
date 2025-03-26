import 'package:extra_cash_app/screens/register_page.dart';
import 'package:flutter/material.dart';
import '../widgets/technician_card.dart';
// import 'guest_book.dart';
import 'technician_details_screen.dart';
import '../data/technician_dummy_data.dart';
import 'service_card.dart';

class GuestHomePage extends StatefulWidget {
  const GuestHomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<GuestHomePage> {
  int _selectedIndex = 0;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const HomePageContent(),
      _buildAuthGate(
        icon: Icons.add_circle_outline,
        title: "Post your Problem",
        description:
            "Our experts will help you find a quick and reliable solution",
        buttonText: "Login/Register",
      ),
      _buildAuthGate(
        icon: Icons.notifications_active,
        title: "Your Alerts",
        description: "View your notifications and messages",
        buttonText: "Login/Register",
      ),
      _buildAuthGate(
        icon: Icons.account_circle,
        title: "Your Profile",
        description: "Manage your account and bookings",
        buttonText: "Continue to Profile",
      ),
    ];
  }

  Widget _buildAuthGate({
    required IconData icon,
    required String title,
    required String description,
    required String buttonText,
  }) {
    return Builder(
      builder: (context) {
        return Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 50, color: Colors.black), // Reduced size
                  const SizedBox(height: 20),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22, // Slightly reduced
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                    child: Text(
                      buttonText,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  // const SizedBox(height: 12),
                  // TextButton(
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => const RegisterScreen(),
                  //       ),
                  //     );
                  //   },
                  //   child: const Text(
                  //     "Already have an account? Sign In",
                  //     style: TextStyle(fontSize: 14),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

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
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 24),
            activeIcon: Icon(Icons.home, size: 24),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline, size: 24),
            activeIcon: Icon(Icons.add_circle, size: 24),
            label: "Post issue",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined, size: 24),
            activeIcon: Icon(Icons.notifications, size: 24),
            label: "Alerts",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined, size: 24),
            activeIcon: Icon(Icons.person, size: 24),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

// Home Page Content remains the same as your original
class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

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
      index * 200.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _showAuthDialog(BuildContext context, String featureName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Access $featureName"),
          content: Text(
            "Please login or register to access $featureName features",
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterScreen(),
                  ),
                );
              },
              child: const Text(
                "Continue",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("EXTRA CASH", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const Text(
                    //   "Current Location",
                    //   style: TextStyle(fontSize: 12, color: Colors.grey),
                    // ),
                    // Row(
                    //   children: [
                    //     const Text(
                    //       "Abuja, Nigeria",
                    //       style: TextStyle(fontSize: 14, color: Colors.black),
                    //     ),
                    //     const Icon(Icons.keyboard_arrow_down, size: 16),
                    //   ],
                    // ),
                  ],
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    _showAuthDialog(context, "Login/Register");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Black button color
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text("Login/Register"),
                ),
              ],
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
                  suffixIcon:
                      _searchQuery.isNotEmpty
                          ? IconButton(
                            icon: const Icon(Icons.cancel, color: Colors.grey),
                            onPressed: () {
                              _searchController.clear();
                              setState(() {
                                _searchQuery = '';
                              });
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const GuestHomePage(),
                                ),
                                (route) => false,
                              );
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
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _showAuthDialog(context, "Bookings");
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
                                    color: Colors.white,
                                    shadows: const [
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
                        _showAuthDialog(context, "Wallet");
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
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    shadows: const [
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
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: const Align(
                alignment: Alignment.center,
                child: Text("Choose Service", style: TextStyle(fontSize: 18)),
              ),
            ),

            if (services.every(
              (service) =>
                  !service["title"]!.toLowerCase().contains(
                    _searchQuery.toLowerCase(),
                  ),
            ))
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Service Unavailable",
                  style: TextStyle(fontSize: 16, color: Colors.red),
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
                                  showAuthDialog: _showAuthDialog,
                                ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
class ServiceDetailPage extends StatelessWidget {
  final String title, image;
  final Function(BuildContext, String)? showAuthDialog;

  const ServiceDetailPage({
    super.key,
    required this.title,
    required this.image,
    this.showAuthDialog,
  });

  @override
  Widget build(BuildContext context) {
    // Fetch technicians dynamically based on service title
    final List<Map<String, dynamic>> technicians =
        techniciansData[title.trim()] ?? [];

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
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                  const SizedBox(height: 8),

                  // Dynamically Render Technicians
                  if (technicians.isNotEmpty)
                    Column(
                      children: technicians.map((tech) {
                        return TechnicianCard(
                          name: tech["name"] ?? "Unknown",
                          email: tech["email"] ?? "No Email Available",
                          location: tech["location"] ?? "No Location Available",
                          bio: tech["bio"] ?? "No Bio Available",
                          onViewTap: () {
                            if (showAuthDialog != null) {
                              // Show authentication prompt for guests
                              showAuthDialog!(context, "Booking");
                            } else {
                              // Navigate to Technician Details for logged-in users
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TechnicianDetailsScreen(
                                    name: tech["name"] ?? "Unknown",
                                    email: tech["email"] ?? "No Email Available",
                                    location: tech["location"] ?? "No Location Available",
                                    bio: tech["bio"] ?? "No Bio Available",
                                    price: tech["price"] ?? 0.0, // Correct price from data
                                    appointmentDate: tech["appointmentDate"] ?? "N/A",
                                    appointmentTime: tech["appointmentTime"] ?? "N/A",
                                  ),
                                ),
                              );
                            }
                          },
                        );
                      }).toList(),
                    )
                  else
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "No technicians available for this service.",
                          style: TextStyle(color: Colors.red, fontSize: 16),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
