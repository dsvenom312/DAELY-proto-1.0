// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final databaseReference = FirebaseDatabase.instance.reference();
  List<String> _imageURLs = [];
  List<String> _userEmails = [];
  List<String> _filteredURLs = [];
  int _selectedIndex = 0;

  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _fetchImageData();
  }

  void _onItemTapped(int index) {
    if (index == 0) {
      // Navigate to Profile page on index 2
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
        _filteredURLs = imageUrls;
      });
    }
  }

  void _filterByDescription(String searchTerm) {
    if (searchTerm.isNotEmpty) {
      final filteredURLs = <String>[];
      for (int i = 0; i < _imageURLs.length; i++) {
        final imageUrl = _imageURLs[i];

        final dataSnapshot = databaseReference
            .child('users')
            .orderByChild('photos/image_url')
            .equalTo(imageUrl)
            .limitToFirst(1);
        dataSnapshot.once().then((DataSnapshot snapshot) {
              final users = Map<String, dynamic>.from(
                  snapshot.value as Map<dynamic, dynamic>);
              users.forEach((key, value) {
                final userPhotos = value['photos'] as Map<dynamic, dynamic>?;
                if (userPhotos != null) {
                  userPhotos.forEach((imageUID, imageData) {
                    final description =
                        imageData['descriptions'] as String? ?? '';
                    if (description.contains(searchTerm)) {
                      filteredURLs.add(imageUrl);
                    }
                  });
                }
              });

              setState(() {
                _filteredURLs = filteredURLs;
              });
            } as FutureOr Function(DatabaseEvent value));
      }
    } else {
      setState(() {
        _filteredURLs = _imageURLs;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: TextField(
          controller: _searchController,
          onChanged: (searchTerm) {
            _filterByDescription(searchTerm);
          },
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: '...',
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
          ),
          itemCount: _filteredURLs.length,
          itemBuilder: (BuildContext context, int index) {
            final imageUrl = _filteredURLs[index];
            final userEmail = _userEmails[index];

            return GestureDetector(
              onTap: () {
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
    );
  }
}

class FullScreenImagePage extends StatelessWidget {
  final String imageUrl;
  final String userEmail;

  const FullScreenImagePage({
    Key? key,
    required this.imageUrl,
    required this.userEmail,
  }) : super(key: key);

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
