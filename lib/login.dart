// // // import 'package:flutter/material.dart';

// // // class LoginPage extends StatefulWidget {
// // //   const LoginPage({super.key});

// // //   @override
// // //   // ignore: library_private_types_in_public_api
// // //   _LoginPageState createState() => _LoginPageState();
// // // }

// // // class _LoginPageState extends State<LoginPage> {
// // //   final _formKey = GlobalKey<FormState>();
// // //   final _usernameController = TextEditingController();
// // //   final _passwordController = TextEditingController();
// // //   bool _isLoading = false;

// // //   void _handleLogin() async {
// // //     setState(() {
// // //       _isLoading = true;
// // //     });

// // //     // Simulate an API request for authentication
// // //     await Future.delayed(const Duration(seconds: 2));

// // //     // Check if the username and password are valid
// // //     if (_usernameController.text.contains('@') &&
// // //         _usernameController.text.contains('.com') &&
// // //         _passwordController.text.length >= 8) {
// // //       // Navigate to the homepage if the authentication is successful
// // //       // ignore: use_build_context_synchronously
// // //       Navigator.pushReplacementNamed(context, '/swipe');
// // //     } else {
// // //       // Show an error message if the authentication fails
// // //       // ignore: use_build_context_synchronously
// // //       showDialog(
// // //         context: context,
// // //         builder: (_) => AlertDialog(
// // //           title: const Text('Error'),
// // //           content: const Text('Invalid username or password.'),
// // //           actions: [
// // //             TextButton(
// // //               onPressed: () {
// // //                 Navigator.pop(context);
// // //               },
// // //               child: const Text('OK'),
// // //             )
// // //           ],
// // //         ),
// // //       );
// // //     }

// // //     setState(() {
// // //       _isLoading = false;
// // //     });
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: Colors.grey[900],
// // //       // extendBodyBehindAppBar: true,
// // //       appBar: AppBar(
// // //         // title: const Text('Login'),
// // //         backgroundColor: Colors.transparent,
// // //         elevation: 0,
// // //       ),
// // //       body: _isLoading
// // //           ? const Center(
// // //               child: CircularProgressIndicator(),
// // //             )
// // //           : Padding(
// // //               padding: const EdgeInsets.all(16.0),
// // //               child: Container(
// // //                 padding: const EdgeInsets.all(30.0),
// // //                 decoration: BoxDecoration(
// // //                   color: Colors.grey[700],
// // //                   borderRadius: BorderRadius.circular(10),
// // //                   border: Border.all(
// // //                     color: Colors.black,
// // //                     width: 1,
// // //                   ),
// // //                 ),
// // //                 child: Form(
// // //                   key: _formKey,
// // //                   child: Column(
// // //                     crossAxisAlignment: CrossAxisAlignment.stretch,
// // //                     children: [
// // //                       Padding(
// // //                         padding: const EdgeInsets.all(20.0),
// // //                         child: Image.asset(
// // //                           'assets/images/daely1.png',
// // //                           width: 80,
// // //                           height: 80,
// // //                         ),
// // //                       ),
// // //                       TextFormField(
// // //                         controller: _usernameController,
// // //                         keyboardType: TextInputType.emailAddress,
// // //                         decoration: const InputDecoration(
// // //                           labelText: 'Email',
// // //                           labelStyle: TextStyle(color: Colors.white70),
// // //                           focusedBorder: OutlineInputBorder(
// // //                             borderSide: BorderSide(color: Colors.white70),
// // //                           ),
// // //                           border: OutlineInputBorder(),
// // //                         ),
// // //                         style: const TextStyle(color: Colors.white70),
// // //                         cursorColor: Colors.white.withOpacity(0.7),
// // //                         validator: (value) {
// // //                           if (value!.isEmpty) {
// // //                             return 'Please enter your email';
// // //                           }
// // //                           return null;
// // //                         },
// // //                       ),
// // //                       const SizedBox(height: 16.0),
// // //                       TextFormField(
// // //                         controller: _passwordController,
// // //                         obscureText: true,
// // //                         decoration: const InputDecoration(
// // //                           labelText: 'Password',
// // //                           labelStyle: TextStyle(color: Colors.white70),
// // //                           focusedBorder: OutlineInputBorder(
// // //                             borderSide: BorderSide(color: Colors.white70),
// // //                           ),
// // //                           border: OutlineInputBorder(),
// // //                         ),
// // //                         style: const TextStyle(color: Colors.white70),
// // //                         cursorColor: Colors.white.withOpacity(0.7),
// // //                         validator: (value) {
// // //                           if (value!.isEmpty) {
// // //                             return 'Please enter your password';
// // //                           }
// // //                           if (value.length < 8) {
// // //                             return 'Password must be at least 8 characters';
// // //                           }
// // //                           return null;
// // //                         },
// // //                       ),
// // //                       const SizedBox(height: 11.0),
// // //                       ElevatedButton(
// // //                         onPressed: () {
// // //                           if (_formKey.currentState!.validate()) {
// // //                             _handleLogin();
// // //                           }
// // //                         },
// // //                         style: ButtonStyle(
// // //                           backgroundColor:
// // //                               MaterialStateProperty.all<Color>(Colors.white70),
// // //                         ),
// // //                         child: const Text('Login'),
// // //                       ),
// // //                       const SizedBox(height: 11.0),
// // //                       ElevatedButton(
// // //                         onPressed: () {
// // //                           Navigator.pushNamed(context, '/register');
// // //                         },
// // //                         style: ButtonStyle(
// // //                           backgroundColor:
// // //                               MaterialStateProperty.all<Color>(Colors.white70),
// // //                         ),
// // //                         child: const Text('register'),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ),
// // //               ),
// // //             ),
// // //     );
// // //   }
// // // }

// // import 'dart:async';

// // import 'package:firebase_database/firebase_database.dart';
// // import 'package:flutter/material.dart';

// // class LoginPage extends StatefulWidget {
// //   const LoginPage({super.key});

// //   @override
// //   // ignore: library_private_types_in_public_api
// //   _LoginPageState createState() => _LoginPageState();
// // }

// // class _LoginPageState extends State<LoginPage> {
// //   final _formKey = GlobalKey<FormState>();
// //   final _usernameController = TextEditingController();
// //   final _passwordController = TextEditingController();
// //   bool _isLoading = false;

// //   late DatabaseReference
// //       _usersRef; // Reference to the "users" node in the database

// //   @override
// //   void initState() {
// //     super.initState();
// //     // Initialize the Realtime Database reference
// //     // ignore: deprecated_member_use
// //     _usersRef = FirebaseDatabase.instance.reference().child('users');
// //   }

// //   void _handleLogin() async {
// //     setState(() {
// //       _isLoading = true;
// //     });

// //     // Simulate an API request for authentication
// //     await Future.delayed(const Duration(seconds: 2));

// //     final String email = _usernameController.text.trim();
// //     final String password = _passwordController.text;

// //     final DataSnapshot snapshot = (await _usersRef.once()) as DataSnapshot;

// //     final Map<String, dynamic> users = snapshot.value as Map<String, dynamic>;

// //     if (users.containsKey(email)) {
// //       final String storedPassword = users[email]['password'];
// //       if (password == storedPassword) {
// //         // Authentication successful, navigate to the homepage
// //         // ignore: use_build_context_synchronously
// //         Navigator.pushReplacementNamed(context, '/swipe');
// //         return;
// //       }
// //     }

// //     // Show an error message if the authentication fails
// //     // ignore: use_build_context_synchronously
// //     showDialog(
// //       context: context,
// //       builder: (_) => AlertDialog(
// //         title: const Text('Error'),
// //         content: const Text('Invalid email or password.'),
// //         actions: [
// //           TextButton(
// //             onPressed: () {
// //               Navigator.pop(context);
// //             },
// //             child: const Text('OK'),
// //           )
// //         ],
// //       ),
// //     );

// //     setState(() {
// //       _isLoading = false;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.grey[900],
// //       // extendBodyBehindAppBar: true,
// //       appBar: AppBar(
// //         // title: const Text('Login'),
// //         backgroundColor: Colors.transparent,
// //         elevation: 0,
// //       ),
// //       body: _isLoading
// //           ? const Center(
// //               child: CircularProgressIndicator(),
// //             )
// //           : Padding(
// //               padding: const EdgeInsets.all(16.0),
// //               child: Container(
// //                 padding: const EdgeInsets.all(30.0),
// //                 decoration: BoxDecoration(
// //                   color: Colors.grey[700],
// //                   borderRadius: BorderRadius.circular(10),
// //                   border: Border.all(
// //                     color: Colors.black,
// //                     width: 1,
// //                   ),
// //                 ),
// //                 child: Form(
// //                   key: _formKey,
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.stretch,
// //                     children: [
// //                       Padding(
// //                         padding: const EdgeInsets.all(20.0),
// //                         child: Image.asset(
// //                           'assets/images/daely1.png',
// //                           width: 80,
// //                           height: 80,
// //                         ),
// //                       ),
// //                       TextFormField(
// //                         controller: _usernameController,
// //                         keyboardType: TextInputType.emailAddress,
// //                         decoration: const InputDecoration(
// //                           labelText: 'Email',
// //                           labelStyle: TextStyle(color: Colors.white70),
// //                           focusedBorder: OutlineInputBorder(
// //                             borderSide: BorderSide(color: Colors.white70),
// //                           ),
// //                           border: OutlineInputBorder(),
// //                         ),
// //                         style: const TextStyle(color: Colors.white70),
// //                         cursorColor: Colors.white.withOpacity(0.7),
// //                         validator: (value) {
// //                           if (value!.isEmpty) {
// //                             return 'Please enter your email';
// //                           }
// //                           return null;
// //                         },
// //                       ),
// //                       const SizedBox(height: 16.0),
// //                       TextFormField(
// //                         controller: _passwordController,
// //                         obscureText: true,
// //                         decoration: const InputDecoration(
// //                           labelText: 'Password',
// //                           labelStyle: TextStyle(color: Colors.white70),
// //                           focusedBorder: OutlineInputBorder(
// //                             borderSide: BorderSide(color: Colors.white70),
// //                           ),
// //                           border: OutlineInputBorder(),
// //                         ),
// //                         style: const TextStyle(color: Colors.white70),
// //                         cursorColor: Colors.white.withOpacity(0.7),
// //                         validator: (value) {
// //                           if (value!.isEmpty) {
// //                             return 'Please enter your password';
// //                           }
// //                           if (value.length < 8) {
// //                             return 'Password must be at least 8 characters';
// //                           }
// //                           return null;
// //                         },
// //                       ),
// //                       const SizedBox(height: 11.0),
// //                       ElevatedButton(
// //                         onPressed: () {
// //                           if (_formKey.currentState!.validate()) {
// //                             _handleLogin();
// //                           }
// //                         },
// //                         style: ButtonStyle(
// //                           backgroundColor:
// //                               MaterialStateProperty.all<Color>(Colors.white70),
// //                         ),
// //                         child: const Text('Login'),
// //                       ),
// //                       const SizedBox(height: 11.0),
// //                       ElevatedButton(
// //                         onPressed: () {
// //                           Navigator.pushNamed(context, '/register');
// //                         },
// //                         style: ButtonStyle(
// //                           backgroundColor:
// //                               MaterialStateProperty.all<Color>(Colors.white70),
// //                         ),
// //                         child: const Text('register'),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';
// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:firebase_database/firebase_database.dart';

// // class LoginPage extends StatefulWidget {
// //   const LoginPage({super.key});

// //   @override
// //   // ignore: library_private_types_in_public_api
// //   _LoginPageState createState() => _LoginPageState();
// // }

// // class _LoginPageState extends State<LoginPage> {
// //   final _formKey = GlobalKey<FormState>();
// //   final _usernameController = TextEditingController();
// //   final _passwordController = TextEditingController();
// //   bool _isLoading = false;

// //   late DatabaseReference _usersRef;

// //   @override
// //   void initState() {
// //     super.initState();
// //     // Initialize Firebase
// //     Firebase.initializeApp().then((value) {
// //       // Initialize the Realtime Database reference
// //       // ignore: deprecated_member_use
// //       _usersRef = FirebaseDatabase.instance.reference().child('users');
// //     });

// //     final FirebaseDatabase database = FirebaseDatabase.instance;
// //     database.setPersistenceEnabled(true);
// //     database.setPersistenceCacheSizeBytes(10000000);
// //   }

// //   @override
// //   void dispose() {
// //     _usernameController.dispose();
// //     _passwordController.dispose();
// //     super.dispose();
// //   }

// //   void _handleLogin() async {
// //     setState(() {
// //       _isLoading = true;
// //     });

// //     // Simulate an API request for authentication
// //     await Future.delayed(const Duration(seconds: 2));

// //     final String email = _usernameController.text.trim();
// //     final String password = _passwordController.text;

// //     final DataSnapshot snapshot = (await _usersRef.once()) as DataSnapshot;

// //     final Map<String, dynamic> users = snapshot.value as Map<String, dynamic>;

// //     if (users.containsKey(email)) {
// //       final String storedPassword = users[email]['password'];
// //       if (password == storedPassword) {
// //         // Authentication successful, navigate to the homepage
// //         // ignore: use_build_context_synchronously
// //         Navigator.pushReplacementNamed(context, '/swipe');
// //         return;
// //       }
// //     }

// //     // Show an error message if the authentication fails
// //     // ignore: use_build_context_synchronously
// //     showDialog(
// //       context: context,
// //       builder: (_) => AlertDialog(
// //         title: const Text('Error'),
// //         content: const Text('Invalid email or password.'),
// //         actions: [
// //           TextButton(
// //             onPressed: () {
// //               Navigator.pop(context);
// //             },
// //             child: const Text('OK'),
// //           )
// //         ],
// //       ),
// //     );

// //     setState(() {
// //       _isLoading = false;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.grey[900],
// //       appBar: AppBar(
// //         backgroundColor: Colors.transparent,
// //         elevation: 0,
// //       ),
// //       body: _isLoading
// //           ? const Center(
// //               child: CircularProgressIndicator(),
// //             )
// //           : Padding(
// //               padding: const EdgeInsets.all(16.0),
// //               child: Container(
// //                 padding: const EdgeInsets.all(30.0),
// //                 decoration: BoxDecoration(
// //                   color: Colors.grey[700],
// //                   borderRadius: BorderRadius.circular(10),
// //                   border: Border.all(
// //                     color: Colors.black,
// //                     width: 1,
// //                   ),
// //                 ),
// //                 child: Form(
// //                   key: _formKey,
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.stretch,
// //                     children: [
// //                       Padding(
// //                         padding: const EdgeInsets.all(20.0),
// //                         child: Image.asset(
// //                           'assets/images/daely1.png',
// //                           width: 80,
// //                           height: 80,
// //                         ),
// //                       ),
// //                       TextFormField(
// //                         controller: _usernameController,
// //                         keyboardType: TextInputType.emailAddress,
// //                         decoration: const InputDecoration(
// //                           labelText: 'Email',
// //                           labelStyle: TextStyle(color: Colors.white70),
// //                           focusedBorder: OutlineInputBorder(
// //                             borderSide: BorderSide(color: Colors.white70),
// //                           ),
// //                           border: OutlineInputBorder(),
// //                         ),
// //                         style: const TextStyle(color: Colors.white70),
// //                         cursorColor: Colors.white.withOpacity(0.7),
// //                         validator: (value) {
// //                           if (value!.isEmpty) {
// //                             return 'Please enter your email';
// //                           }
// //                           return null;
// //                         },
// //                       ),
// //                       const SizedBox(height: 16.0),
// //                       TextFormField(
// //                         controller: _passwordController,
// //                         obscureText: true,
// //                         decoration: const InputDecoration(
// //                           labelText: 'Password',
// //                           labelStyle: TextStyle(color: Colors.white70),
// //                           focusedBorder: OutlineInputBorder(
// //                             borderSide: BorderSide(color: Colors.white70),
// //                           ),
// //                           border: OutlineInputBorder(),
// //                         ),
// //                         style: const TextStyle(color: Colors.white70),
// //                         cursorColor: Colors.white.withOpacity(0.7),
// //                         validator: (value) {
// //                           if (value!.isEmpty) {
// //                             return 'Please enter your password';
// //                           }
// //                           return null;
// //                         },
// //                       ),
// //                       const SizedBox(height: 11.0),
// //                       ElevatedButton(
// //                         onPressed: () {
// //                           if (_formKey.currentState!.validate()) {
// //                             _handleLogin();
// //                           }
// //                         },
// //                         style: ButtonStyle(
// //                           backgroundColor:
// //                               MaterialStateProperty.all<Color>(Colors.white70),
// //                         ),
// //                         child: const Text('Login'),
// //                       ),
// //                       const SizedBox(height: 11.0),
// //                       ElevatedButton(
// //                         onPressed: () {
// //                           Navigator.pushNamed(context, '/register');
// //                         },
// //                         style: ButtonStyle(
// //                           backgroundColor:
// //                               MaterialStateProperty.all<Color>(Colors.white70),
// //                         ),
// //                         child: const Text('Register'),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';
// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:firebase_database/firebase_database.dart';

// // class LoginPage extends StatefulWidget {
// //   const LoginPage({Key? key}) : super(key: key);

// //   @override
// //   // ignore: library_private_types_in_public_api
// //   _LoginPageState createState() => _LoginPageState();
// // }

// // class _LoginPageState extends State<LoginPage> {
// //   final _formKey = GlobalKey<FormState>();
// //   final _emailController = TextEditingController();
// //   final _passwordController = TextEditingController();
// //   bool _isLoading = false;
// //   late DatabaseReference _usersRef;

// //   @override
// //   void initState() {
// //     super.initState();
// //     // Initialize Firebase
// //     Firebase.initializeApp().then((value) {
// //       // Initialize the Realtime Database reference
// //       // ignore: deprecated_member_use
// //       _usersRef = FirebaseDatabase.instance.reference().child('users');
// //     });

// //     final FirebaseDatabase database = FirebaseDatabase.instance;
// //     database.setPersistenceEnabled(true);
// //     database.setPersistenceCacheSizeBytes(10000000);
// //   }

// //   @override
// //   void dispose() {
// //     _emailController.dispose();
// //     _passwordController.dispose();
// //     super.dispose();
// //   }

// //   void _handleLogin() async {
// //     setState(() {
// //       _isLoading = true;
// //     });

// //     final String email = _emailController.text.trim();
// //     final String password = _passwordController.text;

// //     final event = await _usersRef.child(email).once();
// //     final snapshot = event.snapshot;

// //     final dynamic snapshotValue = snapshot.value;
// //     if (snapshotValue != null && snapshotValue is Map) {
// //       final String storedPassword = snapshotValue['password'];
// //       if (password == storedPassword) {
// //         // ignore: use_build_context_synchronously
// //         Navigator.pushReplacementNamed(context, '/swipe');
// //         return;
// //       }
// //     }

// //     // ignore: use_build_context_synchronously
// //     showDialog(
// //       context: context,
// //       builder: (_) => AlertDialog(
// //         title: const Text('Error'),
// //         content: const Text('Invalid email or password.'),
// //         actions: [
// //           TextButton(
// //             onPressed: () {
// //               Navigator.pop(context);
// //             },
// //             child: const Text('OK'),
// //           ),
// //         ],
// //       ),
// //     );

// //     setState(() {
// //       _isLoading = false;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Login'),
// //       ),
// //       body: _isLoading
// //           ? const Center(
// //               child: CircularProgressIndicator(),
// //             )
// //           : Padding(
// //               padding: const EdgeInsets.all(16.0),
// //               child: Form(
// //                 key: _formKey,
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.stretch,
// //                   children: [
// //                     TextFormField(
// //                       controller: _emailController,
// //                       keyboardType: TextInputType.emailAddress,
// //                       decoration: const InputDecoration(
// //                         labelText: 'Email',
// //                       ),
// //                       validator: (value) {
// //                         if (value!.isEmpty) {
// //                           return 'Please enter your email';
// //                         }
// //                         return null;
// //                       },
// //                     ),
// //                     const SizedBox(height: 16.0),
// //                     TextFormField(
// //                       controller: _passwordController,
// //                       obscureText: true,
// //                       decoration: const InputDecoration(
// //                         labelText: 'Password',
// //                       ),
// //                       validator: (value) {
// //                         if (value!.isEmpty) {
// //                           return 'Please enter your password';
// //                         }
// //                         return null;
// //                       },
// //                     ),
// //                     const SizedBox(height: 16.0),
// //                     ElevatedButton(
// //                       onPressed: () {
// //                         if (_formKey.currentState!.validate()) {
// //                           _handleLogin();
// //                         }
// //                       },
// //                       child: const Text('Login'),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //     );
// //   }
// // }

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   // ignore: deprecated_member_use
//   final DatabaseReference usersRef =
//       // ignore: deprecated_member_use
//       FirebaseDatabase.instance.reference().child('users');
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     // Initialize Firebase and configure the database connection if needed
//   }

//   // void checkUserData(String username, String password) {
//   //   usersRef
//   //       .orderByChild('username')
//   //       .equalTo(username)
//   //       .once()
//   //       .then((DataSnapshot snapshot) {
//   //         if (snapshot.value != null) {
//   //           // User with the specified username exists
//   //           Map<dynamic, dynamic>? data =
//   //               snapshot.value as Map<dynamic, dynamic>?;

//   //           // Check if the data is not null
//   //           if (data != null) {
//   //             // Loop through the data and check the password
//   //             data.forEach((key, value) {
//   //               var storedPassword = value['password'];

//   //               if (storedPassword == password) {
//   //                 // Valid username and password
//   //                 // ...
//   //               } else {
//   //                 // Invalid password
//   //                 // ...
//   //               }
//   //             });
//   //           }
//   //         } else {
//   //           // User with the specified username doesn't exist
//   //           // ...
//   //         }
//   //       } as FutureOr Function(DatabaseEvent value))
//   //       .catchError((error) {
//   //     // Handle error
//   //   });
//   // }

//   void checkUserData(String username, String password) {
//     usersRef
//         .orderByChild('username')
//         .equalTo(username)
//         .once()
//         .then((DataSnapshot snapshot) {
//           if (snapshot.value != null) {
//             Map<dynamic, dynamic>? data =
//                 snapshot.value as Map<dynamic, dynamic>?;

//             if (data != null) {
//               bool isMatchFound = false;

//               // Loop through the data and check the password
//               data.forEach((key, value) {
//                 var storedPassword = value['password'];

//                 if (storedPassword == password) {
//                   // Valid username and password
//                   isMatchFound = true;
//                 }
//               });

//               if (isMatchFound) {
//                 // Username and password match
//                 return 'Please enter your password1';
//               } else {
//                 // Invalid password
//                 return 'Please enter your password2';
//               }
//             }
//           } else {
//             // User with the specified username doesn't exist
//             return 'Please enter your password3';
//           }
//         } as FutureOr Function(DatabaseEvent value))
//         .catchError((error) {
//       // Handle error
//       return 'Please enter your password4';
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: _usernameController,
//               decoration: const InputDecoration(
//                 labelText: 'Username',
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             TextField(
//               controller: _passwordController,
//               decoration: const InputDecoration(
//                 labelText: 'Password',
//               ),
//               obscureText: true,
//             ),
//             const SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 String username = _usernameController.text;
//                 String password = _passwordController.text;
//                 checkUserData(username, password);
//               },
//               child: const Text('Login'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();

  late DatabaseReference _userRef;

  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    _userRef = FirebaseDatabase.instance.reference().child('users');
  }

  void _loginUser() async {
    if (_formKey.currentState!.validate()) {
      final username = _usernameController.text.trim();
      final password = _passwordController.text.trim();

      try {
        final snapshot =
            await _userRef.orderByChild('username').equalTo(username).once();

        final DataSnapshot userSnapshot = DataSnapshot;
        final Map<dynamic, dynamic> usersData =
            userSnapshot.value as Map<dynamic, dynamic>;

        if (usersData.isNotEmpty) {
          final user = usersData.values.first;
          final email = user['email'] as String;
          final savedPassword = user['password'] as String;

          // Check if the entered password matches the saved password
          if (password == savedPassword) {
            // Sign in with email and password
            await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: email,
              password: password,
            );

            // Login successful, show a success message or navigate to the next screen
            // ignore: use_build_context_synchronously
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Success'),
                content: const Text('User logged in successfully.'),
                actions: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          } else {
            // Password is incorrect
            // ignore: use_build_context_synchronously
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Error'),
                content: const Text('Invalid password.'),
                actions: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          }
        } else {
          // User not found
          // ignore: use_build_context_synchronously
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Error'),
              content: const Text('User not found.'),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      } catch (e) {
        // Error occurred while reading user data or signing in
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: const Text('Failed to login. Please try again.'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _loginUser,
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
