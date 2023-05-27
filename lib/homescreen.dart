import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ImageListPage extends StatefulWidget {
  const ImageListPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ImageListPageState createState() => _ImageListPageState();
}

class _ImageListPageState extends State<ImageListPage> {
  // ignore: deprecated_member_use
  final databaseReference = FirebaseDatabase.instance.reference();
  List<String> _imageURLs = [];
  List<String> _userEmails = [];
  int _currentIndex = 0;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _fetchImageData();
  }

  void _onItemTapped(int index) {
    if (index == 2) {
      // Navigate to Profile page on index 2
      Navigator.pushNamed(context, '/profile');
    } else if (index == 0) {
      Navigator.pushNamed(context, '/search');
    } else if (index == 1) {
      Navigator.pushNamed(context, '/upload');
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
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
        _currentIndex = 0; // Reset the current index
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors
            .transparent, // set the app bar background color to transparent
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: _imageURLs.length,
              controller: PageController(initialPage: _currentIndex),
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                final imageUrl = _imageURLs[index];
                final userEmail = _userEmails[index];

                return GestureDetector(
                  onTap: () {
                    // Handle tap on the image
                  },
                  child: Stack(
                    children: [
                      Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                      Positioned.fill(
                        child: Container(
                          padding: const EdgeInsets.only(top: 650, left: 20),
                          alignment: Alignment.topLeft,
                          child: Text(
                            userEmail,
                            style: const TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent, // Change the color to black
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_upload_outlined, color: Colors.black),
            label: 'upload',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
