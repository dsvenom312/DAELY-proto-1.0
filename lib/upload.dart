// ignore_for_file: library_private_types_in_public_api, deprecated_member_use, duplicate_ignore, use_build_context_synchronously

import 'dart:io';

import 'package:daely_proto_11/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  File? _image;
  final picker = ImagePicker();
  late DatabaseReference _userRef;
  final List<String> _morePhotosUrls = []; // Store additional photo URLs
  final List<Widget> _morePhotosPreviews =
      []; // Store additional photo previews

  final List<Color> _availableColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.white,
    Colors.black,
    Colors.grey,
    Colors.brown,
    Colors.yellow,
  ];
  Color? _selectedColor;

  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    _userRef = FirebaseDatabase.instance.reference().child('users');
  }

  Future<void> _pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _addImageToDatabase(
    String imageUrl,
    String email,
    List<String> morePhotosUrls,
  ) {
    final currentUser = FirebaseAuth.instance.currentUser!;
    final uid = currentUser.email!.replaceAll('.', '_');

    final imageRef = _userRef.child(uid).child('photos').push();
    imageRef.set({
      'image_url': imageUrl,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'email': email,
      'color': _selectedColor.toString(),
    }).then((_) {
      if (kDebugMode) {
        print('Image added successfully');
      }
    }).catchError((error) {
      if (kDebugMode) {
        print('Failed to add image to the database: $error');
      }
    });

    // Save the additional photo URLs separately
    final morePhotosRef = imageRef.child('more_photos_url');
    for (final url in morePhotosUrls) {
      morePhotosRef.push().set(url);
    }
  }

  Future<void> _uploadImage(String email) async {
    if (_image != null) {
      final firebaseStorageRef = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');

      final uploadTask = firebaseStorageRef.putFile(_image!);

      await uploadTask.whenComplete(() {});

      if (uploadTask.snapshot.state == firebase_storage.TaskState.success) {
        final downloadURL = await firebaseStorageRef.getDownloadURL();

        _addImageToDatabase(downloadURL, email,
            _morePhotosUrls); // Pass _morePhotosUrls as a parameter to _addImageToDatabase

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

  void _toggleColor(Color color) {
    setState(() {
      _selectedColor = color;
    });
  }

  Future<void> _pickMorePhotos() async {
    final pickedFiles = await picker.pickMultiImage();
    if (pickedFiles.isNotEmpty) {
      setState(() {
        _morePhotosUrls.clear();
        _morePhotosPreviews.clear();
      });
      for (final pickedFile in pickedFiles) {
        final file = File(pickedFile.path);
        final downloadURL = await _uploadMorePhoto(
            file); // Upload each photo to Firebase Storage
        if (downloadURL != null) {
          setState(() {
            _morePhotosUrls
                .add(downloadURL); // Store the download URL in the list
            _morePhotosPreviews.add(
              SizedBox(
                width: 50.0,
                height: 50.0,
                child: Image.network(downloadURL, fit: BoxFit.cover),
              ),
            );
          });
        }
      }
    }
  }

  Future<String?> _uploadMorePhoto(File photo) async {
    try {
      final firebaseStorageRef = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('more_photos/${DateTime.now().millisecondsSinceEpoch}.jpg');

      final uploadTask = firebaseStorageRef.putFile(photo);
      await uploadTask.whenComplete(() {});

      if (uploadTask.snapshot.state == firebase_storage.TaskState.success) {
        final downloadURL = await firebaseStorageRef.getDownloadURL();
        return downloadURL;
      }
    } catch (error) {
      if (kDebugMode) {
        print('Failed to upload more photo: $error');
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () async {
              final currentUser = FirebaseAuth.instance.currentUser;
              if (currentUser != null) {
                final email = currentUser.email!;
                await _uploadImage(email);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ImageListPage(),
                  ),
                );
              }
            },
            icon: const Icon(Icons.send),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 16.0),
            SizedBox(
              width: 200.0,
              height: 200.0,
              child: Container(
                color: _selectedColor ?? Colors.grey[300],
                child: _image != null
                    ? AspectRatio(
                        aspectRatio: 1.0,
                        child: Image.file(
                          _image!,
                          fit: BoxFit.cover,
                        ),
                      )
                    : const Icon(Icons.photo, size: 100.0),
              ),
            ),
            const SizedBox(height: 16.0),
            OutlinedButton(
              onPressed: _pickImage,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.image, color: Colors.white),
                  SizedBox(width: 8.0),
                  Text('Select Image', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Choose Color:',
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8.0,
              runSpacing: 8.0,
              children: _availableColors.map((color) {
                return GestureDetector(
                  onTap: () => _toggleColor(color),
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: _selectedColor == color
                          ? Border.all(color: Colors.white, width: 2.0)
                          : null,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16.0),
            OutlinedButton(
              onPressed: _pickMorePhotos,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.photo_library, color: Colors.white),
                  SizedBox(width: 8.0),
                  Text('Select More Photos',
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: _morePhotosPreviews,
            ),
          ],
        ),
      ),
    );
  }
}
