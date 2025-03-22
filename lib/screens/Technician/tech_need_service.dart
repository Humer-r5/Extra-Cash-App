import 'package:flutter/material.dart';
import 'tech_issue_detail_page.dart';

class TechNeedService extends StatefulWidget {
  final String serviceType;

  const TechNeedService({super.key, required this.serviceType});

  @override
  _TechNeedServiceState createState() => _TechNeedServiceState();
}

class _TechNeedServiceState extends State<TechNeedService> {
  late List<Map<String, dynamic>> issues;

  final Map<String, List<Map<String, dynamic>>> serviceIssues = {
   "electrician": [
      {
        "image": "assets/electrician/elec-1.jpg",
        "title": "Power Failure in Apartment",
        "name": "John Edison",
        "email": "john.edison@gmail.com",
        "address": "456 Park Avenue, CA"
      },
      {
        "image": "assets/electrician/elec-2.jpg",
        "title": "Short Circuit in Office",
        "name": "Emma Clarke",
        "email": "emma.clarke@gmail.com",
        "address": "789 Broadway, TX"
      },
      {
        "image": "assets/electrician/elec-3.jpg",
        "title": "Fuse Box Replacement",
        "name": "James Bolton",
        "email": "james.bolton@gmail.com",
        "address": "123 Main Street, NY"
      },
      {
        "image": "assets/electrician/elec-4.jpg",
        "title": "Lighting Installation",
        "name": "Sophia Miller",
        "email": "sophia.miller@gmail.com",
        "address": "205 Ocean Drive, LA"
      },
      {
        "image": "assets/electrician/elec-5.jpg",
        "title": "Faulty Wiring Issue",
        "name": "David Johnson",
        "email": "david.johnson@gmail.com",
        "address": "300 Mountain View, SF"
      },
    ],
    "plumber": [
      {
        "image": "assets/plumber/plumb-1.jpg",
        "title": "Bathroom Leak Repair",
        "name": "Olivia Carter",
        "email": "olivia.carter@gmail.com",
        "address": "111 Pine Street, FL"
      },
      {
        "image": "assets/plumber/plumb-2.jpg",
        "title": "Broken Pipe Fix",
        "name": "William Green",
        "email": "william.green@gmail.com",
        "address": "500 Oak Lane, TX"
      },
      {
        "image": "assets/plumber/plumb-3.jpg",
        "title": "Kitchen Sink Clogged",
        "name": "Lucy Adams",
        "email": "lucy.adams@gmail.com",
        "address": "222 Maple Road, NY"
      },
      {
        "image": "assets/plumber/plumb-4.jpg",
        "title": "Sewer Line Blockage",
        "name": "Henry Ford",
        "email": "henry.ford@gmail.com",
        "address": "55 River Drive, LA"
      },
      {
        "image": "assets/plumber/plumb-5.jpg",
        "title": "Toilet Flush Not Working",
        "name": "Amelia Roberts",
        "email": "amelia.roberts@gmail.com",
        "address": "789 Ocean Boulevard, SF"
      },
    ],
    "ac_mechanic": [
      {
        "image": "assets/ac_mechanic/ac-1.jpg",
        "title": "AC Not Cooling",
        "name": "Ryan Scott",
        "email": "ryan.scott@gmail.com",
        "address": "12 Central Avenue, NY"
      },
      {
        "image": "assets/ac_mechanic/ac-2.jpg",
        "title": "Strange Noise from AC",
        "name": "Chloe Turner",
        "email": "chloe.turner@gmail.com",
        "address": "45 Grand Street, TX"
      },
      {
        "image": "assets/ac_mechanic/ac-3.jpg",
        "title": "Refrigerant Leak Issue",
        "name": "Jack Hamilton",
        "email": "jack.hamilton@gmail.com",
        "address": "987 Broadway Road, LA"
      },
      {
        "image": "assets/ac_mechanic/ac-4.jpg",
        "title": "Compressor Not Working",
        "name": "Sophia White",
        "email": "sophia.white@gmail.com",
        "address": "321 Palm Drive, CA"
      },
      {
        "image": "assets/ac_mechanic/ac-5.jpg",
        "title": "Thermostat Malfunction",
        "name": "Lucas Brown",
        "email": "lucas.brown@gmail.com",
        "address": "741 Skyline Road, SF"
      },
    ],
  };

  @override
  void initState() {
    super.initState();
    issues = serviceIssues[widget.serviceType] ?? [];
  }

  void removeIssue(Map<String, dynamic> issue) {
    setState(() {
      issues.remove(issue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "${widget.serviceType.toUpperCase()} Requests",
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: issues.isEmpty
            ? const Center(
                child: Text(
                  "No Hustles available for you.",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.72, // Adjusted ratio for better fit
                ),
                itemCount: issues.length,
                itemBuilder: (context, index) {
                  final issue = issues[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TechIssueDetailPage(
                            issue: issue,
                            onDecline: () => removeIssue(issue),
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 65,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                              child: Image.asset(
                                issue["image"],
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 35,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Text(
                                      issue["title"],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Flexible(
                                    child: Text(
                                      issue["name"],
                                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      issue["email"],
                                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      issue["address"],
                                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
