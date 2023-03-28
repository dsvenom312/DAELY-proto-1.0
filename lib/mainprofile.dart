import 'package:flutter/material.dart';
import 'package:daely_proto_11/setting.dart';
import 'package:daely_proto_11/explore.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PROFILE PAGE'),
        backgroundColor: Colors.black,
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.pink,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 2, // Set the current index of the selected item
        onTap: (index) {
          // Navigate to the selected item's page using Navigator
          if (index == 0) {
            Navigator.pushNamed(context, '/');
          } else if (index == 1) {
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
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assets/images/pic1.png'),
                ),
                SizedBox(height: 10.0),
                Text(
                  '@ACCOUNT',
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  'DESCRIPTIONS',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                'NO POST',
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
