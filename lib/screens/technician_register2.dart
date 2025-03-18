import 'package:flutter/material.dart';
import 'package:extra_cash_app/screens/home_page.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


class InputDesignScreen1 extends StatefulWidget {
  const InputDesignScreen1({Key? key}) : super(key: key);

  @override
  State<InputDesignScreen1> createState() => _InputDesignScreenState();
}

class _InputDesignScreenState extends State<InputDesignScreen1> {
  // Controllers to handle text input
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _ninController = TextEditingController();
  final TextEditingController _documentController = TextEditingController();

  // Store selected image
  String? _selectedImageName;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        // Convert to File
        _selectedImageName =
            image.name; // Use XFile's `.name` property for file name
      });
    }
  }

  Widget _buildDocumentUploadField() {
    return GestureDetector(
      onTap: _pickImage, // Open image picker
      child: Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.only(bottom: 13),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: const Color(0xFFE7E7E7),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            const Icon(Icons.attach_file, color: Colors.black),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                _selectedImageName ?? "Attach the Document",
                style: const TextStyle(
                  color: Color(0xFFA0A0A0),
                  fontFamily: 'Montserrat',
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final maxWidth =
                  constraints.maxWidth > 412 ? 412.0 : constraints.maxWidth;

              return Center(
                child: SizedBox(
                  width: maxWidth,
                  child: Stack(
                    children: [
                      // _buildStatusBar(),
                      // Positioned(bottom: 33, left: 33, child: _buildBackButton()),
                      _buildFormContent(maxWidth),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 40,
        left: 30,
        bottom: 10,
      ), // Add padding here

      child: Container(
        width: 37,
        height: 37,
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 16),

            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildFormContent(double maxWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 98, left: 31, right: 31),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // const Text(
          //   'Fill the Form to Continue',
          //   style: TextStyle(
          //     color: Colors.black,
          //     fontFamily: 'Montserrat',
          //     fontSize: 17,
          //     fontWeight: FontWeight.w700,
          //   ),
          //   textAlign: TextAlign.center,
          // ),
          const SizedBox(height: 13),

          // Input Fields
          _buildDobInputField(),
          _buildInputField('Enter Your Address', _addressController),
          _buildInputField('Enter Your Mobile', _mobileController),
          _buildInputField('Enter Your NIN', _ninController),
          _buildDocumentUploadField(), // Image Upload Field

         MouseRegion(
  cursor: SystemMouseCursors.click, // Hand cursor on hover
  child: GestureDetector(
    onTap: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    },
    child: Container(
      width: 194,
      height: 38,
      margin: const EdgeInsets.only(top: 43),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(6),
      ),
      alignment: Alignment.center,
      child: const Text(
        'Submit',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Montserrat',
          fontSize: 17,
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  ),
)

        ],
      ),
    );
  }

  Widget _buildInputField(String hintText, TextEditingController controller) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 13),
      padding: const EdgeInsets.symmetric(horizontal: 10),
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
      ),
    );
  }

  
Widget _buildDobInputField() {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.only(bottom: 13),
    padding: const EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
      color: const Color(0xFFE7E7E7),
      borderRadius: BorderRadius.circular(6),
    ),
    child: TextFormField(
      controller: _dobController,
      readOnly: true, // Prevent manual text entry
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Enter Your DOB',
        hintStyle: TextStyle(
          color: Color(0xFFA0A0A0),
          fontFamily: 'Montserrat',
          fontSize: 17,
          fontWeight: FontWeight.w700,
        ),
        suffixIcon: Icon(Icons.calendar_today, color: Colors.black), // Calendar icon
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now().subtract(const Duration(days: 365 * 18)), // Default to 18 years ago
          firstDate: DateTime(1900), // Earliest selectable date
          lastDate: DateTime.now(), // Cannot pick future dates
        );

        if (pickedDate != null) {
          String formattedDate =
              "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
          setState(() {
            _dobController.text = formattedDate; // Update the text field
          });
        }
      },
    ),
  );
}

  

  @override
  void dispose() {
    _dobController.dispose();
    _addressController.dispose();
    _mobileController.dispose();
    _ninController.dispose();
    _documentController.dispose();

    super.dispose();
  }
}
