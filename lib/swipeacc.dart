import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  bool _isLiked = false;

  void _handleDoubleTap() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  void _handleLike() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onDoubleTap: _handleDoubleTap,
        child: Stack(
          children: [
            // Your page content goes here
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
            ),
            Positioned(
              bottom: 16.0,
              right: 16.0,
              child: GestureDetector(
                onTap: _handleLike,
                child: Icon(
                  _isLiked ? Icons.favorite : Icons.favorite_border,
                  color: _isLiked ? Colors.red : Colors.grey,
                  size: 32.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
