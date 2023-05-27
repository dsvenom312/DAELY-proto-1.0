// // import 'dart:async';
// // import 'dart:convert' show json;

// // import 'package:flutter/services.dart' show rootBundle;
// // import 'package:flutter/material.dart';
// // import 'package:daely_proto_11/setting.dart';
// // import 'package:daely_proto_11/mainprofile.dart';

// // class SwipeableImagePage extends StatefulWidget {
// //   const SwipeableImagePage({Key? key}) : super(key: key);

// //   @override
// //   // ignore: library_private_types_in_public_api
// //   _SwipeableImagePageState createState() => _SwipeableImagePageState();
// // }

// // class _SwipeableImagePageState extends State<SwipeableImagePage> {
// //   List<String> _imagePaths = [];
// //   int _selectedIndex = 0;
// //   bool _showOverlaycomment = false;
// //   bool _showOverlayshop = false;
// //   bool _showOverlaylike = false;
// //   bool _showOverlayshare = false;

// //   void _onItemTapped(int index) {
// //     if (index == 2) {
// //       // Navigate to Profile page on index 2
// //       Navigator.pushNamed(context, '/register');
// //     } else if (index == 0) {
// //       Navigator.pushNamed(context, '/login');
// //     } else if (index == 1) {
// //       Navigator.pushNamed(context, '/upload');
// //     } else {
// //       setState(() {
// //         _selectedIndex = index;
// //       });
// //     }
// //   }

// //   Future<List<String>> _getImagesFromAssets() async {
// //     final manifestJson = await rootBundle.loadString('AssetManifest.json');
// //     final Map<String, dynamic> manifestMap = json.decode(manifestJson);

// //     final imagePaths = manifestMap.keys
// //         .where((String key) => key.contains('assets/images/pic'))
// //         .toList();

// //     return imagePaths;
// //   }

// //   @override
// //   void initState() {
// //     super.initState();
// //     _getImagesFromAssets().then((imagePaths) {
// //       setState(() {
// //         _imagePaths = imagePaths;
// //       });
// //     });

// //     for (int i = 1; i <= _imagePaths.length; i++) {
// //       _imagePaths.add('assets/images/pic$i.jpg');
// //     }
// //   }

// //   int currIndex = 0;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       extendBodyBehindAppBar: true,
// //       appBar: AppBar(
// //         // title: const Text('@ACCOUNT'),
// //         // leading: Image.asset('assets/images/daely1.png'),

// //         backgroundColor: Colors
// //             .transparent, // set the app bar background color to transparent
// //         elevation: 0,
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.settings),
// //             onPressed: () {
// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(builder: (context) => const MySetting()),
// //               );
// //             },
// //           ),
// //         ], // Change the color to black
// //       ),
// //       body: Stack(
// //         children: [
// //           Column(
// //             children: [
// //               Expanded(
// //                 child: PageView.builder(
// //                   scrollDirection: Axis.horizontal,
// //                   itemBuilder: (BuildContext context, int currIndex) {
// //                     return Stack(
// //                       children: [
// //                         GestureDetector(
// //                           onDoubleTap: () {
// //                             setState(() {
// //                               _showOverlaylike = !_showOverlaylike;
// //                             });
// //                           },
// //                           child: Image.asset(
// //                             _imagePaths[currIndex % _imagePaths.length],
// //                             fit: BoxFit.cover,
// //                             height: double.infinity,
// //                             width: double.infinity,
// //                           ),
// //                         ),
// //                         Padding(
// //                           padding: const EdgeInsets.only(top: 650, left: 20),
// //                           child: GestureDetector(
// //                             child: Text(
// //                               '@ACCOUNT ${currIndex % _imagePaths.length + 1}',
// //                               style: const TextStyle(
// //                                   fontSize: 20.0, color: Colors.white),
// //                             ),
// //                             onTap: () {
// //                               Navigator.push(
// //                                 context,
// //                                 MaterialPageRoute(
// //                                     builder: (context) =>
// //                                         const MyProfilePage()),
// //                               );
// //                             },
// //                           ),
// //                         ),
// //                         if (_showOverlaycomment)
// //                           Positioned.fill(
// //                             child: GestureDetector(
// //                               onTap: () {
// //                                 setState(() {
// //                                   _showOverlaycomment = false;
// //                                 });
// //                               },
// //                               child: Container(
// //                                 color: Colors.black54,
// //                                 alignment: Alignment.center,
// //                                 child: const Text(
// //                                   'comment',
// //                                   style: TextStyle(
// //                                     color: Colors.white,
// //                                     fontSize: 24,
// //                                     fontWeight: FontWeight.bold,
// //                                   ),
// //                                 ),
// //                               ),
// //                             ),
// //                           ),
// //                         Positioned(
// //                           bottom: 200,
// //                           right: 30,
// //                           child: IconButton(
// //                             icon: const Icon(Icons.format_list_bulleted_add,
// //                                 color: Colors.white,
// //                                 size: 40.0 // Set the color here
// //                                 ),
// //                             onPressed: () {
// //                               setState(() {
// //                                 _showOverlaycomment = !_showOverlaycomment;
// //                               });
// //                             },
// //                           ),
// //                         ),
// //                         if (_showOverlayshop)
// //                           Positioned.fill(
// //                             child: GestureDetector(
// //                               onTap: () {
// //                                 setState(() {
// //                                   _showOverlayshop = false;
// //                                 });
// //                               },
// //                               child: Container(
// //                                 color: Colors.black54,
// //                                 alignment: Alignment.center,
// //                                 child: const Text(
// //                                   'shop',
// //                                   style: TextStyle(
// //                                     color: Colors.white,
// //                                     fontSize: 24,
// //                                     fontWeight: FontWeight.bold,
// //                                   ),
// //                                 ),
// //                               ),
// //                             ),
// //                           ),
// //                         Positioned(
// //                           bottom: 50,
// //                           right: 30,
// //                           child: IconButton(
// //                             icon: const Icon(Icons.shopping_bag_outlined,
// //                                 color: Colors.white,
// //                                 size: 40.0 // Set the color here
// //                                 ),
// //                             onPressed: () {
// //                               setState(() {
// //                                 _showOverlayshop = !_showOverlayshop;
// //                               });
// //                             },
// //                           ),
// //                         ),
// //                         if (_showOverlaylike)
// //                           Positioned.fill(
// //                             child: GestureDetector(
// //                               onTap: () {
// //                                 setState(() {
// //                                   _showOverlaylike = false;
// //                                 });
// //                               },
// //                               // child: Container(
// //                               //   color: Colors.black54,
// //                               //   alignment: Alignment.center,
// //                               //   child: const Text(
// //                               //     'like',
// //                               //     style: TextStyle(
// //                               //       color: Colors.white,
// //                               //       fontSize: 24,
// //                               //       fontWeight: FontWeight.bold,
// //                               //     ),
// //                               //   ),
// //                               // ),
// //                             ),
// //                           ),
// //                         Positioned(
// //                           bottom: 275,
// //                           right: 30,
// //                           child: IconButton(
// //                             icon: _showOverlaylike
// //                                 ? const Icon(Icons.favorite,
// //                                     color: Colors.red, size: 40.0)
// //                                 : const Icon(Icons.favorite_border,
// //                                     color: Colors.white, size: 40.0),
// //                             onPressed: () {
// //                               setState(() {
// //                                 _showOverlaylike = !_showOverlaylike;
// //                               });
// //                             },
// //                           ),
// //                         ),
// //                         if (_showOverlayshare)
// //                           Positioned.fill(
// //                             child: GestureDetector(
// //                               onTap: () {
// //                                 setState(() {
// //                                   _showOverlayshare = false;
// //                                 });
// //                               },
// //                               child: Container(
// //                                 color: Colors.black54,
// //                                 alignment: Alignment.center,
// //                                 child: const Text(
// //                                   'share',
// //                                   style: TextStyle(
// //                                     color: Colors.white,
// //                                     fontSize: 24,
// //                                     fontWeight: FontWeight.bold,
// //                                   ),
// //                                 ),
// //                               ),
// //                             ),
// //                           ),
// //                         Positioned(
// //                           bottom: 125,
// //                           right: 30,
// //                           child: IconButton(
// //                             icon: const Icon(Icons.share_rounded,
// //                                 color: Colors.white,
// //                                 size: 40.0 // Set the color here
// //                                 ),
// //                             onPressed: () {
// //                               setState(() {
// //                                 _showOverlayshare = !_showOverlayshare;
// //                               });
// //                             },
// //                           ),
// //                         ),
// //                       ],
// //                     );
// //                   },
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //       bottomNavigationBar: BottomNavigationBar(
// //         backgroundColor: Colors.transparent, // Change the color to black
// //         selectedItemColor: Colors.black,
// //         unselectedItemColor: Colors.black,
// //         elevation: 0,
// //         items: const [
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.search),
// //             label: 'Search',
// //           ),
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.file_upload_outlined, color: Colors.black),
// //             label: 'upload',
// //           ),
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.person, color: Colors.black),
// //             label: 'Profile',
// //           ),
// //         ],
// //         currentIndex: _selectedIndex,
// //         onTap: _onItemTapped,
// //       ),
// //     );
// //   }
// // }

// -----------------------------------------------------------------------------------

import 'dart:async';

import 'package:daely_proto_11/mainprofile.dart';
import 'package:daely_proto_11/setting.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';

class SwipeableImagePage extends StatefulWidget {
  const SwipeableImagePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SwipeableImagePageState createState() => _SwipeableImagePageState();
}

class _SwipeableImagePageState extends State<SwipeableImagePage> {
  List<String> _imagePaths = [];
  int _selectedIndex = 0;
  bool _showOverlaycomment = false;
  bool _showOverlayshop = false;
  bool _showOverlaylike = false;
  bool _showOverlayshare = false;

  Future<List<String>> _getImagesFromFirebase() async {
    final List<String> imagePaths = [];
    final firebase_storage.ListResult listResult =
        await firebase_storage.FirebaseStorage.instance.ref('images').listAll();

    for (final firebase_storage.Reference ref in listResult.items) {
      final url = await ref.getDownloadURL();
      imagePaths.add(url);
    }

    return imagePaths;
  }

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().then((_) {
      _getImagesFromFirebase().then((imagePaths) {
        setState(() {
          _imagePaths = imagePaths;
        });
      });
    });
  }

  void _onItemTapped(int index) {
    if (index == 2) {
      // Navigate to Profile page on index 2
      Navigator.pushNamed(context, '/profile');
    } else if (index == 0) {
      Navigator.pushNamed(context, '/test');
    } else if (index == 1) {
      Navigator.pushNamed(context, '/upload');
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // title: const Text('@ACCOUNT'),
        // leading: Image.asset('assets/images/daely1.png'),

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
        ], // Change the color to black
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int currIndex) {
                    return Stack(
                      children: [
                        GestureDetector(
                          onDoubleTap: () {
                            setState(() {
                              _showOverlaylike = !_showOverlaylike;
                            });
                          },
                          child: Image.network(
                            _imagePaths[currIndex % _imagePaths.length],
                            fit: BoxFit.cover,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 650, left: 20),
                          child: GestureDetector(
                            child: Text(
                              '@ACCOUNT ${currIndex % _imagePaths.length + 1}',
                              style: const TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MyProfilePage(),
                                ),
                              );
                            },
                          ),
                        ),
                        if (_showOverlaycomment)
                          Positioned.fill(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showOverlaycomment = false;
                                });
                              },
                              child: Container(
                                color: Colors.black54,
                                alignment: Alignment.center,
                                child: const Text(
                                  'comment',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Positioned(
                          bottom: 200,
                          right: 30,
                          child: IconButton(
                            icon: const Icon(Icons.format_list_bulleted_add,
                                color: Colors.white,
                                size: 40.0 // Set the color here
                                ),
                            onPressed: () {
                              setState(() {
                                _showOverlaycomment = !_showOverlaycomment;
                              });
                            },
                          ),
                        ),
                        if (_showOverlayshop)
                          Positioned.fill(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showOverlayshop = false;
                                });
                              },
                              child: Container(
                                color: Colors.black54,
                                alignment: Alignment.center,
                                child: const Text(
                                  'shop',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Positioned(
                          bottom: 50,
                          right: 30,
                          child: IconButton(
                            icon: const Icon(Icons.shopping_bag_outlined,
                                color: Colors.white,
                                size: 40.0 // Set the color here
                                ),
                            onPressed: () {
                              setState(() {
                                _showOverlayshop = !_showOverlayshop;
                              });
                            },
                          ),
                        ),
                        if (_showOverlaylike)
                          Positioned.fill(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showOverlaylike = false;
                                });
                              },
                            ),
                          ),
                        Positioned(
                          bottom: 275,
                          right: 30,
                          child: IconButton(
                            icon: _showOverlaylike
                                ? const Icon(Icons.favorite,
                                    color: Colors.red, size: 40.0)
                                : const Icon(Icons.favorite_border,
                                    color: Colors.white, size: 40.0),
                            onPressed: () {
                              setState(() {
                                _showOverlaylike = !_showOverlaylike;
                              });
                            },
                          ),
                        ),
                        if (_showOverlayshare)
                          Positioned.fill(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showOverlayshare = false;
                                });
                              },
                              child: Container(
                                color: Colors.black54,
                                alignment: Alignment.center,
                                child: const Text(
                                  'share',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Positioned(
                          bottom: 125,
                          right: 30,
                          child: IconButton(
                            icon: const Icon(Icons.share_rounded,
                                color: Colors.white,
                                size: 40.0 // Set the color here
                                ),
                            onPressed: () {
                              setState(() {
                                _showOverlayshare = !_showOverlayshare;
                              });
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent, // Change the color to black
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_upload_outlined, color: Colors.black),
            label: 'upload',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
