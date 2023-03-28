import 'package:flutter/material.dart';
import 'package:daely_proto_11/setting.dart';

// class ExplorePage extends StatelessWidget {
//   const ExplorePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('EXPLORE'),
//         backgroundColor: Colors.black,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.settings),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const MySetting()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: GridView.count(
//         crossAxisCount: 2,
//         mainAxisSpacing: 8.0,
//         crossAxisSpacing: 8.0,
//         padding: const EdgeInsets.all(8.0),
//         children: <Widget>[
//           Image.asset('assets/images/pic1.png', width: 100, height: 100),
//           Image.asset('assets/images/pic1.png', width: 100, height: 100),
//           Image.asset('assets/images/pic1.png', width: 100, height: 100),
//           Image.asset('assets/images/pic1.png', width: 100, height: 100),
//           Image.asset('assets/images/pic1.png', width: 100, height: 100),
//           Image.asset('assets/images/pic1.png', width: 100, height: 100),
//           Image.asset('assets/images/pic1.png', width: 100, height: 100),
//           Image.asset('assets/images/pic1.png', width: 100, height: 100),
//           Image.asset('assets/images/pic1.png', width: 100, height: 100),
//           Image.asset('assets/images/pic1.png', width: 100, height: 100),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.grey,
//         selectedItemColor: Colors.black, //error
//         selectedLabelStyle: const TextStyle(color: Colors.black), //error
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.inbox,
//                 color: Colors
//                     .black), // inbox chat button disini ---------------------------------------------
//             label: 'Inbox',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home,
//                 color: Colors
//                     .black), // Home button disini ----------------------------------------------
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person, color: Colors.black),

//             // Profile button disini ----------------------------------------------
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ExplorePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.pushNamed(context, '/home');
    }
    if (index == 2) {
      // Navigate to Profile page on index 2
      Navigator.pushNamed(context, '/profile');
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
        title: const Text('EXPLORE'),
        backgroundColor: Colors.black, // Change the color to blue
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          Image.asset('assets/images/pic1.png', width: 100, height: 100),
          Image.asset('assets/images/pic1.png', width: 100, height: 100),
          Image.asset('assets/images/pic1.png', width: 100, height: 100),
          Image.asset('assets/images/pic1.png', width: 100, height: 100),
          Image.asset('assets/images/pic1.png', width: 100, height: 100),
          Image.asset('assets/images/pic1.png', width: 100, height: 100),
          Image.asset('assets/images/pic1.png', width: 100, height: 100),
          Image.asset('assets/images/pic1.png', width: 100, height: 100),
          Image.asset('assets/images/pic1.png', width: 100, height: 100),
          Image.asset('assets/images/pic1.png', width: 100, height: 100),
        ],
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
