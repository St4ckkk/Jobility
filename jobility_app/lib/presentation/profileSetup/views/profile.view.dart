import 'package:flutter/material.dart';
import '../../../core/assets/functions.dart';
import '../../../core/imports.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _disabilityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundImage(),
          Padding(
            padding: AppLayout.marginMedium,
            child: Column(
              children: [
                _buildBackButton(),
                Expanded(
                  child: _buildProfileForm(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackButton() {
    return Row(
      children: [
        IconButton(
          icon: Transform.scale(
            scale: 1.3,
            child: const Icon(Icons.arrow_back),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        AppLayout.spaceSmallWidth,
        Text(
          'Complete your Profile',
          style: AppTypography.buttonText.copyWith(
            color: AppColors.darkColor,
            fontWeight: FontWeight.w600,
            fontSize: 20.0,
          ),
        ),
      ],
    );
  }

  Widget _buildBackgroundImage() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetPaths.getImagePath('registration-cover.jpg')),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProfileForm() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 80.0),
            child: Column(
              children: [
                _buildProfilePicture(),
                const SizedBox(height: 20),
                _buildTextField(
                    _nameController, "Full Name", TextInputType.text),
                const SizedBox(height: 20),
                _buildDateField(),
                const SizedBox(height: 20),
                _buildPhoneField(),
                const SizedBox(height: 20),
                _buildGenderField(),
                const SizedBox(height: 20),
                _buildDisabilityField(),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
        _buildContinueButton(),
      ],
    );
  }

  Widget _buildProfilePicture() {
    return CircleAvatar(
      radius: 50,
      backgroundColor: Colors.grey[300],
      child: const Icon(Icons.person, size: 50, color: Colors.white),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText,
      TextInputType inputType) {
    return _buildInputField(
      controller: controller,
      hintText: hintText,
      inputType: inputType,
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    TextInputType? inputType,
  }) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: hintText,
        border: _inputBorder(),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: _inputBorder(color: AppColors.grayAccentColor),
        focusedBorder: _inputBorder(color: AppColors.primaryColor),
      ),
    );
  }

  OutlineInputBorder _inputBorder({Color? color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color ?? Colors.transparent),
      borderRadius: BorderRadius.circular(10.0),
    );
  }

  Widget _buildDateField() {
    return TextField(
      controller: _dobController,
      decoration: InputDecoration(
        hintText: "Date of Birth",
        suffixIcon: const Icon(Icons.calendar_today),
        border: _inputBorder(),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: _inputBorder(color: AppColors.grayAccentColor),
        focusedBorder: _inputBorder(color: AppColors.primaryColor),
      ),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (pickedDate != null) {
          setState(() {
            _dobController.text = pickedDate.toLocal().toString().split(' ')[0];
          });
        }
      },
    );
  }

  Widget _buildPhoneField() {
    return TextField(
      controller: _phoneController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        prefixIcon: _buildPhonePrefix(),
        hintText: "000 000 0000",
        border: _inputBorder(),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: _inputBorder(color: AppColors.grayAccentColor),
        focusedBorder: _inputBorder(color: AppColors.primaryColor),
      ),
    );
  }

  Widget _buildPhonePrefix() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(AssetPaths.getImagePath('flag_ph.png'),
              width: 24, height: 24),
          const SizedBox(width: 8),
          const Text("+63"),
        ],
      ),
    );
  }

  Widget _buildDisabilityField() {
    return _buildInputField(
        controller: _disabilityController, hintText: "Type of Disability");
  }

  Widget _buildGenderField() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: "Gender",
        border: _inputBorder(),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: _inputBorder(color: AppColors.grayAccentColor),
        focusedBorder: _inputBorder(color: AppColors.primaryColor),
      ),
      items: ["Male", "Female", "Other"].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (newValue) {
        // Handle gender selection
      },
    );
  }

  Widget _buildContinueButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: CustomButton(
        onPressed: () {
          print("Continue button pressed");
        },
        label: 'Continue',
        backgroundColor: AppColors.primaryColor,
        textColor: Colors.white,
      ),
    );
  }
}
