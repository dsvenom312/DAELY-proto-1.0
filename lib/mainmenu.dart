import 'package:flutter/material.dart';
import 'package:daely_proto_11/register.dart';
import 'package:daely_proto_11/login.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        color: Colors.grey[700], // Set the background color to grey
        padding: const EdgeInsets.all(110.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/daely1.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20.0), // Adjust the spacing as needed
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.grey[200], // Set the button color to grey
              ),
              child: Text(
                'Register',
                style: TextStyle(
                    color: Colors.grey[700]), // Set text color to grey
              ),
            ),
            const SizedBox(height: 10.0), // Adjust the spacing as needed
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.grey[200], // Set the button color to grey
              ),
              child: Text(
                'Login',
                style: TextStyle(
                    color: Colors.grey[700]), // Set text color to grey
              ),
            ),
          ],
        ),
      ),
    );
  }
}
