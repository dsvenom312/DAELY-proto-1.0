// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';

// class UploadPage extends StatefulWidget {
//   const UploadPage({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _UploadPageState createState() => _UploadPageState();
// }

// class _UploadPageState extends State<UploadPage> {
//   File? _image;
//   final picker = ImagePicker();

//   Future<void> _pickImage() async {
//     // ignore: deprecated_member_use
//     final pickedFile = await picker.getImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//     }
//   }

//   Future<void> _uploadImage() async {
//     if (_image != null) {
//       final firebaseStorageRef = firebase_storage.FirebaseStorage.instance
//           .ref()
//           .child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');

//       final uploadTask = firebaseStorageRef.putFile(_image!);

//       // Wait for the upload to complete
//       await uploadTask.whenComplete(() {});

//       if (uploadTask.snapshot.state == firebase_storage.TaskState.success) {
//         final downloadURL = await firebaseStorageRef.getDownloadURL();

//         final currentUser = FirebaseAuth.instance.currentUser;
//         if (currentUser != null) {
//           final uid = currentUser.uid;

//           final userRef =
//               // ignore: deprecated_member_use
//               FirebaseDatabase.instance.reference().child('users/$uid');

//           // Update the user's data in the database with the download URL
//           userRef.update({'imageURL': downloadURL});
//         }

//         // ignore: use_build_context_synchronously
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: const Text('Success'),
//             content: const Text('Image uploaded successfully.'),
//             actions: [
//               ElevatedButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: const Text('OK'),
//               ),
//             ],
//           ),
//         );
//       } else {
//         // Handle the upload failure
//         // ignore: use_build_context_synchronously
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: const Text('Error'),
//             content: const Text('Failed to upload image.'),
//             actions: [
//               ElevatedButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: const Text('OK'),
//               ),
//             ],
//           ),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Upload Photo'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               width: 200.0,
//               height: 200.0,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(8.0),
//                 child: _image != null
//                     ? Image.file(
//                         _image!,
//                         fit: BoxFit.cover,
//                       )
//                     : const Placeholder(), // Placeholder when no image is selected
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: _pickImage,
//               child: const Text('Select Image'),
//             ),
//             ElevatedButton(
//               onPressed: _uploadImage,
//               child: const Text('Upload Image'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:daely_proto_11/swipeabletest.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
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

  void _addImageToDatabase(String imageUrl) {
    final currentUser = FirebaseAuth.instance.currentUser!;
    final uid = currentUser.uid;

    _userRef.child(uid).child('photos').push().set({
      'image_url': imageUrl,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
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
  }

  Future<void> _uploadImage() async {
    if (_image != null) {
      final firebaseStorageRef = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');

      final uploadTask = firebaseStorageRef.putFile(_image!);

      // Wait for the upload to complete
      await uploadTask.whenComplete(() {});

      if (uploadTask.snapshot.state == firebase_storage.TaskState.success) {
        final downloadURL = await firebaseStorageRef.getDownloadURL();

        _addImageToDatabase(downloadURL);

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
        // Handle the upload failure
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
                      builder: (context) => const SwipeableImagePage()),
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
