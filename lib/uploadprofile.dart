import 'dart:io';

import 'package:daely_proto_11/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadProfilePage extends StatefulWidget {
  const UploadProfilePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UploadProfilePage createState() => _UploadProfilePage();
}

class _UploadProfilePage extends State<UploadProfilePage> {
  File? _image;
  final picker = ImagePicker();
  late DatabaseReference _userRef;

  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    _userRef = FirebaseDatabase.instance.reference().child('users');
  }

  Future<void> _pickImage() async {
    // ignore: deprecated_member_use
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _addImageToDatabase(String imageUrl, String email) {
    final currentUser = FirebaseAuth.instance.currentUser!;
    final uid =
        currentUser.email!.replaceAll('.', '_'); // Generate UID from email
    final imageRef = _userRef.child(uid).child('profile_photos');

    imageRef.remove().then((_) {
      // Previous photos removed successfully
      imageRef.push().set({
        'profile_url': imageUrl,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
        'email': email,
      }).then((_) {
        // Image added successfully to the database
        if (kDebugMode) {
          print('Image added successfully');
        }
      }).catchError((error) {
        // An error occurred while adding the image to the database
        if (kDebugMode) {
          print('Failed to add image to the database: $error');
        }
      });
    }).catchError((error) {
      // An error occurred while removing previous photos
      if (kDebugMode) {
        print('Failed to remove previous photos: $error');
      }
    });
  }

  Future<void> _uploadImage() async {
    if (_image != null) {
      final firebaseStorageRef = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('profile/${DateTime.now().millisecondsSinceEpoch}.jpg');

      final uploadTask = firebaseStorageRef.putFile(_image!);

      await uploadTask.whenComplete(() {});

      if (uploadTask.snapshot.state == firebase_storage.TaskState.success) {
        final downloadURL = await firebaseStorageRef.getDownloadURL();

        final currentUser = FirebaseAuth.instance.currentUser;
        if (currentUser != null) {
          final email = currentUser.email!;
          _addImageToDatabase(downloadURL, email);
        }

        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Success'),
            content: const Text('Image uploaded successfully.'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else {
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: const Text('Failed to upload image.'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Photo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200.0,
              height: 200.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: _image != null
                    ? Image.file(
                        _image!,
                        fit: BoxFit.cover,
                      )
                    : const Placeholder(), // Placeholder when no image is selected
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Select Image'),
            ),
            ElevatedButton(
              onPressed: () async {
                await _uploadImage();
                // ignore: use_build_context_synchronously
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ImageListPage()),
                );
              },
              child: const Text('Upload Image'),
            ),
          ],
        ),
      ),
    );
  }
}
