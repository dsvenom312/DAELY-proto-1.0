import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ExplorePagestate createState() => _ExplorePagestate();
}

class _ExplorePagestate extends State<ExplorePage> {
  // ignore: deprecated_member_use
  final databaseReference = FirebaseDatabase.instance.reference();
  List<String> _imageURLs = [];
  List<String> _userEmails = [];

  @override
  void initState() {
    super.initState();
    _fetchImageData();
  }

  Future<void> _fetchImageData() async {
    final dataSnapshot = await databaseReference.child('users').get();
    if (dataSnapshot.value != null) {
      final users = Map<String, dynamic>.from(
        dataSnapshot.value as Map<dynamic, dynamic>,
      );
      final imageUrls = <String>[];
      final userEmails = <String>[];

      users.forEach((key, value) {
        final userPhotos = value['photos'] as Map<dynamic, dynamic>?;
        if (userPhotos != null) {
          userPhotos.forEach((imageUID, imageData) {
            final imageUrl = imageData['image_url'] as String?;
            if (imageUrl != null) {
              imageUrls.add(imageUrl);
              userEmails.add(value['email'] as String);
            }
          });
        }
      });

      setState(() {
        _imageURLs = imageUrls;
        _userEmails = userEmails;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors
            .transparent, // set the app bar background color to transparent
        elevation: 0,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        itemCount: _imageURLs.length,
        itemBuilder: (BuildContext context, int index) {
          final imageUrl = _imageURLs[index];
          final userEmail = _userEmails[index];

          return GestureDetector(
            onTap: () {
              // Navigate to a new page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FullScreenImagePage(
                    imageUrl: imageUrl,
                    userEmail: userEmail,
                  ),
                ),
              );
            },
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}

class FullScreenImagePage extends StatelessWidget {
  final String imageUrl;
  final String userEmail;

  const FullScreenImagePage({
    super.key,
    required this.imageUrl,
    required this.userEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userEmail),
      ),
      body: Center(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
