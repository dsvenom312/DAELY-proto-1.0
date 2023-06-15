import 'package:daely_proto_11/explore.dart';
import 'package:daely_proto_11/homescreen.dart';
import 'package:daely_proto_11/inbox.dart';
import 'package:daely_proto_11/login.dart';
import 'package:daely_proto_11/mainmenu.dart';
import 'package:daely_proto_11/mainprofile.dart';
import 'package:daely_proto_11/register.dart';
import 'package:daely_proto_11/shop.dart';
import 'package:daely_proto_11/swipeabletest.dart';
import 'package:daely_proto_11/upload2.dart';
import 'package:daely_proto_11/uploadprofile.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
// ignore: depend_on_referenced_packages

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DAELY',
      home: const MainMenu(),
      routes: {
        '/profile': (context) => const PhotoListPage(),
        '/search': (context) => const ExplorePage(),
        '/inbox': (context) => const MyInboxPage(),
        '/shop': (context) => const MyShopPage(),
        '/login': (context) => const LoginPage(),
        '/swipe': (context) => const SwipeableImagePage(),
        '/register': (context) => const RegisterPage(),
        '/upload': (context) => const PhotoUploader(),
        '/menu': (context) => const MainMenu(),
        '/test': (context) => const ImageListPage(),
        '/uploadprofile': (context) => const UploadProfilePage(),
      },
    );
  }
}
