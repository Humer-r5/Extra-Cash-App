import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  final String currentName;
  const EditProfilePage({super.key, required this.currentName});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _nameController;

  String? selectedCity;
  String? selectedState;
  String? selectedCountry;

  final List<String> cities = [
    "New York",
    "Los Angeles",
    "Chicago",
    "Houston",
    "San Francisco",
  ];
  final List<String> states = [
    "Lagos",
    "Abuja",
    "California",
    "Texas",
    "Florida",
    "New York",
    "Illinois",
  ];
  final List<String> countries = [
    "Nigeria",
    "USA",
    "Canada",
    "UK",
    "Australia",
    "India",
  ];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.currentName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        backgroundColor: const Color.fromARGB(253, 242, 165, 49),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/profile_pic.jpg"),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildTextField("Full Name", Icons.person),
              _buildTextField(
                "User Name",
                Icons.person,
                controller: _nameController,
              ),
              _buildTextField("Email", Icons.email),
              _buildTextField("MPIN", Icons.visibility_off),
              _buildTextField("Phone Number", Icons.phone),

              // City & State Dropdowns in Row
              Row(
                children: [
                  Expanded(
                    child: _buildDropdown("City", cities, selectedCity, (
                      value,
                    ) {
                      setState(() {
                        selectedCity = value;
                      });
                    }),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildDropdown("State", states, selectedState, (
                      value,
                    ) {
                      setState(() {
                        selectedState = value;
                      });
                    }),
                  ),
                ],
              ),

              // Country Dropdown
              _buildDropdown("Country", countries, selectedCountry, (value) {
                setState(() {
                  selectedCountry = value;
                });
              }),

              _buildTextField("Address", Icons.location_on),
              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, _nameController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text(
                    "Confirm",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    IconData icon, {
    TextEditingController? controller,
    bool readOnly = false,
    String initialValue = "",
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        readOnly: readOnly,
        initialValue: controller == null ? initialValue : null,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
      ),
    );
  }

  Widget _buildDropdown(
    String label,
    List<String> items,
    String? selectedValue,
    ValueChanged<String?> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
        value: selectedValue,
        items:
            items.map((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
