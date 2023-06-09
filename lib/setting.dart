import 'package:flutter/material.dart';

class MySetting extends StatelessWidget {
  const MySetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('PROFILE PAGE'),
        backgroundColor: Colors.black,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.pink,
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
        currentIndex: 2, // Set the current index of the selected item
        onTap: (index) {
          // Navigate to the selected item's page using Navigator
          if (index == 1) {
            Navigator.pushNamed(context, '/swipe');
          } else if (index == 0) {
            Navigator.pushNamed(context, '/search');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/profile');
          }
        },
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20.0),
            child: Column(),
          ),
          const Expanded(
            child: Center(
              child: Text(
                'ini setting',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.pink,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
