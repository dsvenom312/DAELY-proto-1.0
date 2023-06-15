// ignore_for_file: unnecessary_type_check

import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ImageListPage extends StatefulWidget {
  const ImageListPage({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ImageListPageState createState() => _ImageListPageState();
}

class _ImageListPageState extends State<ImageListPage> {
  // ignore: deprecated_member_use
  final databaseReference = FirebaseDatabase.instance.reference();
  List<String> _imageURLs = [];
  List<String> _userEmails = [];
  int _currentIndex = 0;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _fetchImageData();
  }

  void _onItemTapped(int index) {
    if (index == 0) {
      // Navigate to Profile page on index 2
      Navigator.pushNamed(context, '/search');
    } else if (index == 1) {
      Navigator.pushNamed(context, '/shop');
    } else if (index == 2) {
      Navigator.pushNamed(context, '/upload');
    } else if (index == 3) {
      Navigator.pushNamed(context, '/inbox');
    } else if (index == 4) {
      Navigator.pushNamed(context, '/profile');
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  Future<void> _fetchImageData() async {
    final dataSnapshot = await databaseReference.child('users').get();
    if (dataSnapshot.value != null) {
      final users = Map<String, dynamic>.from(
          dataSnapshot.value as Map<dynamic, dynamic>);
      final imageUrls = <String>[];
      final userEmails = <String>[];

      users.forEach((key, value) {
        final userPhotos = value['photos'] as Map<dynamic, dynamic>?;
        if (userPhotos != null) {
          userPhotos.forEach((imageUID, imageData) {
            final imageUrl = imageData['image_url'] as String?;
            if (imageUrl != null) {
              imageUrls.add(imageUrl);
              userEmails.add(value['email'] as String);
            }
          });
        }
      });

      setState(() {
        _imageURLs = imageUrls;
        _userEmails = userEmails;
        _currentIndex = 0; // Reset the current index
      });
    }
  }

  Future<String?> _fetchDescriptions(String imageUrl) async {
    final dataSnapshot = await databaseReference.child('users').get();
    if (dataSnapshot.value != null) {
      final users = Map<String, dynamic>.from(
          dataSnapshot.value as Map<dynamic, dynamic>);

      for (final user in users.values) {
        final userPhotos = user['photos'] as Map<dynamic, dynamic>?;
        if (userPhotos != null) {
          for (final photo in userPhotos.values) {
            final photoUrl = photo['image_url'] as String?;
            final description = photo['descriptions'] as String?;
            if (photoUrl == imageUrl && description != null) {
              return description;
            }
          }
        }
      }
    }

    return null; // Return null if no description is found
  }

  void _showSubPhotoModal(BuildContext context, String imageUrl) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return FutureBuilder<String?>(
          future: _fetchDescriptions(imageUrl),
          builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox(
                height: 200,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (snapshot.hasError) {
              return const SizedBox(
                height: 200,
                child: Center(
                  child: Text('Error fetching descriptions'),
                ),
              );
            } else {
              final description = snapshot.data;

              return Container(
                height: 200,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              imageUrl,
                              fit: BoxFit.cover,
                              height: 150,
                              width: 150,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              description ?? '',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        final userEmail = _userEmails[_currentIndex];
                        _addToCart(imageUrl, description!, userEmail);
                        Navigator.pop(context); // Close the modal
                      },
                      icon: const Icon(Icons.shopping_cart),
                      label: const Text(''),
                    ),
                  ],
                ),
              );
            }
          },
        );
      },
    );
  }

  String _getUidFromEmail(String email) {
    return email.replaceAll('.', '_');
  }

  // void _addToCart(String imageUrl, String description, String email) {
  //   final uid = _getUidFromEmail(email);
  //   final cartRef =
  //       databaseReference.child('users').child(uid).child('cart_box');

  //   cartRef
  //       .once()
  //       .then((DataSnapshot snapshot) {
  //         if (snapshot.value != null) {
  //           // 'cart_box' exists, add the item to the existing cart
  //           cartRef.push().set({
  //             'image_url': imageUrl,
  //             'descriptions': description,
  //           }).then((_) {
  //             // Item added successfully
  //             ScaffoldMessenger.of(context).showSnackBar(
  //               const SnackBar(content: Text('Added to cart')),
  //             );
  //           }).catchError((error) {
  //             // Error occurred while adding the item
  //             ScaffoldMessenger.of(context).showSnackBar(
  //               const SnackBar(content: Text('Failed to add to cart')),
  //             );
  //           });
  //         } else {
  //           // 'cart_box' doesn't exist, create the directory and add the item
  //           cartRef.set({
  //             'image_url': imageUrl,
  //             'descriptions': description,
  //           }).then((_) {
  //             // Item added successfully
  //             ScaffoldMessenger.of(context).showSnackBar(
  //               const SnackBar(content: Text('Added to cart')),
  //             );
  //           }).catchError((error) {
  //             // Error occurred while adding the item
  //             ScaffoldMessenger.of(context).showSnackBar(
  //               const SnackBar(content: Text('Failed to add to cart')),
  //             );
  //           });
  //         }
  //       } as FutureOr Function(DatabaseEvent value))
  //       .catchError((error) {
  //     // Error occurred while retrieving 'cart_box' snapshot
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Failed to add to cart')),
  //     );
  //   }, test: (error) => error is Object);
  // }

  void _addToCart(String imageUrl, String description, String email) {
    final uid = _getUidFromEmail(email);
    final cartRef =
        databaseReference.child('users').child(uid).child('cart_box');

    cartRef.once().then(
        (DataSnapshot snapshot) {
          if (snapshot.value != null) {
            final cartItems = Map<String, dynamic>.from(
                snapshot.value as Map<dynamic, dynamic>);
            final cartItem = {
              'image_url': imageUrl,
              'descriptions': description,
            };

            cartItems[DateTime.now().millisecondsSinceEpoch.toString()] =
                cartItem;

            cartRef.set(cartItems).then((_) {
              // Item added successfully
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Added to cart')),
              );
            }).catchError((error) {
              // Error occurred while adding the item
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Failed to add to cart')),
              );
            });
          } else {
            final cartItem = {
              'image_url': imageUrl,
              'descriptions': description,
            };

            final cartItems = {
              DateTime.now().millisecondsSinceEpoch.toString(): cartItem,
            };

            cartRef.set(cartItems).then((_) {
              // Item added successfully
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Added to cart')),
              );
            }).catchError((error) {
              // Error occurred while adding the item
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Failed to add to cart')),
              );
            });
          }
        } as FutureOr Function(DatabaseEvent value), onError: (error) {
      // Error occurred while retrieving 'cart_box' snapshot
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to add to cart')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: _imageURLs.length,
              controller: PageController(initialPage: _currentIndex),
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                final imageUrl = _imageURLs[index];
                final userEmail = _userEmails[index];

                return GestureDetector(
                  onTap: () {
                    _showSubPhotoModal(context, imageUrl);
                  },
                  child: Stack(
                    children: [
                      Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                      Positioned.fill(
                        child: Container(
                          padding: const EdgeInsets.only(top: 650, left: 20),
                          alignment: Alignment.topLeft,
                          child: Text(
                            userEmail,
                            style: const TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Transform.scale(
              scale: 1.8,
              child: const Icon(Icons.file_upload_outlined),
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
