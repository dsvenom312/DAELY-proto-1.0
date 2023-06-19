import 'package:daely_proto_11/setting.dart';
import 'package:daely_proto_11/uploadprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class PhotoListPage extends StatefulWidget {
  const PhotoListPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PhotoListPageState createState() => _PhotoListPageState();
}

class _PhotoListPageState extends State<PhotoListPage> {
  late String _userEmail;
  late DatabaseReference _photosRef;
  late DatabaseReference _userPhotosRef;

  List<String> _photoUrls = [];
  List<String> _profilephotoUrls = [];

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    _userEmail = user?.email ?? '';
    final uid = _userEmail.replaceAll('.', '_');
    // ignore: deprecated_member_use
    _photosRef = FirebaseDatabase.instance
        // ignore: deprecated_member_use
        .reference()
        .child('users')
        .child(uid)
        .child('photos');
    _photosRef.onValue.listen((snapshot) {
      final photosData = snapshot.snapshot.value as Map<dynamic, dynamic>?;
      if (photosData != null) {
        setState(() {
          _photoUrls = photosData.entries
              .map((entry) => entry.value['image_url'] as String)
              .toList();
        });
      } else {
        setState(() {
          _photoUrls = [];
        });
      }
    });

    _userPhotosRef = FirebaseDatabase.instance
        // ignore: deprecated_member_use
        .reference()
        .child('users')
        .child(uid)
        .child('profile_photos');

    _userPhotosRef.onValue.listen((snapshot) {
      final userphotosData = snapshot.snapshot.value as Map<dynamic, dynamic>?;
      if (userphotosData != null) {
        setState(() {
          _profilephotoUrls = userphotosData.entries
              .map((entry) => entry.value['profile_url'] as String)
              .toList();
        });
      } else {
        setState(() {
          _profilephotoUrls = [];
        });
      }
    });
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
    }
    // else if (index == 4) {
    //   Navigator.pushNamed(context, '/profile');
    // }
    else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              // Navigate to MySetting page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MySetting()),
              );
            },
            icon: const Icon(Icons.more_vert), // Triple dot icon
          ),
        ],
      ),
      backgroundColor: Colors.black, // Set background color to black
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(
                    _profilephotoUrls.isNotEmpty ? _profilephotoUrls[0] : '',
                  ),
                ),
                Positioned(
                  right: -8.0,
                  bottom: -8.0,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UploadProfilePage(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.photo_camera,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Text(
              _userEmail,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: _photoUrls.length,
              itemBuilder: (BuildContext context, int index) {
                final photoUrl = _photoUrls[index];
                return Image.network(photoUrl, fit: BoxFit.cover);
              },
            ),
          ),
        ],
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
