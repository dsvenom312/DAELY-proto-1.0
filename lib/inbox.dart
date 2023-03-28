import 'package:daely_proto_11/mainprofile.dart';
import 'package:daely_proto_11/explore.dart';
import 'package:daely_proto_11/main.dart';
import 'package:flutter/material.dart';

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
      Navigator.pushNamed(context, '/home');
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DAELY'),
        backgroundColor: Colors.black, // Change the color to black
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
            icon: Icon(Icons.inbox, color: Colors.pink),
            label: 'Inbox',
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
