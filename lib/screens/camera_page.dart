import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:torch_controller/torch_controller.dart';

class CameraApp extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> with WidgetsBindingObserver {
  CameraController? _controller;
  late Future<void> _initializeControllerFuture;
  late List<CameraDescription> _cameras;
  File? _image;
  final picker = ImagePicker();
  bool _isVideoMode = false;
  // bool _isTorchOn = false; // Track flashlight state

  @override
  void initState() {
    super.initState();
    _setupCamera();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = _controller;
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _setupCamera();
    }
  }

  Future<void> _setupCamera() async {
    _cameras = await availableCameras();
    final firstCamera = _cameras.first;
    _controller = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller!.initialize();
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _takePicture() async {
    try {
      await _initializeControllerFuture;
      final image = await _controller!.takePicture();
// Get the app's documents directory
    final appDir = await getApplicationDocumentsDirectory(); // Or getExternalStorageDirectory()
    final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg'; // Unique filename
    final savedImage = File('${appDir.path}/$fileName');

    // Copy the image to the desired location
    await File(image.path).copy(savedImage.path);

      setState(() {
        _image = savedImage;
      });

      print('Image saved to: ${savedImage.path}'); // Optional: Print the path
    } catch (e) {
      print('Error taking or saving picture: $e');
    }
  }

  Future<void> _pickImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected from gallery.');
      }
    });
  }

  void _confirmImage() {
    if (_image != null) {
      print("Image confirmed: ${_image!.path}");
      setState(() {
        _image = null;
      });
    }
  }

// void _toggleFlashlight() async {
//   try {
//     await TorchController().toggle(); // Use toggle()
//     setState(() {
//       _isTorchOn = !_isTorchOn;
//     });
//   } catch (e) {
//     print('Error toggling flashlight: $e');
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Stack(
                children: [
                  Positioned.fill(child: CameraPreview(_controller!)),
                  if (_image != null) Positioned.fill(child: Image.file(_image!, fit: BoxFit.cover)),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: _buildBottomBar(),
                  ),
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.image, color: Colors.white, size: 30),
                onPressed: _pickImageFromGallery,
              ),
              GestureDetector(
                onTap: _takePicture,
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.flash_on, color: Colors.white, size: 30),
                onPressed: () {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _isVideoMode = true;
                  });
                },
                child: Text('Video', style: TextStyle(color: _isVideoMode ? Colors.white : Colors.grey, fontSize: 18)),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _isVideoMode = false;
                  });
                },
                child: Text('Photo', style: TextStyle(color: _isVideoMode ? Colors.grey : Colors.white, fontSize: 18)),
              ),
              IconButton(
                icon: Icon(Icons.check, color: Colors.white, size: 30),
                onPressed: _confirmImage,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(home: CameraApp()));
}