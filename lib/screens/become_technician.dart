// import 'home_page.dart';// Import the Register Screen
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import './technician_home_page.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
// import 'technician_home_page.dart';

class InputDesignScreen extends StatefulWidget {
  const InputDesignScreen({super.key});

  @override
  _InputDesignScreenState createState() => _InputDesignScreenState();
}

class _InputDesignScreenState extends State<InputDesignScreen> {
  // Controllers for the first screen
  bool _isNameFieldTouched = false;
  bool _isGenderFieldTouched = false;
  bool _isBioFieldTouched = false;
  bool _isSkillsFieldTouched = false;
  bool _isDobFieldTouched = false;
  bool _isAddressFieldTouched = false;
  bool _isMobileFieldTouched = false;
  bool _isNinFieldTouched = false;
  bool _isDocumentFieldTouched = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _skillsController = TextEditingController();
  final List<String> _selectedSkills = [];

  // Controllers for the second screen
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _ninController = TextEditingController();
  final TextEditingController _documentController = TextEditingController();

  // State to manage which screen is currently visible
  bool _isFirstScreen = true;
  bool _showSkillError = false; // Add this flag
  String _dobErrorMessage = '';

  // Store selected image
  String? _selectedImageName;

  // Form key for validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                      _isFirstScreen
                          ? _buildFirstScreen(maxWidth)
                          : _buildSecondScreen(maxWidth),
                      _buildBackButton(),
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
              builder:
                  (context) => StatefulBuilder(
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
                                  'Select Your Skills',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Divider(),
                                _buildSkillCheckbox('Plumber', setDialogState),
                                _buildSkillCheckbox(
                                  'Electrician',
                                  setDialogState,
                                ),
                                _buildSkillCheckbox(
                                  'Carpenter',
                                  setDialogState,
                                ),
                                _buildSkillCheckbox(
                                  'Packers & Movers',
                                  setDialogState,
                                ),
                                _buildSkillCheckbox(
                                  'AC Mechanic',
                                  setDialogState,
                                ),
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
                                        _skillsController.text = _selectedSkills
                                            .join(', ');
                                        _showSkillError =
                                            false; // Clear error on success
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
                _skillsController.text.isEmpty
                    ? 'Add Your Skills'
                    : _skillsController.text,
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

  Widget _buildFirstScreen(double maxWidth) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(top: 98, left: 31, right: 31),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Fill the Form to Continue',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 13),
            // Input Fields
            _buildInputFieldName(
              'Enter Your Full Name',
              _nameController,
              _isNameFieldTouched,
            ),
            const SizedBox(height: 10), // Add space
            _buildGenderInputField(),
            const SizedBox(height: 10), // Add space
            _buildInputField(
              'Write Your Bio....',
              _bioController,
              _isBioFieldTouched,
            ),
            const SizedBox(height: 10), // Add space
            _buildSkillsInputField(), // Call the method here
            const SizedBox(height: 13),
            Positioned(bottom: 13, left: 33, child: _buildForwardButton()),
            const SizedBox(height: 10),
            // OR Divider
            const Text(
              "—— OR ——",
              style: TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 31, 30, 30),
              ),
            ),
            const SizedBox(height: 5),
            MouseRegion(
              cursor: SystemMouseCursors.click, // Hand cursor on hover
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => TechnicianHomePage(
                            selectedSkills:
                                [], // Pass an empty list if no skills are selected
                          ),
                    ),
                  );
                },
                child: Container(
                  width: 194,
                  height: 38,
                  margin: const EdgeInsets.only(top: 13),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Already Registered',
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecondScreen(double maxWidth) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(top: 98, left: 31, right: 31),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 13),
            // Input Fields
            _buildDobInputField(),
            const SizedBox(height: 10), // Add space
            _buildInputField(
              'Enter Your Address',
              _addressController,
              _isAddressFieldTouched,
            ),
            const SizedBox(height: 10), // Add space
            _buildInputFieldMobile(
              'Enter Your Mobile',
              _mobileController,
              _isMobileFieldTouched,
            ),
            const SizedBox(height: 10), // Add space
            _buildInputFieldNIN(
              'Enter Your NIN',
              _ninController,
              _isNinFieldTouched,
            ),
            const SizedBox(height: 10), // Add space
            _buildDocumentUploadField(), // Image Upload Field
            MouseRegion(
              cursor: SystemMouseCursors.click, // Hand cursor on hover
              child: GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate() &&
                      _dobController.text.isNotEmpty &&
                      _addressController.text.isNotEmpty &&
                      _mobileController.text.isNotEmpty &&
                      _ninController.text.isNotEmpty &&
                      _selectedImageName != null) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => TechnicianHomePage(
                              selectedSkills:
                                  _selectedSkills, // Pass selected skills here
                            ),
                      ),
                    );
                  } else {
                    setState(() {
                      _isDobFieldTouched = true;
                      _isAddressFieldTouched = true;
                      _isMobileFieldTouched = true;
                      _isNinFieldTouched = true;
                      _isDocumentFieldTouched = true;
                    });
                  }
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 30, bottom: 10),
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
              if (_isFirstScreen) {
                Navigator.pop(context);
              } else {
                setState(() {
                  _isFirstScreen = true;
                });
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildForwardButton() {
    return Container(
      width: 47,
      height: 47,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: IconButton(
          icon: const Icon(Icons.arrow_forward, color: Colors.white, size: 26),
          onPressed: () {
            // Validate the form and check if skills are selected
            if (_formKey.currentState!.validate() &&
                _nameController.text.isNotEmpty &&
                _genderController.text.isNotEmpty &&
                _bioController.text.isNotEmpty &&
                _skillsController.text.isNotEmpty) {
              setState(() {
                _isFirstScreen = false; // Navigate to the second screen
              });
            } else {
              setState(() {
                _isNameFieldTouched = true;
                _isGenderFieldTouched = true;
                _isBioFieldTouched = true;
                _isSkillsFieldTouched = true;
              });
            }
          },
        ),
      ),
    );
  }

  Widget _buildInputField(
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
            onChanged: (value) {
              // Mark the field as touched when the user starts typing
              setState(() {
                if (controller == _nameController) _isNameFieldTouched = true;
                if (controller == _bioController) _isBioFieldTouched = true;
                if (controller == _addressController) {
                  _isAddressFieldTouched = true;
                }
                if (controller == _mobileController) {
                  _isMobileFieldTouched = true;
                }
                if (controller == _ninController) _isNinFieldTouched = true;
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

  Widget _buildInputFieldName(
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
            onChanged: (value) {
              // Mark the field as touched when the user starts typing
              setState(() {
                if (controller == _nameController) _isNameFieldTouched = true;
              });
            },
            inputFormatters:
                controller == _nameController
                    ? [
                      FilteringTextInputFormatter.allow(
                        RegExp(
                          r'^[a-zA-Z ]+$',
                        ), // Allow only letters and spaces
                      ),
                    ]
                    : null,
            //     validator: (value) {
            //        final RegExp alphabeticRegex = RegExp(r'^[a-zA-Z ]+$');
            // if (!alphabeticRegex.hasMatch(value!)) {
            //   return 'Only alphabetic characters and spaces are allowed';
            // }
            //       return null;
            //     },
          ),
        ),
        // Display error message below the input field
        if (controller.text.isEmpty && isFieldTouched)
          const Padding(
            padding: EdgeInsets.only(top: 5, left: 10),
            child: Text(
              'This field is required / Only alphabets are allowed',
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }

  Widget _buildInputFieldMobile(
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
          padding: const EdgeInsets.symmetric(horizontal: 1),
          decoration: BoxDecoration(
            color: const Color(0xFFE7E7E7),
            borderRadius: BorderRadius.circular(6),
          ),
          child: IntlPhoneField(
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
            initialCountryCode: 'NG', // You can set a default country
            onChanged: (phone) {
              // Mark the field as touched when the user starts typing
              setState(() {
                if (controller == _mobileController) {
                  _isMobileFieldTouched = true;
                }
              });
              // print(phone.completeNumber); // Full phone number with country code
            },
            inputFormatters:
                controller == _mobileController
                    ? [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'^[0-9]+$'), // Allow only letters and spaces
                      ),
                    ]
                    : null,
            //     validator: (value) {
            //        final RegExp NumericRegex = RegExp(r'^[0-9]+$');
            // if (!NumericRegex.hasMatch(value!)) {
            //   return 'Only Numbers are allowed';
            // }
            //       return null;
            //     },
          ),
        ),
        // Display error message below the input field
        if (controller.text.isEmpty && isFieldTouched)
          const Padding(
            padding: EdgeInsets.only(top: 5, left: 10),
            child: Text(
              'This field is required / Only Numbers are allowed',
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }


  Widget _buildInputFieldNIN(
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
            onChanged: (value) {
              // Mark the field as touched when the user starts typing
              setState(() {
                if (controller == _ninController) _isNinFieldTouched = true;
              });
            },
            inputFormatters:
                controller == _ninController
                    ? [
                      FilteringTextInputFormatter.allow(
                        RegExp(
                          r'^[0-9 ]+$',
                        ), // Allow only letters and spaces
                      ),
                    ]
                    : null,
            //     validator: (value) {
            //        final RegExp alphabeticRegex = RegExp(r'^[a-zA-Z ]+$');
            // if (!alphabeticRegex.hasMatch(value!)) {
            //   return 'Only alphabetic characters and spaces are allowed';
            // }
            //       return null;
            //     },
          ),
        ),
        // Display error message below the input field
        if (controller.text.isEmpty && isFieldTouched)
          const Padding(
            padding: EdgeInsets.only(top: 5, left: 10),
            child: Text(
              'This field is required / Only numbers are allowed',
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }

  Widget _buildGenderInputField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 3),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: const Color(0xFFE7E7E7),
            borderRadius: BorderRadius.circular(6),
          ),
          child: DropdownButtonFormField<String>(
            value:
                _genderController.text.isEmpty ? null : _genderController.text,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Select Your Gender',
              hintStyle: TextStyle(
                color: Color(0xFFA0A0A0),
                fontFamily: 'Montserrat',
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
            style: const TextStyle(
              color: Color(0xFFA0A0A0),
              fontFamily: 'Montserrat',
              fontSize: 17,
              fontWeight: FontWeight.w900,
            ),
            items: const [
              DropdownMenuItem(
                value: 'Male',
                child: Text(
                  'Male',
                  style: TextStyle(
                    color: Color(0xFFA0A0A0),
                    fontFamily: 'Montserrat',
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              DropdownMenuItem(
                value: 'Female',
                child: Text(
                  'Female',
                  style: TextStyle(
                    color: Color(0xFFA0A0A0),
                    fontFamily: 'Montserrat',
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              DropdownMenuItem(
                value: 'Others',
                child: Text(
                  'Others',
                  style: TextStyle(
                    color: Color(0xFFA0A0A0),
                    fontFamily: 'Montserrat',
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
            onChanged: (value) {
              setState(() {
                _genderController.text = value!;
                _isGenderFieldTouched = true; // Mark the field as touched
              });
            },
          ),
        ),
        // Display error message below the input field
        if (_genderController.text.isEmpty && _isGenderFieldTouched)
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

  Widget _buildDobInputField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 3),
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
              suffixIcon: Icon(Icons.calendar_today, color: Colors.black),
            ),
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now().subtract(
                  const Duration(days: 365 * 18),
                ),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );

              if (pickedDate != null) {
                final now = DateTime.now();
                final age =
                    now.year -
                    pickedDate.year -
                    ((now.month < pickedDate.month ||
                            (now.month == pickedDate.month &&
                                now.day < pickedDate.day))
                        ? 1
                        : 0);

                if (age < 15) {
                  setState(() {
                    _dobController.text = ''; // Clear invalid DOB
                    _dobErrorMessage =
                        'User should be 15+ years'; // Display error
                  });
                } else {
                  setState(() {
                    _dobController.text =
                        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                    _dobErrorMessage = ''; // Clear error on valid input
                    _isDobFieldTouched = true; // Mark as touched
                  });
                }
              }
            },
          ),
        ),

        // Display error message if invalid DOB
        if ((_dobController.text.isEmpty && _isDobFieldTouched) ||
            _dobErrorMessage.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 10),
            child: Text(
              _dobErrorMessage.isNotEmpty
                  ? _dobErrorMessage
                  : 'This field is required',
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImageName = image.name;
      });
    }
  }

  Widget _buildDocumentUploadField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isDocumentFieldTouched = true; // Mark the field as touched
            });
            _pickImage(); // Open image picker
          },
          child: Container(
            width: double.infinity,
            height: 50,
            margin: const EdgeInsets.only(bottom: 3),
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
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
        // Display error message below the input field
        if (_selectedImageName == null && _isDocumentFieldTouched)
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

     @override
  void dispose() {
    _nameController.dispose();
    _genderController.dispose();
    _bioController.dispose();
    _skillsController.dispose();
    _dobController.dispose();
    _addressController.dispose();
    _mobileController.dispose();
    _ninController.dispose();
    _documentController.dispose();
    super.dispose();
  }
}