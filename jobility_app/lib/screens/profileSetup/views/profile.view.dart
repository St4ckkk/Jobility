import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

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
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _skillsController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _educationController = TextEditingController();

  XFile? _image;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = pickedImage;
        print('Image selected: ${_image?.path}');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundImage(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildBackButton(),
                Expanded(
                  child: _buildProfileForm(),
                ),
                _buildSaveButton(),
              ],
            ),
          ),
        ],
      ),
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

  Widget _buildBackButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back, size: 28),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        const SizedBox(width: 10),
        const Text(
          'Complete your Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ],
    );
  }

  Widget _buildProfileForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
      child: Column(
        children: [
          _buildProfilePicture(),
          const SizedBox(height: 20),
          CustomTextFormField(
            controller: _nameController,
            labelText: "Full Name",
          ),
          const SizedBox(height: 20),
          _buildDateField(),
          const SizedBox(height: 20),
          _buildPhoneField(),
          const SizedBox(height: 20),
          _buildGenderField(),
          const SizedBox(height: 20),
          CustomTextFormField(
            controller: _disabilityController,
            labelText: "Disability",
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            controller: _addressController,
            labelText: "Address",
          ),
          const SizedBox(height: 20),
          _buildSkillsField(),
          const SizedBox(height: 20),
          _buildEducationFields(), // Updated to use a method for education fields
          const SizedBox(height: 20),
          _buildExperienceField(), // Updated to use a method for experience field
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildEducationFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Education",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        CustomTextFormField(
          controller: _educationController,
          labelText: "Primary Education",
        ),
        const SizedBox(height: 20),
        CustomTextFormField(
          controller: _educationController,
          labelText: "Secondary Education",
        ),
        const SizedBox(height: 20),
        CustomTextFormField(
          controller: _educationController,
          labelText: "Tertiary Education",
        ),
      ],
    );
  }

  Widget _buildExperienceField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Experience",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        CustomTextFormField(
          controller: _experienceController,
          labelText: "Work Experience (e.g., Internship, Job Title)",
          maxLines: 3, // Allow multiple lines for experience description
          keyboardType: TextInputType.multiline,
        ),
      ],
    );
  }

  Widget _buildProfilePicture() {
    return Center(
      child: GestureDetector(
        onTap: _pickImage,
        child: Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.primaryColor,
              width: 2,
            ),
            image: DecorationImage(
              image: _image != null
                  ? kIsWeb
                      ? NetworkImage(_image!.path)
                      : FileImage(File(_image!.path)) as ImageProvider
                  : AssetImage(AssetPaths.getImagePath('profile.png')),
              fit: BoxFit.cover,
            ),
          ),
          child: _image == null
              ? const Icon(
                  Icons.camera_alt,
                  size: 40,
                  color: AppColors.darkColor,
                )
              : null,
        ),
      ),
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
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: hintText,
        border: _inputBorder(),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: _inputBorder(),
        focusedBorder: _inputBorder(color: Colors.blue),
      ),
    );
  }

  OutlineInputBorder _inputBorder({Color? color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color ?? Colors.grey),
      borderRadius: BorderRadius.circular(8.0),
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
        enabledBorder: _inputBorder(),
        focusedBorder: _inputBorder(color: Colors.blue),
      ),
      readOnly: true,
      onTap: () async {
        final DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );

        if (pickedDate != null) {
          setState(() {
            _dobController.text =
                "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
          });
        }
      },
    );
  }

  Widget _buildPhonePrefix() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(
            image: AssetImage(AssetPaths.getImagePath('flag_ph.png')),
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 8),
          const Text("+63"),
        ],
      ),
    );
  }

  Widget _buildPhoneField() {
    return CustomTextFormField(
      controller: _phoneController,
      labelText: "Phone Number",
      keyboardType: TextInputType.phone,
      prefixIcon: _buildPhonePrefix(),
    );
  }

  Widget _buildSkillsField() {
    return TextFormField(
      controller: _skillsController,
      decoration: InputDecoration(
        hintText: "Skills (e.g., Programming, Design)",
        border: _inputBorder(),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: _inputBorder(),
        focusedBorder: _inputBorder(color: Colors.blue),
      ),
      maxLines: 3, 
      keyboardType: TextInputType.multiline,
    );
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

  Widget _buildDisabilityField() {
    return _buildInputField(
      controller: _disabilityController,
      hintText: "Disability",
      inputType: TextInputType.text,
    );
  }

  Widget _buildSaveButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: CustomButton(
        onPressed: () {
          print("Save button pressed");
        },
        label: 'Save',
        backgroundColor: AppColors.primaryColor,
        textColor: Colors.white,
      ),
    );
  }
}
