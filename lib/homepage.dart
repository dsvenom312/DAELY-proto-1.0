// import 'package:daely_proto_11/inbox.dart';
// import 'package:daely_proto_11/mainprofile.dart';
// import 'package:daely_proto_11/explore.dart';
// import 'package:daely_proto_11/setting.dart';
// import 'package:daely_proto_11/shop.dart';
// import 'package:daely_proto_11/login.dart';

// import 'package:flutter/material.dart';
// import 'package:daely_proto_11/main.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     if (index == 2) {
//       // Navigate to Profile page on index 2
//       Navigator.pushNamed(context, '/profile');
//     } else if (index == 0) {
//       Navigator.pushNamed(context, '/login');
//     } else if (index == 1) {
//       Navigator.pushNamed(context, '/shop');
//     } else {
//       setState(() {
//         _selectedIndex = index;
//       });
//     }
//   }

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
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const MySetting()),
//               );
//             },
//           ),
//         ], // Change the color to black
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
//                       style: TextStyle(
//                           fontSize: 18.0,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold)),
//                   SizedBox(height: 10.0),
//                   Text('DESCRIPTIONS',
//                       style: TextStyle(fontSize: 12.0, color: Colors.white)),
//                 ],
//               ),
//               FloatingActionButton(
//                 backgroundColor: Colors.black, // Change the color to blue
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
//         backgroundColor: Colors.black, // Change the color to black
//         selectedItemColor: Colors.pink,
//         unselectedItemColor: Colors.white,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: 'Search',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart, color: Colors.pink),
//             label: 'Shop',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person, color: Colors.pink),
//             label: 'Profile',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
