import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', height: 100),
            SizedBox(height: 40),
            TextField(decoration: InputDecoration(hintText: "Email", filled: true, fillColor: Colors.white10)),
            SizedBox(height: 15),
            TextField(obscureText: true, decoration: InputDecoration(hintText: "Password", filled: true, fillColor: Colors.white10)),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF008080), minimumSize: Size(double.infinity, 50)),
              onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen())),
              child: Text("LOGIN"),
            )
          ],
        ),
      ),
    );
  }
}
