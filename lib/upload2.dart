// ignore_for_file: library_private_types_in_public_api, deprecated_member_use, use_build_context_synchronously

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoUploader extends StatefulWidget {
  const PhotoUploader({Key? key}) : super(key: key);

  @override
  _PhotoUploaderState createState() => _PhotoUploaderState();
}

class _PhotoUploaderState extends State<PhotoUploader> {
  final picker = ImagePicker();

  String _description = '';
  File? _mainImage;
  String? _mainImageUrl;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushNamed(context, '/search');
    } else if (index == 1) {
      Navigator.pushNamed(context, '/shop');
    } else if (index == 2) {
      Navigator.pushNamed(context, '/test');
    } else if (index == 3) {
      Navigator.pushNamed(context, '/inbox');
    } else if (index == 4) {
      Navigator.pushNamed(context, '/profile');
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  Future<void> _pickMainImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _mainImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadMainImage() async {
    if (_mainImage != null) {
      final mainImageRef = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');

      final mainUploadTask = mainImageRef.putFile(_mainImage!);

      await mainUploadTask;

      if (mainUploadTask.snapshot.state == firebase_storage.TaskState.success) {
        final mainDownloadURL = await mainImageRef.getDownloadURL();
        setState(() {
          _mainImageUrl = mainDownloadURL;
        });
      }
    }
  }

  void _addImageToDatabase() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && _mainImageUrl != null) {
      final email = currentUser.email!;
      final uid = email.replaceAll('.', '_');
      final userRef =
          FirebaseDatabase.instance.reference().child('users').child(uid);

      final mainImageRef = userRef.child('photos').push();
      final mainImageKey = mainImageRef.key;
      mainImageRef.set({
        'image_url': _mainImageUrl,
        'descriptions': _description,
      }).then((_) {
        if (mainImageKey != null) {
          final subPhotosRef = mainImageRef.child('sub_photos_url');
          final subPhotoKey = subPhotosRef.push().key;
          if (subPhotoKey != null) {
            subPhotosRef
                .child(subPhotoKey)
                .set(_mainImageUrl); // Use mainImageUrl as sub photo URL
          }
        }
        if (kDebugMode) {
          print('Image added successfully');
        }
      }).catchError((error) {
        if (kDebugMode) {
          print('Failed to add image to the database: $error');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              IconButton(
                onPressed: () async {
                  await _uploadMainImage();
                  _addImageToDatabase();
                  Navigator.pushNamed(
                      context, '/test'); // Navigate to the home screen
                },
                icon: Icon(Icons.send, color: Colors.grey[800]),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: SizedBox(
                    height: 150.0,
                    width: 150.0,
                    child: _mainImage != null
                        ? Image.file(_mainImage!, fit: BoxFit.cover)
                        : const Placeholder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _pickMainImage,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    'add photos',
                    style: TextStyle(color: Colors.grey[800]),
                  ),
                ),
                const SizedBox(height: 16.0),
                Theme(
                  data: ThemeData(
                    textSelectionTheme: const TextSelectionThemeData(
                      cursorColor: Colors.grey,
                    ),
                  ),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        _description = value;
                      });
                    },
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                    cursorColor: Colors.grey, // Cursor color
                    decoration: InputDecoration(
                      labelText: 'Description',
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey, // Border color
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey, // Border color on focus
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.grey[800], // Background color
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Transform.scale(
                scale: 1.8,
                child: const Icon(Icons.home),
              ),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.message_outlined),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
