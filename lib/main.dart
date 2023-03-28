import 'package:daely_proto_11/inbox.dart';
import 'package:daely_proto_11/mainprofile.dart';
import 'package:daely_proto_11/explore.dart';

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.pink,
//       ),
//       home: const MySearchBar(),
//     );
//   }
// }

// void handleButtonPress(BuildContext context) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => const MyProfileMain()),
//   );
// }

// class MySearchBar extends StatelessWidget {
//   const MySearchBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text('DAELY'),
//         actions: <Widget>[
//           Padding(
//             padding: const EdgeInsets.only(right: 20.0),
//             child: IconButton(
//               icon: const Icon(Icons.search),
//               onPressed: () {
//                 // Handle search icon tap
//               },
//             ),
//           ),
//         ],
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/images/pic1.png'), //pic profile example
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   Text('@ACCOUNT',
//                       style: TextStyle(fontSize: 18.0, color: Colors.pink)),
//                   SizedBox(height: 10.0),
//                   Text('DESCRIPTIONS',
//                       style: TextStyle(fontSize: 12.0, color: Colors.pink)),
//                 ],
//               ),
//               FloatingActionButton(
//                 //follow button disini ---------------------------------------------------
//                 onPressed: () {
//                   // Handle "+" button tap
//                 },
//                 child: const Icon(Icons.add),
//               ),
//             ],
//           ),
//         ),
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

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DAELY',
      home: const MyHomePage(),
      routes: {
        '/profile': (context) => const MyProfilePage(),
        '/search': (context) => const ExplorePage(),
        '/home': (context) => const MyHomePage(),
        '/inbox': (context) => const MyInboxPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 2) {
      // Navigate to Profile page on index 2
      Navigator.pushNamed(context, '/profile');
    } else if (index == 0) {
      Navigator.pushNamed(context, '/inbox');
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
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pic1.png'), //pic profile example
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('@ACCOUNT',
                      style: TextStyle(fontSize: 18.0, color: Colors.pink)),
                  SizedBox(height: 10.0),
                  Text('DESCRIPTIONS',
                      style: TextStyle(fontSize: 12.0, color: Colors.pink)),
                ],
              ),
              FloatingActionButton(
                backgroundColor: Colors.black, // Change the color to blue
                //follow button disini ---------------------------------------------------
                onPressed: () {
                  // Handle "+" button tap
                },
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ),
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

// class MyProfilePage extends StatelessWidget {
//   const MyProfilePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('DAELY'),
//         backgroundColor: Colors.black,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.settings),
//             onPressed: () {
//               // Add your onPressed function here
//             },
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.black,
//         unselectedItemColor: Colors.grey,
//         selectedItemColor: Colors.pink,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: 'Search',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//         currentIndex: 2, // Set the current index of the selected item
//         onTap: (index) {
//           // Navigate to the selected item's page using Navigator
//           if (index == 0) {
//             Navigator.pushNamed(context, '/');
//           } else if (index == 1) {
//             Navigator.pushNamed(context, '/search');
//           } else if (index == 2) {
//             Navigator.pushNamed(context, '/profile');
//           }
//         },
//       ),
//       body: Column(
//         children: [
//           Container(
//             alignment: Alignment.center,
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               children: const [
//                 CircleAvatar(
//                   radius: 50.0,
//                   backgroundImage: AssetImage('assets/images/pic1.png'),
//                 ),
//                 SizedBox(height: 10.0),
//                 Text(
//                   '@ACCOUNT',
//                   style: TextStyle(fontSize: 20.0),
//                 ),
//                 Text(
//                   'DESCRIPTIONS',
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//               ],
//             ),
//           ),
//           const Expanded(
//             child: Center(
//               child: Text(
//                 'Hello, World!',
//                 style: TextStyle(
//                   fontSize: 24.0,
//                   color: Colors.pink,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MySetting extends StatelessWidget {
//   const MySetting({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My App'),
//         actions: [
//           PopupMenuButton(
//             itemBuilder: (BuildContext context) => [
//               const PopupMenuItem(
//                 value: 1,
//                 child: Text('Option 1'),
//               ),
//               const PopupMenuItem(
//                 value: 2,
//                 child: Text('Option 2'),
//               ),
//             ],
//             onSelected: (value) {
//               if (value == 1) {
//                 // Handle option 1
//               } else if (value == 2) {
//                 // Handle option 2
//               }
//             },
//           ),
//         ],
//       ),
//       body: const Center(
//         child: Text('Hello, world!'),
//       ),
//     );
//   }
// }
