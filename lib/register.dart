// // import 'package:flutter/material.dart';
// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:firebase_database/firebase_database.dart';

// // class RegisterPage extends StatefulWidget {
// //   const RegisterPage({super.key});

// //   @override
// //   // ignore: library_private_types_in_public_api
// //   _RegisterPageState createState() => _RegisterPageState();
// // }

// // class _RegisterPageState extends State<RegisterPage> {
// //   final _formKey = GlobalKey<FormState>();
// //   final _nameController = TextEditingController();
// //   final _ageController = TextEditingController();

// //   late DatabaseReference _userRef;

// //   @override
// //   void initState() {
// //     super.initState();
// //     // Initialize Firebase
// //     Firebase.initializeApp().then((value) {
// //       // Initialize the Realtime Database reference
// //       // ignore: deprecated_member_use
// //       _userRef = FirebaseDatabase.instance.reference().child('users');
// //     });

// //     final FirebaseDatabase database = FirebaseDatabase.instance;
// //     database.setPersistenceEnabled(true);
// //     database.setPersistenceCacheSizeBytes(10000000);
// //   }

// //   @override
// //   void dispose() {
// //     _nameController.dispose();
// //     _ageController.dispose();
// //     super.dispose();
// //   }

// //   void _registerUser() {
// //     if (_formKey.currentState!.validate()) {
// //       String name = _nameController.text.trim();
// //       String age = _ageController.text.trim();

// //       // Store user information in the database
// //       _userRef.push().set({
// //         'name': name,
// //         'age': age,
// //       }).then((value) {
// //         // Registration successful, show a success message or navigate to the next screen
// //         showDialog(
// //           context: context,
// //           builder: (context) => AlertDialog(
// //             title: const Text('Success'),
// //             content: const Text('User registered successfully.'),
// //             actions: [
// //               ElevatedButton(
// //                 onPressed: () => Navigator.pop(context),
// //                 child: const Text('OK'),
// //               ),
// //             ],
// //           ),
// //         );
// //       }).catchError((error) {
// //         // Registration failed, show an error message
// //         showDialog(
// //           context: context,
// //           builder: (context) => AlertDialog(
// //             title: const Text('Error'),
// //             content: const Text('Failed to register user. Please try again.'),
// //             actions: [
// //               ElevatedButton(
// //                 onPressed: () => Navigator.pop(context),
// //                 child: const Text('OK'),
// //               ),
// //             ],
// //           ),
// //         );
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Register'),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Form(
// //           key: _formKey,
// //           child: Column(
// //             children: [
// //               TextFormField(
// //                 controller: _nameController,
// //                 decoration: const InputDecoration(
// //                   labelText: 'Name',
// //                 ),
// //                 validator: (value) {
// //                   if (value!.isEmpty) {
// //                     return 'Please enter your name';
// //                   }
// //                   return null;
// //                 },
// //               ),
// //               TextFormField(
// //                 controller: _ageController,
// //                 decoration: const InputDecoration(
// //                   labelText: 'Age',
// //                 ),
// //                 validator: (value) {
// //                   if (value!.isEmpty) {
// //                     return 'Please enter your age';
// //                   }
// //                   return null;
// //                 },
// //               ),
// //               const SizedBox(height: 16.0),
// //               ElevatedButton(
// //                 onPressed: _registerUser,
// //                 child: const Text('Register'),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';

// class RegisterPage extends StatefulWidget {
//   const RegisterPage({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _RegisterPageState createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _dobController = TextEditingController();

//   late DatabaseReference _userRef;

//   @override
//   void initState() {
//     super.initState();
//     // Initialize Firebase
//     Firebase.initializeApp().then((value) {
//       // Initialize the Realtime Database reference
//       // ignore: deprecated_member_use
//       _userRef = FirebaseDatabase.instance.reference().child('users');
//     });

//     final FirebaseDatabase database = FirebaseDatabase.instance;
//     database.setPersistenceEnabled(true);
//     database.setPersistenceCacheSizeBytes(10000000);
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _usernameController.dispose();
//     _passwordController.dispose();
//     _dobController.dispose();
//     super.dispose();
//   }

//   // void _registerUser() {
//   //   if (_formKey.currentState!.validate()) {
//   //     String email = _emailController.text.trim();
//   //     String username = _usernameController.text.trim();
//   //     String password = _passwordController.text;
//   //     String dob = _dobController.text.trim();

//   //     // Store user information in the database
//   //     _userRef.push().set({
//   //       'email': email,
//   //       'username': username,
//   //       'password': password,
//   //       'dob': dob,
//   //     }).then((value) {
//   //       // Registration successful, show a success message or navigate to the next screen
//   //       showDialog(
//   //         context: context,
//   //         builder: (context) => AlertDialog(
//   //           title: const Text('Success'),
//   //           content: const Text('User registered successfully.'),
//   //           actions: [
//   //             ElevatedButton(
//   //               onPressed: () => Navigator.pop(context),
//   //               child: const Text('OK'),
//   //             ),
//   //           ],
//   //         ),
//   //       );
//   //     }).catchError((error) {
//   //       // Registration failed, show an error message
//   //       showDialog(
//   //         context: context,
//   //         builder: (context) => AlertDialog(
//   //           title: const Text('Error'),
//   //           content: const Text('Failed to register user. Please try again.'),
//   //           actions: [
//   //             ElevatedButton(
//   //               onPressed: () => Navigator.pop(context),
//   //               child: const Text('OK'),
//   //             ),
//   //           ],
//   //         ),
//   //       );
//   //     });
//   //   }
//   // }

//   void _registerUser() {
//     if (_formKey.currentState!.validate()) {
//       String email = _emailController.text.trim();
//       String username = _usernameController.text.trim();
//       String password = _passwordController.text;
//       String dob = _dobController.text.trim();

//       // Retrieve the count of existing users to determine the next ID
//       _userRef
//           .once()
//           .then((DataSnapshot snapshot) {
//             Map<dynamic, dynamic>? data = snapshot.value as Map?;
//             int userCount = data != null ? data.values.length : 0;
//             String userId = 'US${(userCount + 1).toString().padLeft(3, '0')}';

//             // Store user information in the database
//             DatabaseReference newUserRef = _userRef.child(userId);
//             newUserRef.set({
//               'email': email,
//               'username': username,
//               'password': password,
//               'dob': dob,
//             }).then((value) {
//               // Registration successful, show a success message or navigate to the next screen
//               showDialog(
//                 context: context,
//                 builder: (context) => AlertDialog(
//                   title: const Text('Success'),
//                   content: const Text('User registered successfully.'),
//                   actions: [
//                     ElevatedButton(
//                       onPressed: () => Navigator.pop(context),
//                       child: const Text('OK'),
//                     ),
//                   ],
//                 ),
//               );
//             }).catchError((error) {
//               // Registration failed, show an error message
//               showDialog(
//                 context: context,
//                 builder: (context) => AlertDialog(
//                   title: const Text('Error'),
//                   content:
//                       const Text('Failed to register user. Please try again.'),
//                   actions: [
//                     ElevatedButton(
//                       onPressed: () => Navigator.pop(context),
//                       child: const Text('OK'),
//                     ),
//                   ],
//                 ),
//               );
//             });
//           } as FutureOr Function(DatabaseEvent value))
//           .catchError((error) {
//         // Failed to retrieve user count, show an error message
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: const Text('Error'),
//             content: const Text('Failed to register user. Please try again.'),
//             actions: [
//               ElevatedButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: const Text('OK'),
//               ),
//             ],
//           ),
//         );
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Register'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _emailController,
//                 decoration: const InputDecoration(
//                   labelText: 'Email',
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _usernameController,
//                 decoration: const InputDecoration(
//                   labelText: 'Username',
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter your username';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _passwordController,
//                 decoration: const InputDecoration(
//                   labelText: 'Password',
//                 ),
//                 obscureText: true,
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter your password';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _dobController,
//                 decoration: const InputDecoration(
//                   labelText: 'Date of Birth (yyyy/mm/dd)',
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter your date of birth';
//                   }
// // You can add additional validation for the date format here
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: () {
//                   _registerUser();
//                   // Navigator.pushNamed(context, '/register');
//                 },
//                 child: const Text('Register'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  // final _nameController = TextEditingController();

  late DatabaseReference _userRef;

  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    _userRef = FirebaseDatabase.instance.reference().child('users');
  }

  // void _registerUser() async {
  //   if (_formKey.currentState!.validate()) {
  //     final email = _emailController.text.trim();
  //     final username = _usernameController.text.trim();
  //     final password = _passwordController.text.trim();

  //     try {
  //       // Create user with email and password

  //       // Store user information in the database
  //       await _userRef.child(username).set({
  //         'email': email,
  //         'username': username,
  //         'password': password,
  //       });

  //       // Registration successful, show a success message or navigate to the next screen
  //       // ignore: use_build_context_synchronously
  //       showDialog(
  //         context: context,
  //         builder: (context) => AlertDialog(
  //           title: const Text('Success'),
  //           content: const Text('User registered successfully.'),
  //           actions: [
  //             ElevatedButton(
  //               onPressed: () => Navigator.pop(context),
  //               child: const Text('OK'),
  //             ),
  //           ],
  //         ),
  //       );
  //     } on FirebaseAuthException catch (e) {
  //       // Registration failed, show an error message
  //       String errorMessage = 'Failed to register user. Please try again.';
  //       if (e.code == 'weak-password') {
  //         errorMessage = 'The password provided is too weak.';
  //       } else if (e.code == 'email-already-in-use') {
  //         errorMessage = 'The account already exists for that email.';
  //       }
  //       showDialog(
  //         context: context,
  //         builder: (context) => AlertDialog(
  //           title: const Text('Error'),
  //           content: Text(errorMessage),
  //           actions: [
  //             ElevatedButton(
  //               onPressed: () => Navigator.pop(context),
  //               child: const Text('OK'),
  //             ),
  //           ],
  //         ),
  //       );
  //     }
  //   }
  // }

  void _addUserToDatabase(
      String uid, String email, String password, String username) {
    final currentUser = FirebaseAuth.instance.currentUser!;
    _userRef.child(currentUser.uid).set({
      'email': email,
      'password': password,
      'username': username,
    }).then((_) {
      // User added successfully to the database
      return 'User added successfully';
      // ignore: body_might_complete_normally_catch_error
    }).catchError((error) {
      // An error occurred while adding the user to the database
      if (kDebugMode) {
        print('Failed to add user to the database: $error');
      }
    });
  }

  void _registerUser() async {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      final username = _usernameController.text.trim();

      try {
        // Create user with email and password
        final result =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        final uid = result.user!.uid;

        // Add user to the database
        _addUserToDatabase(uid, email, password, username);

        // Update user's profile with the username
        // ignore: deprecated_member_use
        await result.user!.updateProfile(displayName: username);

        // Registration successful, show a success message or navigate to the next screen
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Success'),
            content: const Text('User registered successfully.'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } on FirebaseAuthException catch (e) {
        // Registration failed, show an error message
        String errorMessage = 'Failed to register. Please try again.';
        if (e.code == 'email-already-in-use') {
          errorMessage = 'Email already in use. Please use a different email.';
        }
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: Text(errorMessage),
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
        title: const Text('Register'),
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
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
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
                onPressed: _registerUser,
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
