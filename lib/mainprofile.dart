import 'package:flutter/material.dart';
import 'package:daely_proto_11/setting.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'dart:async';
// import 'dart:convert' show json;

// import 'package:flutter/services.dart' show rootBundle;

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final username = user?.displayName ?? 'Unknown User';
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // title: const Text('PROFILE PAGE'),
        backgroundColor: Colors
            .transparent, // set the app bar background color to transparent
        elevation: 0,

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
        backgroundColor: Colors.transparent,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.black),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox, color: Colors.black),
            label: 'Inbox',
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
            Navigator.pushNamed(context, '/inbox');
          }
        },
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
            child: Column(
              children: [
                // CircleAvatar(
                //   radius: 50.0,
                //   backgroundImage: AssetImage('assets/images/pic1.jpg'),
                // ),
                // SizedBox(height: 10.0),
                Text(
                  username,
                  style: const TextStyle(fontSize: 16),
                ),
                // Text(
                //   '0 follower',
                //   style: TextStyle(fontSize: 16.0),
                // ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: List.generate(4, (index) {
                return Container(
                  // margin: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent),
                  ),

                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            backgroundColor: Colors.transparent,
                            child: SizedBox(
                              height: 400.0,
                              width: 300.0,
                              child: GestureDetector(
                                onPanUpdate: (details) {
                                  if (details.delta.dx < 0) {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Dialog(
                                          backgroundColor: Colors.transparent,
                                          child: SizedBox(
                                            height: 400.0,
                                            width: 300.0,
                                            child: Image.asset(
                                                'assets/images/pic${index - 1}.jpg'),
                                          ),
                                        );
                                      },
                                    );
                                  } else if (details.delta.dx > 0) {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Dialog(
                                          backgroundColor: Colors.transparent,
                                          child: SizedBox(
                                            height: 400.0,
                                            width: 300.0,
                                            child: Image.asset(
                                                'assets/images/pic${index + 2}.jpg'),
                                          ),
                                        );
                                      },
                                    );
                                  }
                                },
                                child: Image.asset(
                                    'assets/images/pic${index + 1}.jpg'),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Image.asset(
                      'assets/images/pic${index + 1}.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
