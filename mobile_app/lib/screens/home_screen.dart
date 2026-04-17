import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("CureConnect", style: TextStyle(color: Color(0xFF008080))), backgroundColor: Colors.black),
      body: Center(
        child: Text("Monitoring System Active", style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );
  }
}
