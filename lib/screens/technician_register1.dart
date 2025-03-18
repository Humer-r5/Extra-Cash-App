import 'package:flutter/material.dart';
import 'package:extra_cash_app/screens/home_page.dart';
// import 'package:extra_cash_app/screens/technician_register2.dart';

class InputDesignScreen extends StatefulWidget {
  const InputDesignScreen({Key? key}) : super(key: key);

  @override
  State<InputDesignScreen> createState() => _InputDesignScreenState();
}

class AppTextStyles {
  static const String montserratFontFamily = 'Montserrat';
  static const String sfProFontFamily = 'SF Pro';

  // Status bar time
  static final TextStyle statusBarTime = TextStyle(
    fontFamily: sfProFontFamily,
    fontSize: 17,
    fontWeight: FontWeight.w600, // Approximating "590" weight
    color: AppColors.black,
    height: 1,
  );

  // Form title
  static final TextStyle formTitle = TextStyle(
    fontFamily: montserratFontFamily,
    fontSize: 17,
    fontWeight: FontWeight.w700,
    color: AppColors.titleText,
    height: 1,
  );

  // Input placeholder
  static final TextStyle inputPlaceholder = TextStyle(
    fontFamily: montserratFontFamily,
    fontSize: 17,
    fontWeight: FontWeight.w700,
    color: AppColors.placeholderText,
    height: 1,
  );

  // Selected skill
  static final TextStyle selectedSkill = TextStyle(
    fontFamily: montserratFontFamily,
    fontSize: 17,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    height: 1,
  );

  // Unselected skill
  static final TextStyle unselectedSkill = TextStyle(
    fontFamily: montserratFontFamily,
    fontSize: 17,
    fontWeight: FontWeight.w700,
    color: AppColors.placeholderText,
    height: 1,
  );
}

class AppColors {
  static const Color inputBackground = Color(0xFFE7E7E7);
  static const Color placeholderText = Color(0xFFA0A0A0);
  static const Color titleText = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
}

class _InputDesignScreenState extends State<InputDesignScreen> {
  // Controllers to handle text input
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _skillsController = TextEditingController();
  List<String> _selectedSkills = [];

  bool _showBackButton = false;
  

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
                    children: [_buildStatusBar(), _buildFormContent(maxWidth)],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildStatusBar() {
    return Container(
      height: 53,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // children: [
        //   const Text(
        //     '9:41',
        //     style: TextStyle(
        //       fontFamily: 'SF Pro',
        //       fontSize: 17,
        //       fontWeight: FontWeight.w600,
        //       color: Colors.black,
        //     ),
        //   ),
        //   const Row(
        //     children: [
        //       Icon(Icons.signal_cellular_4_bar),
        //       Icon(Icons.wifi),
        //       Icon(Icons.battery_full),
        //     ],
        //   ),
        // ],
      ),
    );
  }

  // Widget _buildSkills() {
  //   // Skills tags row
  //   return Container(
  //     margin: const EdgeInsets.only(top: 37),
  //     width: double.infinity,
  //     constraints: const BoxConstraints(maxWidth: 350),
  //     child: Row(
  //       children: [
  //         // Selected skill - Plumbing
  //         Container(
  //           decoration: BoxDecoration(
  //             color: Colors.black,
  //             borderRadius: BorderRadius.circular(6),
  //           ),
  //           padding: const EdgeInsets.fromLTRB(27, 11, 27, 11),
  //           child: Text('Plumbing', style: AppTextStyles.selectedSkill),
  //         ),
  //         const SizedBox(width: 10),
  //         // Unselected skill - Electricity
  //         Container(
  //           decoration: BoxDecoration(
  //             color: AppColors.inputBackground,
  //             borderRadius: BorderRadius.circular(6),
  //           ),
  //           padding: const EdgeInsets.fromLTRB(26, 11, 26, 11),
  //           child: Text('Electricity', style: AppTextStyles.unselectedSkill),
  //         ),
  //         const SizedBox(width: 10),
  //         Container(
  //           decoration: BoxDecoration(
  //             color: AppColors.inputBackground,
  //             borderRadius: BorderRadius.circular(6),
  //           ),
  //           padding: const EdgeInsets.fromLTRB(26, 11, 26, 11),
  //           child: Text('Carpenter', style: AppTextStyles.unselectedSkill),
  //         ),
  //         const SizedBox(width: 10),
  //         Container(
  //           decoration: BoxDecoration(
  //             color: AppColors.inputBackground,
  //             borderRadius: BorderRadius.circular(6),
  //           ),
  //           padding: const EdgeInsets.fromLTRB(26, 11, 26, 11),
  //           child: Text(
  //             'Packers & Movers',
  //             style: AppTextStyles.unselectedSkill,
  //           ),
  //         ),
  //         Container(
  //           decoration: BoxDecoration(
  //             color: AppColors.inputBackground,
  //             borderRadius: BorderRadius.circular(6),
  //           ),
  //           padding: const EdgeInsets.fromLTRB(26, 11, 26, 11),
  //           child: Text('AC Mechanics', style: AppTextStyles.unselectedSkill),
  //         ),
  //         const SizedBox(width: 10),
  //         // Add button
  //         Container(
  //           decoration: BoxDecoration(
  //             color: AppColors.inputBackground,
  //             borderRadius: BorderRadius.circular(6),
  //           ),
  //           padding: const EdgeInsets.fromLTRB(21, 8, 21, 22),
  //           child: Text('+', style: AppTextStyles.unselectedSkill),
  //         ),
  //       ],
  //     ),
  //   );
  // }

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
            // Navigator.push(
            //   context,
            //   // MaterialPageRoute(
            //   //   builder: (context) => const InputDesignScreen1(),
            //   // ),
            // );
          },
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
          _buildInputField('Enter Your Full Name', _nameController),
          _buildGenderInputField(),
          _buildInputField('Write Your Bio....', _bioController),
          _buildSkillsInputField(),
          // _buildSkills(),
          const SizedBox(height: 13),
          // if (_showForwardButton)
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
                  MaterialPageRoute(builder: (context) => const HomePage()),
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

  Widget _buildGenderInputField() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 13),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFE7E7E7),
        borderRadius: BorderRadius.circular(6),
      ),
      child: DropdownButtonFormField<String>(
        value: _genderController.text.isEmpty ? null : _genderController.text,
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
        items: const [
          DropdownMenuItem(value: 'Male', child: Text('Male')),
          DropdownMenuItem(value: 'Female', child: Text('Female')),
          DropdownMenuItem(value: 'Other', child: Text('Other')),
        ],
        onChanged: (value) {
          setState(() {
            _genderController.text = value!;
          });
        },
      ),
    );
  }

  Widget _buildSkillsInputField() {
    return GestureDetector(
      onTap: () {
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
                      width:
                          MediaQuery.of(context).size.width *
                          0.3, // 80% of screen width
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
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
                            _buildSkillCheckbox('Plumbing', setDialogState),
                            _buildSkillCheckbox('Electricity', setDialogState),
                            _buildSkillCheckbox('Carpenter', setDialogState),
                            _buildSkillCheckbox(
                              'Packers & Movers',
                              setDialogState,
                            ),
                            _buildSkillCheckbox('AC Mechanic', setDialogState),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _skillsController.text = _selectedSkills.join(
                                    ', ',
                                  );
                              _showBackButton = true; // Show Back Button when skill is selected

                                });
                                Navigator.pop(context);
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

  // Widget _buildSkillsInputField() {
  //   return Container(
  //     width: double.infinity,
  //     margin: const EdgeInsets.only(bottom: 3),
  //     padding: const EdgeInsets.symmetric(horizontal: 10),
  //     decoration: BoxDecoration(
  //       color: const Color(0xFFE7E7E7),
  //       borderRadius: BorderRadius.circular(6),
  //     ),
  //     child: DropdownButtonFormField<String>(
  //       value: _skillsController.text.isEmpty ? null : _skillsController.text,
  //       decoration: const InputDecoration(
  //         border: InputBorder.none,
  //         hintText: 'Add Your Skills',
  //         hintStyle: TextStyle(
  //           color: Color(0xFFA0A0A0),
  //           fontFamily: 'Montserrat',
  //           fontSize: 17,
  //           fontWeight: FontWeight.w700,
  //         ),
  //       ),
  //       items: const [
  //         DropdownMenuItem(value: 'Plumbing', child: Text('Plumbing')),
  //         DropdownMenuItem(value: 'Electrician', child: Text('Electrician')),
  //         DropdownMenuItem(value: 'Carpenter', child: Text('Carpenter')),
  //         DropdownMenuItem(
  //           value: 'Packers & Movers',
  //           child: Text('Packers & Movers'),
  //         ),
  //         DropdownMenuItem(value: 'AC Mechanic', child: Text('AC Mechanic')),
  //       ],
  //       onChanged: (value) {
  //         setState(() {
  //           _skillsController.text = value!;
  //           _showForwardButton = true; // Show Back Button when skill is selected
  //         });
  //       },
  //     ),
  //   );
  // }
  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    _skillsController.dispose();
    super.dispose();
  }
}