import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gal/gal.dart';

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
   File? image;
  final picker = ImagePicker();

  // Form-related variables
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _skillsController = TextEditingController();
  final List<String> _selectedSkills = [];
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
            // Camera Preview or Selected Image
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.30,
              width: MediaQuery.sizeOf(context).width * 0.80,
              child: _selectedImage == null
                  ? CameraPreview(cameraController!)
                  : Image.file(_selectedImage!, fit: BoxFit.cover),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 // Gallery Button
                IconButton(
                  onPressed: _pickImageFromGallery,
                  iconSize: 30,
                  icon: const Icon(Icons.image, color: Colors.blue),
                ),
                // Camera Button
                IconButton(
                  onPressed: () async {
                    XFile picture = await cameraController!.takePicture();
                    Gal.putImage(picture.path);
                    setState(() {
                      _selectedImage = File(picture.path); // Store the captured image
                    });
                  },
                  iconSize: 30,
                  icon: const Icon(Icons.camera, color: Colors.red),
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
            const SizedBox(height: 16),
            // Submit Button
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 22, 22, 22),
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
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    } else {
      print('No image selected from gallery.');
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

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Form submitted successfully!')),
    );
  }

  Widget buildInputField(
    String hintText,
    TextEditingController controller,
    bool isFieldTouched,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 3),
              padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: const Color(0xFFE7E7E7),
            borderRadius: BorderRadius.circular(6),
          ),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Color(0xFFA0A0A0),
                fontFamily: 'Montserrat',
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
            onChanged: (value) {
              setState(() {
              });
            },
          ),
        ),
        // Display error message below the input field
        if (controller.text.isEmpty && isFieldTouched)
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
                              'Select the Issue',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Divider(),
                            _buildSkillCheckbox('Plumbing', setDialogState),
                            _buildSkillCheckbox('Electrician', setDialogState),
                            _buildSkillCheckbox('Carpenter', setDialogState),
                            _buildSkillCheckbox('Packers & Movers', setDialogState),
                            _buildSkillCheckbox('AC Mechanic', setDialogState),
                            const SizedBox(height: 10),
                            // Display error message if no skill is selected
                            if (_showSkillError && _selectedSkills.isEmpty)
                              const Text(
                                'Please select at least one skill',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                ),
                              ),
                            ElevatedButton(
                              onPressed: () {
                                if (_selectedSkills.isEmpty) {
                                  // Show error if no skill is selected
                                  setDialogState(() {
                                    _showSkillError = true;
                                  });
                                } else {
                                  setState(() {
                                    _skillsController.text = _selectedSkills.join(', ');
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

  Widget _buildSkillCheckbox(String skill, Function setDialogState) {
    return CheckboxListTile(
      title: Text(skill),
      value: _selectedSkills.contains(skill),
      onChanged: (isSelected) {
        setDialogState(() {
          if (isSelected == true) {
            _selectedSkills.add(skill);
          } else {
            _selectedSkills.remove(skill);
          }
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