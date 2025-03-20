import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class TechEditProfilePage extends StatefulWidget {
  final String currentName;
  const TechEditProfilePage({super.key, required this.currentName});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<TechEditProfilePage> {
  late TextEditingController _nameController;
  String? selectedCity;
  String? selectedState;
  String? selectedCountry;
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  final List<String> availableSkills = [
    "Plumber",
    "Electrician",
    "Packers and Movers",
    "Carpenter",
    "AC Mechanic",
  ];
  List<String> selectedSkills = [];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.currentName);
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _showSkillSelectionDialog() {
    List<String> tempSelectedSkills = List.from(selectedSkills);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text("Select Skills"),
              content: SingleChildScrollView(
                child: Column(
                  children:
                      availableSkills.map((skill) {
                        return CheckboxListTile(
                          title: Text(skill),
                          value: tempSelectedSkills.contains(skill),
                          onChanged: (bool? value) {
                            setDialogState(() {
                              if (value == true) {
                                tempSelectedSkills.add(skill);
                              } else {
                                tempSelectedSkills.remove(skill);
                              }
                            });
                          },
                        );
                      }).toList(),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      selectedSkills = tempSelectedSkills;
                    });
                    Navigator.pop(context);
                  },
                  child: const Text("Done"),
                ),
              ],
            );
          },
        );
      },
    );
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
                child: GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        _imageFile != null
                            ? FileImage(_imageFile!)
                            : const AssetImage("assets/profile_pic.jpg")
                                as ImageProvider,
                  ),
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
              _buildTextField("MPIN", Icons.lock),

              // Skills Section
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Skills",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Wrap(
                spacing: 8.0,
                children:
                    selectedSkills.map((skill) {
                      return Chip(
                        label: Text(skill),
                        onDeleted: () {
                          setState(() {
                            selectedSkills.remove(skill);
                          });
                        },
                      );
                    }).toList(),
              ),
              TextButton(
                onPressed: _showSkillSelectionDialog,
                child: const Text("Edit Skills"),
              ),

              _buildTextField("Phone Number", Icons.phone),
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
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
      ),
    );
  }
}
