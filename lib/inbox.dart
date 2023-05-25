import 'package:flutter/material.dart';
import 'package:daely_proto_11/setting.dart';

// ignore: depend_on_referenced_packages

class MyInboxPage extends StatefulWidget {
  const MyInboxPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyInboxPageState createState() => _MyInboxPageState();
}

class _MyInboxPageState extends State<MyInboxPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 2) {
      // Navigate to Profile page on index 2
      Navigator.pushNamed(context, '/profile');
    } else if (index == 1) {
      Navigator.pushNamed(context, '/swipe');
    } else if (index == 0) {
      Navigator.pushNamed(context, '/search');
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('DAELY'),
        backgroundColor: Colors.black, // Change the color to black
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MySetting()),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black, // Change the color to black
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.pink),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.pink),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.pink),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
