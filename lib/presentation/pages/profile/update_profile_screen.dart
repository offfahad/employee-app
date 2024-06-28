import 'dart:io';

import 'package:employee/const.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  File? _pickedImage;
  Uint8List webImage = Uint8List(8);
  String? imageUrl;
  bool isUpdating = false;

  // Future<void> _pickImage() async {
  //   if (!kIsWeb) {
  //     final ImagePicker _picker = ImagePicker();
  //     XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  //     if (image != null) {
  //       var selected = File(image.path);
  //       setState(() {
  //         _pickedImage = selected;
  //       });
  //     } else {
  //       print('No image has been picked');
  //     }
  //   } else if (kIsWeb) {
  //     final ImagePicker _picker = ImagePicker();
  //     XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  //     if (image != null) {
  //       var f = await image.readAsBytes();
  //       setState(() {
  //         webImage = f;
  //         _pickedImage = File('a');
  //       });
  //     } else {
  //       print('No image has been picked');
  //     }
  //   } else {
  //     print('Something went wrong');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                // -- IMAGE with ICON
                Stack(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "assets/images/userBlue.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: primaryColor,
                        ),
                        child: IconButton(
                          icon: const Icon(IconlyLight.camera,
                              color: Colors.white),
                          onPressed: () {
                            //_pickImage();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // -- Form Fields
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        //controller: email,
                        enabled: false,
                        decoration: const InputDecoration(
                          border: const OutlineInputBorder(),
                          label: Text("Email"),
                          prefixIcon:
                              Icon(IconlyBold.message, color: primaryColor),
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !value.contains("@") ||
                              !value.contains(".com")) {
                            return 'Email field cannot be empty!';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        //controller: fullname,
                        decoration: const InputDecoration(
                          border: const OutlineInputBorder(),
                          label: Text("Full Name"),
                          prefixIcon: Icon(
                            IconlyBold.user2,
                            color: primaryColor,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Name field cannot be empty!';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 10),
                      TextFormField(
                        //controller: phoneNo,
                        decoration: const InputDecoration(
                          label: Text(
                            "Phone Number",
                          ),
                          prefixIcon:
                              Icon(IconlyBold.call, color: primaryColor),
                          border: const OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Phone number field cannot be empty!';
                          }
                          // Check if the value starts with a "+"
                          if (!value.startsWith('+')) {
                            return 'Phone number must start with a "+" sign!';
                          }

                          // Remove non-digit characters from the value
                          String digitsOnly =
                              value.replaceAll(RegExp(r'\D'), '');

                          // Check if the number of digits is exactly 12
                          if (digitsOnly.length != 12) {
                            return 'Phone number must have exactly 12 digits after the "+" sign!';
                          }

                          // Return null if all checks pass
                          return null;
                        },
                      ),

                      const SizedBox(height: 10),
                      TextFormField(
                        //controller: fullname,
                        decoration: const InputDecoration(
                          border: const OutlineInputBorder(),
                          label: Text("Address"),
                          prefixIcon: Icon(
                            IconlyBold.location,
                            color: primaryColor,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Address field cannot be empty!';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      // -- Form Submit Button
                      SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () async {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            side: BorderSide.none,
                            shape: const StadiumBorder(),
                          ),
                          child: const Text(
                            "Update",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
