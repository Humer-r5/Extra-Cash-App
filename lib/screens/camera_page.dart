import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gal/gal.dart';
import 'camera_success.dart';
import 'home_page.dart';

class CameraApp extends StatefulWidget {
  const CameraApp({super.key});

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> with WidgetsBindingObserver {
  // Camera-related variables
  List<CameraDescription> cameras = [];
  CameraController? cameraController;

  // Image-related variables
  File? _selectedImage;
  final picker = ImagePicker();
  String? _selectedSkill;

  // Form-related variables
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _skillsController = TextEditingController();
  // final List<String> _selectedSkills = [];
  bool _isSkillsFieldTouched = false;
  bool _showSkillError = false;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (cameraController == null || cameraController?.value.isInitialized == false) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      cameraController?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _setupCameraController();
    }
  }

  @override
  void initState() {
    super.initState();
    _setupCameraController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildUI());
  }

  Widget _buildUI() {
    if (cameraController == null || cameraController?.value.isInitialized == false) {
      return const Center(child: CircularProgressIndicator());
    }
  return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                    (route) => false,
                  );
                },
              ),
              title: const Text(
                "Post your Issue",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            const SizedBox(height: 16),
              // Camera Preview or Selected Image
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.40,
              width: MediaQuery.sizeOf(context).width * 0.80,
              child:
                  _selectedImage == null
                      ? CameraPreview(cameraController!)
                      : Image.file(_selectedImage!, fit: BoxFit.cover),
            ),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Gallery Button with "Upload" Text
                Column(
                  children: [
                    IconButton(
                      onPressed: _pickImageFromGallery,
                      iconSize: 35,
                      icon: const Icon(Icons.image, color: Colors.blue),
                    ),
                    const Text(
                      'Upload',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                // Camera Button with "Capture" Text
                Column(
                  children: [
                    IconButton(
                      onPressed: () async {
                        XFile picture = await cameraController!.takePicture();
                        Gal.putImage(picture.path);
                        setState(() {
                          _selectedImage = File(
                            picture.path,
                          ); // Store the captured image
                        });
                      },
                      iconSize: 35,
                      icon: const Icon(Icons.camera, color: Colors.red),
                    ),
                    const Text(
                      'Capture',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Skills Input Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildSkillsInputField(),
            ),
            const SizedBox(height: 16),
            // Description Input Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Write more about the issue.......',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
            ),
            const SizedBox(height: 10),
            // Submit Button
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 22, 22, 22),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text('Submit', style: TextStyle(color: Colors.white,fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _setupCameraController() async {
   try {
      cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        cameraController = CameraController(
          cameras.first,
          ResolutionPreset.high,
        );
        await cameraController!.initialize();
        setState(() {});
      }
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  Future<void> _pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path); // Store the selected image
      });
    }
  }

  void _submitForm() {
    if (_selectedImage == null ||
        _skillsController.text.isEmpty ||
        _descriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields and select an image.')),
      );
      return;
    }

    // Handle the submission logic here
    print('Image Path: ${_selectedImage!.path}');
    print('Skills: ${_skillsController.text}');
    print('Description: ${_descriptionController.text}');

    // Clear the form after submission
    setState(() {
      _selectedImage = null;
      _skillsController.clear();
      _descriptionController.clear();
    });
  // If form is valid, navigate to success screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const CameraSuccessScreen()),
    );
  }


 Widget _buildSkillsInputField() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      GestureDetector(
        onTap: () {
          setState(() {
            _isSkillsFieldTouched = true; // Mark the field as touched
            _showSkillError = false; // Reset error when dialog opens
          });
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (context) => StatefulBuilder(
              builder: (context, setDialogState) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Select Your Technician',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Divider(),
                          _buildSkillRadio('Plumber', setDialogState),
                          _buildSkillRadio('Electrician', setDialogState),
                          _buildSkillRadio('Carpenter', setDialogState),
                          _buildSkillRadio('Packers & Movers', setDialogState),
                          _buildSkillRadio('AC Mechanic', setDialogState),
                          const SizedBox(height: 10),
                          // Display error message if no skill is selected
                          if (_showSkillError && _selectedSkill == null)
                            const Text(
                              'Please select a skill',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                              ),
                            ),
                          ElevatedButton(
                            onPressed: () {
                              if (_selectedSkill == null) {
                                // Show error if no skill is selected
                                setDialogState(() {
                                  _showSkillError = true;
                                });
                              } else {
                                setState(() {
                                  _skillsController.text = _selectedSkill!;
                                  _showSkillError = false; // Clear error on success
                                });
                                Navigator.pop(context);
                              }
                            },
                            child: const Text('Confirm'),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 3),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: const Color(0xFFE7E7E7),
            borderRadius: BorderRadius.circular(6),
          ),
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              _skillsController.text.isEmpty ? 'Select the Issue' : _skillsController.text,
              style: const TextStyle(
                color: Color(0xFFA0A0A0),
                fontFamily: 'Montserrat',
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
      // Display error message below the input field
      if (_skillsController.text.isEmpty && _isSkillsFieldTouched)
        const Padding(
          padding: EdgeInsets.only(top: 5, left: 10),
          child: Text(
            'This field is required',
            style: TextStyle(color: Colors.red, fontSize: 12),
          ),
        ),
    ],
  );
}

// Method to build RadioListTile for each skill
Widget _buildSkillRadio(String skill, Function setDialogState) {
  return RadioListTile<String>(
    title: Text(skill),
    value: skill,
    groupValue: _selectedSkill,
    onChanged: (value) {
      setDialogState(() {
        _selectedSkill = value; // Update the selected skill
      });
    },
  );

  }

  @override
  void dispose() {
    cameraController?.dispose();
    _skillsController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}