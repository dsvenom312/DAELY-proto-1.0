// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

//   late DatabaseReference _userRef;

//   @override
//   void initState() {
//     super.initState();
//     // ignore: deprecated_member_use
//     _userRef = FirebaseDatabase.instance.reference().child('users');
//   }

//   void _loginUser() async {
//     if (_formKey.currentState!.validate()) {
//       final email = _emailController.text.trim();
//       final password = _passwordController.text.trim();

//       try {
//         final snapshot =
//             await _userRef.orderByChild('email').equalTo(email).once();

//         final DataSnapshot userSnapshot = snapshot as DataSnapshot;
//         final Map<dynamic, dynamic>? usersData =
//             userSnapshot.value as Map<dynamic, dynamic>?;

//         if (usersData != null && usersData.isNotEmpty) {
//           final user = usersData.values.first;
//           final savedEmail = user['email'] as String;
//           final savedPassword = user['password'] as String;

//           // Check if the entered password matches the saved password
//           if (password == savedPassword) {
//             // Sign in with email and password
//             await FirebaseAuth.instance.signInWithEmailAndPassword(
//               email: savedEmail,
//               password: password,
//             );

//             // Login successful, show a success message or navigate to the next screen
//             // ignore: use_build_context_synchronously
//             showDialog(
//               context: context,
//               builder: (context) => AlertDialog(
//                 title: const Text('Success'),
//                 content: const Text('User logged in successfully.'),
//                 actions: [
//                   ElevatedButton(
//                     onPressed: () => Navigator.pop(context),
//                     child: const Text('OK'),
//                   ),
//                 ],
//               ),
//             );
//           } else {
//             // Password is incorrect
//             // ignore: use_build_context_synchronously
//             showDialog(
//               context: context,
//               builder: (context) => AlertDialog(
//                 title: const Text('Error'),
//                 content: const Text('Invalid password.'),
//                 actions: [
//                   ElevatedButton(
//                     onPressed: () => Navigator.pop(context),
//                     child: const Text('OK'),
//                   ),
//                 ],
//               ),
//             );
//           }
//         } else {
//           // User not found
//           // ignore: use_build_context_synchronously
//           showDialog(
//             context: context,
//             builder: (context) => AlertDialog(
//               title: const Text('Error'),
//               content: const Text('User not found.'),
//               actions: [
//                 ElevatedButton(
//                   onPressed: () => Navigator.pop(context),
//                   child: const Text('OK'),
//                 ),
//               ],
//             ),
//           );
//         }
//       } catch (e) {
//         // Error occurred while reading user data or signing in
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: const Text('Error'),
//             content: const Text('Failed to login. Please try again.'),
//             actions: [
//               ElevatedButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: const Text('OK'),
//               ),
//             ],
//           ),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               TextFormField(
//                 controller: _emailController,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: const InputDecoration(
//                   labelText: 'Email',
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter an email';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16.0),
//               TextFormField(
//                 controller: _passwordController,
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                   labelText: 'Password',
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a password';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: _loginUser,
//                 child: const Text('Login'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // import 'package:firebase_database/firebase_database.dart';
// // import 'package:flutter/material.dart';

// // class LoginPage extends StatefulWidget {
// //   const LoginPage({Key? key}) : super(key: key);

// //   @override
// //   // ignore: library_private_types_in_public_api
// //   _LoginPageState createState() => _LoginPageState();
// // }

// // class _LoginPageState extends State<LoginPage> {
// //   final _formKey = GlobalKey<FormState>();
// //   final _usernameController = TextEditingController();
// //   final _passwordController = TextEditingController();
// //   late DatabaseReference _userRef;

// //   @override
// //   void initState() {
// //     super.initState();
// //     // ignore: deprecated_member_use
// //     _userRef = FirebaseDatabase.instance.reference().child('users');
// //   }

// //   Future<void> _loginUser() async {
// //     if (_formKey.currentState!.validate()) {
// //       final username = _usernameController.text.trim();
// //       final password = _passwordController.text.trim();

// //       try {
// //         final snapshot =
// //             await _userRef.orderByChild('username').equalTo(username).once();

// //         final DataSnapshot userSnapshot = snapshot as DataSnapshot;
// //         final Map<dynamic, dynamic>? usersData =
// //             userSnapshot.value as Map<dynamic, dynamic>?;

// //         if (usersData != null && usersData.isNotEmpty) {
// //           final user = usersData.values.first;
// //           final savedPassword = user['password'] as String;

// //           if (password == savedPassword) {
// //             // Password is correct
// //             // Perform the login action here
// //             // ignore: use_build_context_synchronously
// //             showDialog(
// //               context: context,
// //               builder: (context) => AlertDialog(
// //                 title: const Text('Success'),
// //                 content: const Text('User logged in successfully.'),
// //                 actions: [
// //                   ElevatedButton(
// //                     onPressed: () => Navigator.pop(context),
// //                     child: const Text('OK'),
// //                   ),
// //                 ],
// //               ),
// //             );
// //           } else {
// //             // Password is incorrect
// //             // ignore: use_build_context_synchronously
// //             showDialog(
// //               context: context,
// //               builder: (context) => AlertDialog(
// //                 title: const Text('Error'),
// //                 content: const Text('Invalid password.'),
// //                 actions: [
// //                   ElevatedButton(
// //                     onPressed: () => Navigator.pop(context),
// //                     child: const Text('OK'),
// //                   ),
// //                 ],
// //               ),
// //             );
// //           }
// //         } else {
// //           // User not found
// //           // ignore: use_build_context_synchronously
// //           showDialog(
// //             context: context,
// //             builder: (context) => AlertDialog(
// //               title: const Text('Error'),
// //               content: const Text('User not found.'),
// //               actions: [
// //                 ElevatedButton(
// //                   onPressed: () => Navigator.pop(context),
// //                   child: const Text('OK'),
// //                 ),
// //               ],
// //             ),
// //           );
// //         }
// //       } catch (e) {
// //         showDialog(
// //           context: context,
// //           builder: (context) => AlertDialog(
// //             title: const Text('Error'),
// //             content: const Text('Failed to login. Please try again.'),
// //             actions: [
// //               ElevatedButton(
// //                 onPressed: () => Navigator.pop(context),
// //                 child: const Text('OK'),
// //               ),
// //             ],
// //           ),
// //         );
// //       }
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Login'),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Form(
// //           key: _formKey,
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.stretch,
// //             children: [
// //               TextFormField(
// //                 controller: _usernameController,
// //                 decoration: const InputDecoration(
// //                   labelText: 'Username',
// //                 ),
// //                 validator: (value) {
// //                   if (value == null || value.isEmpty) {
// //                     return 'Please enter a username';
// //                   }
// //                   return null;
// //                 },
// //               ),
// //               const SizedBox(height: 16.0),
// //               TextFormField(
// //                 controller: _passwordController,
// //                 obscureText: true,
// //                 decoration: const InputDecoration(
// //                   labelText: 'Password',
// //                 ),
// //                 validator: (value) {
// //                   if (value == null || value.isEmpty) {
// //                     return 'Please enter a password';
// //                   }
// //                   return null;
// //                 },
// //               ),
// //               const SizedBox(height: 16.0),
// //               ElevatedButton(
// //                 onPressed: _loginUser,
// //                 child: const Text('Login'),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

//   late DatabaseReference _userRef;

//   @override
//   void initState() {
//     super.initState();
//     // ignore: deprecated_member_use
//     _userRef = FirebaseDatabase.instance.reference().child('users');
//   }

//   // void _loginUser() async {
//   //   if (_formKey.currentState!.validate()) {
//   //     final email = _emailController.text.trim();
//   //     final password = _passwordController.text.trim();

//   //     try {
//   //       final snapshot =
//   //           await _userRef.orderByChild('email').equalTo(email).once();
//   //       final DataSnapshot userSnapshot = snapshot as DataSnapshot;
//   //       final Map<dynamic, dynamic>? usersData =
//   //           userSnapshot.value as Map<dynamic, dynamic>?;

//   //       if (usersData != null && usersData.isNotEmpty) {
//   //         final user = usersData.values.first;
//   //         final savedEmail = user['email'] as String;
//   //         final savedPassword = user['password'] as String;

//   //         // Check if the entered password matches the saved password
//   //         if (password == savedPassword) {
//   //           // Sign in with email and password
//   //           await FirebaseAuth.instance.signInWithEmailAndPassword(
//   //             email: savedEmail,
//   //             password: password,
//   //           );

//   //           // Login successful, show a success message or navigate to the next screen
//   //           // ignore: use_build_context_synchronously
//   //           showDialog(
//   //             context: context,
//   //             builder: (context) => AlertDialog(
//   //               title: const Text('Success'),
//   //               content: const Text('User logged in successfully.'),
//   //               actions: [
//   //                 ElevatedButton(
//   //                   onPressed: () => Navigator.pop(context),
//   //                   child: const Text('OK'),
//   //                 ),
//   //               ],
//   //             ),
//   //           );
//   //         } else {
//   //           // Password is incorrect
//   //           // ignore: use_build_context_synchronously
//   //           showDialog(
//   //             context: context,
//   //             builder: (context) => AlertDialog(
//   //               title: const Text('Error'),
//   //               content: const Text('Invalid password.'),
//   //               actions: [
//   //                 ElevatedButton(
//   //                   onPressed: () => Navigator.pop(context),
//   //                   child: const Text('OK'),
//   //                 ),
//   //               ],
//   //             ),
//   //           );
//   //         }
//   //       } else {
//   //         // User not found
//   //         // ignore: use_build_context_synchronously
//   //         showDialog(
//   //           context: context,
//   //           builder: (context) => AlertDialog(
//   //             title: const Text('Error'),
//   //             content: const Text('User not found.'),
//   //             actions: [
//   //               ElevatedButton(
//   //                 onPressed: () => Navigator.pop(context),
//   //                 child: const Text('OK'),
//   //               ),
//   //             ],
//   //           ),
//   //         );
//   //       }
//   //     } catch (e) {
//   //       // Error occurred while reading user data or signing in
//   //       showDialog(
//   //         context: context,
//   //         builder: (context) => AlertDialog(
//   //           title: const Text('Error'),
//   //           content: const Text('Failed to login. Please try again.'),
//   //           actions: [
//   //             ElevatedButton(
//   //               onPressed: () => Navigator.pop(context),
//   //               child: const Text('OK'),
//   //             ),
//   //           ],
//   //         ),
//   //       );
//   //     }
//   //   }
//   // }

//   void _loginUser() async {
//     if (_formKey.currentState!.validate()) {
//       final email = _emailController.text.trim();
//       final password = _passwordController.text.trim();
//       final uid = email.replaceAll('.', '_');

//       try {
//         final snapshot = await _userRef.child(uid).once();
//         final DataSnapshot userSnapshot = snapshot as DataSnapshot;
//         final userData = userSnapshot.value as Map<dynamic, dynamic>?;

//         if (userData != null) {
//           final savedEmail = userData['email'] as String;
//           final savedPassword = userData['password'] as String;

//           // Check if the entered password matches the saved password
//           if (password == savedPassword) {
//             // Sign in with email and password
//             await FirebaseAuth.instance.signInWithEmailAndPassword(
//               email: savedEmail,
//               password: password,
//             );

//             // Login successful, show a success message or navigate to the next screen
//             // ignore: use_build_context_synchronously
//             showDialog(
//               context: context,
//               builder: (context) => AlertDialog(
//                 title: const Text('Success'),
//                 content: const Text('User logged in successfully.'),
//                 actions: [
//                   ElevatedButton(
//                     onPressed: () => Navigator.pop(context),
//                     child: const Text('OK'),
//                   ),
//                 ],
//               ),
//             );
//           } else {
//             // Password is incorrect
//             // ignore: use_build_context_synchronously
//             showDialog(
//               context: context,
//               builder: (context) => AlertDialog(
//                 title: const Text('Error'),
//                 content: const Text('Invalid password.'),
//                 actions: [
//                   ElevatedButton(
//                     onPressed: () => Navigator.pop(context),
//                     child: const Text('OK'),
//                   ),
//                 ],
//               ),
//             );
//           }
//         } else {
//           // User not found
//           // ignore: use_build_context_synchronously
//           showDialog(
//             context: context,
//             builder: (context) => AlertDialog(
//               title: const Text('Error'),
//               content: const Text('User not found.'),
//               actions: [
//                 ElevatedButton(
//                   onPressed: () => Navigator.pop(context),
//                   child: const Text('OK'),
//                 ),
//               ],
//             ),
//           );
//         }
//       } catch (e) {
//         // Error occurred while reading user data or signing in
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: const Text('Error'),
//             content: const Text('Failed to login. Please try again.'),
//             actions: [
//               ElevatedButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: const Text('OK'),
//               ),
//             ],
//           ),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               TextFormField(
//                 controller: _emailController,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: const InputDecoration(
//                   labelText: 'Email',
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter an email';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16.0),
//               TextFormField(
//                 controller: _passwordController,
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                   labelText: 'Password',
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a password';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: _loginUser,
//                 child: const Text('Login'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

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
  final DatabaseReference _userRef =
      // ignore: deprecated_member_use
      FirebaseDatabase.instance.reference().child('users');

  Future<void> _loginUser() async {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      final uid = email.replaceAll('.', '_');

      try {
        final snapshot = await _userRef.child(uid).once();
        final DataSnapshot userSnapshot = snapshot as DataSnapshot;
        final userData = userSnapshot.value as Map<dynamic, dynamic>?;

        if (userData != null) {
          final savedPassword = userData['password'] as String;

          if (password == savedPassword) {
            // Password is correct
            // Perform login or navigate to the next screen
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        color: Colors.grey[700],
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.grey[700]),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: InputBorder.none,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      labelStyle: TextStyle(color: Colors.grey[900]),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    style: TextStyle(color: Colors.grey[700]),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: InputBorder.none,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      labelStyle: TextStyle(color: Colors.grey[900]),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _loginUser,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.grey[200],
                    backgroundColor: Colors.grey[700],
                  ),
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
