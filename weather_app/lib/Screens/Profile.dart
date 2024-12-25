import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // To work with the image file

import '../Components/NavBar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _image; // Store the image file
  final ImagePicker _picker = ImagePicker();

  // Form controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Update the image file
      });
    }
  }

  // Function to show the image in full screen
  void _viewImage() {
    if (_image != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: const Text("Full Image"),
            ),
            body: Center(
              child: Image.file(_image!),
            ),
          ),
        ),
      );
    }
  }

  // Function to show the popup menu
  void _showImageOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey[900],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (BuildContext context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.remove_red_eye, color: Colors.white),
              title: const Text("View Image", style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context); // Close the bottom sheet
                _viewImage(); // Show the image in full screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.white),
              title: const Text("Remove Image", style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context); // Close the bottom sheet
                setState(() {
                  _image = null; // Remove the image
                });
              },
            ),
          ],
        );
      },
    );
  }

  // Updated save function without error messages
  void _saveForm() {
    final name = _nameController.text;
    final location = _locationController.text;

    // Save the name and location without any validation
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Name: $name, Location: $location saved successfully!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Dismiss the keyboard when tapping anywhere outside
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          title: const Padding(
            padding: EdgeInsets.only(left: 7),
            child: Text(
              "Profile",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.05), // Responsive padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none, // Allows icon to overflow
                        children: [
                          GestureDetector(
                            onTap: _showImageOptions, // Show options on tap
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                              child: CircleAvatar(
                                radius: screenWidth * 0.2, // Responsive image size
                                backgroundColor: Colors.white70,
                                backgroundImage: _image != null
                                    ? FileImage(_image!) // Show the selected image
                                    : null,
                                child: _image == null // If no image is selected
                                    ? const Icon(
                                  Icons.person,
                                  size: 50,
                                  color: Colors.white,
                                )
                                    : null,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 5, // Position the camera icon below the circle
                            right: 5, // Adjust the position horizontally
                            child: GestureDetector(
                              onTap: _pickImage,
                              child: const Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10), // Add some spacing
                      const Text(
                        "Lakshan", // Replace with the desired name
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Form Inputs
                      TextField(
                        controller: _nameController,
                        style: const TextStyle(color: Colors.white, fontSize: 18), // Increased font size
                        decoration: InputDecoration(
                          labelText: "Name",
                          labelStyle: const TextStyle(color: Colors.white, fontSize: 16), // Adjusted label font size
                          filled: true,
                          fillColor: Colors.grey[800],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15), // Adjusted padding
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        controller: _locationController,
                        style: const TextStyle(color: Colors.white, fontSize: 18), // Increased font size
                        decoration: InputDecoration(
                          labelText: "Location",
                          labelStyle: const TextStyle(color: Colors.white, fontSize: 16), // Adjusted label font size
                          filled: true,
                          fillColor: Colors.grey[800],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15), // Adjusted padding
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Save Button
                      SizedBox(
                        width: screenWidth * 0.3, // Responsive width
                        child: ElevatedButton(
                          onPressed: _saveForm,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01), // Responsive vertical padding
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            "Save",
                            style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const NavBar(),
      ),
    );
  }
}
