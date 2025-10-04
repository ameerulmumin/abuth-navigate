import 'dart:io';

import 'package:a_b_u_t_h_navigate/pages/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class EditProfileScreen extends StatefulWidget {
  final Userf user;

  EditProfileScreen({required this.user});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  String updatedName = '';
  String updatedPhotoUrl = '';

  @override
  void initState() {
    super.initState();
    nameController.text = widget.user.name;
    updatedName = widget.user.name;
    updatedPhotoUrl = widget.user.photoUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () async {
              final uid = FirebaseAuth.instance.currentUser?.uid;
              if (uid != null) {
                final userDoc = FirebaseFirestore.instance
                    .collection('REGISTERED_USERS')
                    .doc(uid);

                // Create a map with updated user data
                final Map<String, dynamic> updatedUserData = {
                  'name': updatedName,
                  // 'photoUrl': updatedPhotoUrl,
                };

                try {
                  // Update user data in Firestore
                  await userDoc.update(updatedUserData);

                  // If the user's profile picture has changed, upload the new photo to Firebase Storage
                  if (updatedPhotoUrl != widget.user.photoUrl) {
                    // Implement the logic to upload the new photo to Firebase Storage here
                    // You can use Firebase Storage methods for this purpose
                  }

                  // Navigate back to the previous screen
                  Navigator.of(context).pop();
                } catch (e) {
                  // Handle errors, e.g., display a Snackbar or show an error message
                  print('Error updating profile: $e');
                  // You can add error handling UI feedback here
                }
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture
            GestureDetector(
              onTap: () async {
                final picker = ImagePicker();
                final pickedFile =
                    await picker.pickImage(source: ImageSource.gallery);

                if (pickedFile != null) {
                  final file = File(pickedFile.path);

                  // Generate a unique file name (e.g., using the uuid package)
                  final uniqueFileName = Uuid().v4();

                  final storageRef = FirebaseStorage.instance
                      .ref()
                      .child('profile_pictures/$uniqueFileName.jpg');
                  final uploadTask = storageRef.putFile(file);

                  await uploadTask.whenComplete(() async {
                    final imageUrl = await storageRef.getDownloadURL();

                    setState(() {
                      updatedPhotoUrl =
                          imageUrl; // Update the selected picture URL
                    });
                  });
                }
              },
              child: CircleAvatar(
                radius: 64,
                backgroundImage: updatedPhotoUrl != null
                    ? Image(
                        image: NetworkImage(updatedPhotoUrl!),
                        fit: BoxFit.cover, // Adjust the fit as needed
                      ).image
                    : AssetImage('assets/images/default_profile_picture.png'),
              ),
            ),
            SizedBox(height: 16.0),
            // Name Text Field
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
              onChanged: (value) {
                setState(() {
                  updatedName = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
